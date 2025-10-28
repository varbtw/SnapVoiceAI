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
    
    // Check if there's a person in the scene
    const hasPeople = sceneAnalysis && (
        sceneAnalysis.toLowerCase().includes("person") ||
        sceneAnalysis.toLowerCase().includes("people") ||
        sceneAnalysis.toLowerCase().includes("they're") ||
        sceneAnalysis.toLowerCase().includes("he ") ||
        sceneAnalysis.toLowerCase().includes("she ")
    );
    
    let systemPrompt = "You are a real-time conversational AI assistant for AR glasses. Your role is to help users understand conversations and respond appropriately by providing brief, natural conversation suggestions.";
    
    if (hasPeople) {
        // Person in frame - focus on conversation suggestions
        if (sceneAnalysis && sceneAnalysis.length > 0) {
            systemPrompt += ` The user can see and is talking with: ${sceneAnalysis}.`;
        }
        systemPrompt += " Give suggestions for what the user should SAY TO THE PERSON they're talking with. Base your suggestions on the conversation context and what you observe about the person. Keep suggestions under 12 words, natural, and conversational.";
    } else {
        // No person in frame - focus on scene analysis and observations
        if (sceneAnalysis && sceneAnalysis.length > 0) {
            systemPrompt += ` The user is looking at: ${sceneAnalysis}.`;
        }
        systemPrompt += " Analyze what the user is seeing - their environment, objects, lighting, layout, and any notable details. Help them understand or discuss what they're observing. Keep responses under 12 words, natural, and insightful.";
    }
    
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
        sceneAnalysis.toLowerCase().includes("she ")
    );
    
    if (hasTranscript) {
        // User spoke - give them a suggestion based on the conversation
        let p = `The user said: "${transcript}"\n`;
        
        // Add emotion context
        if (emotion && emotion !== "Neutral") {
            p += `User's emotional tone: ${emotion}\n`;
        }
        
        // Add visual scene context
        if (sceneAnalysis && sceneAnalysis.length > 0) {
            p += `Context: ${sceneAnalysis}\n`;
        }
        
        if (hasPeople) {
            p += "\nA person is in the scene and the user is conversing with them. Suggest what the user should say next to continue the conversation naturally. Make it relevant to what was said and what you observe about the person. Keep it under 12 words.\n";
        } else {
            p += "\nNo person in view - the user is observing their environment. Analyze what they're seeing and suggest what they could comment on or notice. Help them understand their surroundings. Keep it under 12 words.\n";
        }
        return p;
    }
    
    return "Provide a suggestion (12 words max).\n";
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

