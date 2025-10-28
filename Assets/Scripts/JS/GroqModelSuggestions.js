// @input Component.Text suggestionText {"hint":"Text to display suggestion"}
// @input Component.Text statusText {"hint":"Optional status text UI"}
// @input Component.ScriptComponent rekaEmotionScript {"hint":"Drag the RekaEmotionAnalyzer script component"}
// @input Component.ScriptComponent groqSceneAnalyzerScript {"hint":"Drag the GroqSceneAnalyzer script component"}
// @input string groqApiKey {"hint":"Groq API Key"}
// @input string groqModel = "llama-3.1-8b-instant" {"hint":"Groq model"}
// @input float minInterval = 5.0 {"hint":"Min seconds between suggestions"}
// @input bool enableDebug = true
// @input int maxHistorySize = 25 {"hint":"Max conversation history items (~12 exchanges)"}
// @input float sceneCheckInterval = 8.0 {"hint":"Seconds between scene-only suggestion checks"}
// @input bool enableSceneOnlySuggestions = true {"hint":"Enable suggestions when only scene data is available"}

const Internet = require("LensStudio:InternetModule");

let lastSuggestionTime = 0.0;
let isProcessing = false;
let pendingTranscript = "";
let lastUserTranscript = ""; // Store the user's actual question for Tavily
let conversationHistory = []; // Store conversation history [{role: "user", content: "..."}, {role: "assistant", content: "..."}]
let lastSceneAnalysis = "";

script.createEvent("OnStartEvent").bind(function() {
    safeLog("✅ GroqModelSuggestions initialized");

    // Subscribe to VoiceML updates directly (like Claude version)
    try {
        const VoiceMLModule = require("LensStudio:VoiceMLModule");
        VoiceMLModule.onListeningUpdate.add(function(eventData) {
            handleListeningUpdate(eventData);
        });
        safeLog("🎧 Subscribed to VoiceML onListeningUpdate");
    } catch (e) {
        safeLog("⚠️ VoiceMLModule not available: " + e);
    }
    
    // Start scene-only suggestions
    if (script.enableSceneOnlySuggestions) {
        scheduleSceneCheck();
    }
});

function handleListeningUpdate(eventData) {
    // Log for debugging
    if (eventData && eventData.transcription) {
        safeLog("📝 STT update | final=" + eventData.isFinalTranscription + " | text='" + eventData.transcription + "'");
    }

    // Only act on final transcriptions
    if (!eventData || !eventData.isFinalTranscription || !eventData.transcription) {
        return;
    }

    pendingTranscript = (eventData.transcription || "").trim();
    if (pendingTranscript.length === 0) {
        return;
    }
    
    // Store the user's transcript for Tavily to use
    lastUserTranscript = pendingTranscript;
    safeLog("📝 Stored user transcript for Tavily: " + lastUserTranscript);

    const now = getTime();
    if (now - lastSuggestionTime < Math.max(1.0, script.minInterval)) {
        safeLog("⏳ Throttled; waiting min interval before next suggestion");
        return;
    }

    // Pull emotion from RekaEmotionAnalyzer if available
    const emotion = getCurrentEmotionSafe();
    // Pull scene analysis from GroqSceneAnalyzer if available
    const sceneAnalysis = getCurrentSceneAnalysisSafe();
    
    requestGroqSuggestion(pendingTranscript, emotion, sceneAnalysis);
}

function scheduleSceneCheck() {
    const delayedEvent = script.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function() {
        checkForSceneOnlySuggestion();
        scheduleSceneCheck(); // Continue the loop
    });
    delayedEvent.reset(script.sceneCheckInterval);
}

function checkForSceneOnlySuggestion() {
    const now = getTime();
    if (now - lastSuggestionTime < Math.max(1.0, script.minInterval)) {
        return;
    }
    
    if (isProcessing) {
        return;
    }
    
    const sceneAnalysis = getCurrentSceneAnalysisSafe();
    if (sceneAnalysis && sceneAnalysis.length > 0 && sceneAnalysis !== "Analyzing...") {
        if (sceneAnalysis !== lastSceneAnalysis) {
            lastSceneAnalysis = sceneAnalysis;
            requestGroqSuggestion("", "Neutral", sceneAnalysis);
        }
    }
}

function getCurrentEmotionSafe() {
    try {
        if (script.rekaEmotionScript && script.rekaEmotionScript.api && script.rekaEmotionScript.api.getCurrentEmotion) {
            const e = script.rekaEmotionScript.api.getCurrentEmotion();
            if (e && typeof e === 'string') {
                return e;
            }
        }
    } catch (e) {
        safeLog("⚠️ Failed to get emotion from Reka: " + e);
    }
    return "Neutral";
}

function getCurrentSceneAnalysisSafe() {
    try {
        if (script.groqSceneAnalyzerScript && script.groqSceneAnalyzerScript.api && script.groqSceneAnalyzerScript.api.getCurrentAnalysis) {
            const scene = script.groqSceneAnalyzerScript.api.getCurrentAnalysis();
            if (scene && typeof scene === 'string' && scene.length > 0) {
                return scene;
            }
        }
    } catch (e) {
        safeLog("⚠️ Failed to get scene analysis from Groq: " + e);
    }
    return "";
}

async function requestGroqSuggestion(transcript, emotion, sceneAnalysis) {
    if (isProcessing) {
        safeLog("⏸️ Already processing a suggestion");
        return;
    }
    if (!script.groqApiKey || script.groqApiKey.length === 0) {
        safeLog("❗ Missing Groq API Key");
        return;
    }

    isProcessing = true;
    lastSuggestionTime = getTime();
    setStatus("💭 Thinking...");

    safeLog("🤖 SENDING TO GROQ");
    safeLog("📝 Transcript: " + transcript);
    safeLog("😊 Emotion: " + emotion);
    safeLog("👁️ Scene Analysis: " + (sceneAnalysis || "No scene data"));

    const prompt = buildPrompt(transcript, emotion, sceneAnalysis);
    const apiKey = script.groqApiKey.trim();

    let messages = [];
    if (conversationHistory.length > 0) {
        messages = messages.concat(conversationHistory);
    }
    messages.push({ role: "user", content: prompt });
    
    let systemPrompt = "You are a real-time conversational AI assistant for AR glasses. Your role is to help users understand conversations and respond appropriately by providing brief, natural conversation suggestions.";
    
    if (sceneAnalysis && sceneAnalysis.length > 0) {
        systemPrompt += ` The user can see: ${sceneAnalysis}. Use this visual context to make suggestions.`;
    }
    
    systemPrompt += " If there's a PERSON in the scene, give suggestions for what to SAY TO THEM based on what you observe about them. If there's no person, help the user think about or discuss what they're seeing. Keep suggestions under 12 words, natural, and conversational.";
    
    const payload = {
        model: script.groqModel || "llama-3.1-8b-instant",
        max_tokens: 50,
        temperature: 0.7,
        messages: [
            { role: "system", content: systemPrompt },
            ...messages
        ]
    };

    try {
        safeLog("📤 Sending request to Groq API...");
        const resp = await Internet.fetch(new Request("https://api.groq.com/openai/v1/chat/completions", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${apiKey}`
            },
            body: JSON.stringify(payload)
        }));

        safeLog("📥 Groq status: " + resp.status);
        if (resp.status !== 200) {
            const t = await resp.text();
            safeLog("❗ Groq error: " + t);
            setStatus("⚠️ Error");
            isProcessing = false;
            return;
        }

        const data = await resp.json();
        let suggestion = extractGroqText(data) || "";
        suggestion = (suggestion || "").trim();
        if (suggestion.length === 0) {
            setStatus("⚠️ No suggestion");
            isProcessing = false;
            return;
        }

        safeLog("💡 GROQ SUGGESTION:");
        safeLog(suggestion);

        // Store this exchange in conversation history
        addToConversationHistory(transcript, suggestion);
    
        updateSuggestionDisplay(suggestion);
        setStatus("🎯 Ready");
    } catch (e) {
        safeLog("❗ Groq exception: " + e);
        setStatus("⚠️ Error");
    } finally {
        isProcessing = false;
    }
}

function buildPrompt(transcript, emotion, sceneAnalysis) {
    const hasTranscript = transcript && transcript.trim().length > 0;
    
    // Check if scene contains people by looking for common indicators
    const hasPeople = sceneAnalysis && (
        sceneAnalysis.toLowerCase().includes("person") ||
        sceneAnalysis.toLowerCase().includes("people") ||
        sceneAnalysis.toLowerCase().includes("they're") ||
        sceneAnalysis.toLowerCase().includes("he ") ||
        sceneAnalysis.toLowerCase().includes("she ") ||
        sceneAnalysis.toLowerCase().includes("wearing") ||
        sceneAnalysis.toLowerCase().includes("smiling") ||
        sceneAnalysis.toLowerCase().includes("looking") ||
        sceneAnalysis.toLowerCase().includes("talking") ||
        sceneAnalysis.toLowerCase().includes("speaking")
    );
    
    if (hasTranscript) {
        // User spoke
        let p = `The user said: "${transcript}"\n`;
        
        // Add emotion context
        if (emotion && emotion !== "Neutral") {
            p += `User's emotional tone: ${emotion}\n`;
        }
        
        // Add visual scene context
        if (sceneAnalysis && sceneAnalysis.length > 0) {
            p += `What they're seeing: ${sceneAnalysis}\n`;
        }
        
        // Adjust prompt based on whether people are present
        if (hasPeople) {
            p += "\nThere is a PERSON in the scene. As a conversational assistant, suggest what the user could say TO THAT PERSON to continue or enhance the conversation. Make it relevant to what you see about them. Keep it natural (12 words max).\n";
        } else if (sceneAnalysis && sceneAnalysis.length > 0) {
            p += "\nAs a conversational assistant, suggest what the user could say next about what they're seeing. Keep it natural (12 words max).\n";
        } else {
            p += "\nAs a conversational assistant, suggest what they could say next to continue or enhance this conversation. Keep it natural (12 words max).\n";
        }
        return p;
    } else {
        // No transcript - scene only
        if (sceneAnalysis && sceneAnalysis.length > 0) {
            let p = `The user is looking at this scene: ${sceneAnalysis}\n`;
            
            // Adjust prompt based on whether people are present
            if (hasPeople) {
                p += "\nThere is a PERSON in the scene. As a conversational assistant, suggest what the user could say TO THAT PERSON to start an engaging conversation. Make it relevant to what you see about them (their appearance, what they're doing, etc.). Keep it natural (12 words max).\n";
            } else {
                p += "\nAs a conversational assistant, suggest what the user could say or think about what they're seeing. Help them engage with the environment. Keep it natural (12 words max).\n";
            }
            return p;
        }
    }
    
    return "Suggest a natural conversational response (12 words max).\n";
}


function extractGroqText(data) {
    try {
        if (data && data.choices && data.choices.length > 0) {
            const message = data.choices[0].message;
            if (message && message.content) {
                return message.content.trim();
            }
        }
        if (data?.text && typeof data.text === 'string') { 
            return data.text; 
        }
    } catch (e) {
        safeLog("Failed to parse Groq response: " + e);
    }
    return "";
}

function addToConversationHistory(userMessage, assistantResponse) {
    conversationHistory.push({
        role: "user",
        content: userMessage
    });
    
    conversationHistory.push({
        role: "assistant",
        content: assistantResponse
    });
    
    if (conversationHistory.length > script.maxHistorySize) {
        const removeCount = conversationHistory.length - script.maxHistorySize;
        conversationHistory = conversationHistory.slice(removeCount);
    }
}

function clearConversationHistory() {
    conversationHistory = [];
    safeLog("🗑️ Conversation history cleared");
}

function updateSuggestionDisplay(s) {
    if (script.suggestionText) {
        script.suggestionText.text = "💡 " + s;
        script.suggestionText.textFill.color = new vec4(1.0, 0.84, 0.0, 1.0);
    }
}

function setStatus(s) {
    if (script.statusText) {
        script.statusText.text = s;
    }
}

function safeLog(msg) {
    if (script.enableDebug) { print(msg); }
}

// Optional external hook if another script wants to forward STT events directly
script.api.onTranscriptionUpdate = function(eventData) {
    handleListeningUpdate(eventData);
};

// Expose the user's transcript for Tavily to search
script.api.getUserTranscript = function() {
    return lastUserTranscript;
};

// Expose conversation history management
script.api.getConversationHistory = function() {
    return conversationHistory.slice(); // Return copy
};

script.api.clearConversationHistory = function() {
    clearConversationHistory();
};

script.api.getHistorySize = function() {
    return conversationHistory.length;
};

