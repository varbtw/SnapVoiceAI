// @input Component.Text suggestionText {"hint":"Text to display suggestion"}
// @input Component.Text statusText {"hint":"Optional status text UI"}
// @input Component.ScriptComponent rekaEmotionScript {"hint":"Drag the RekaEmotionAnalyzer script component"}
// @input Component.ScriptComponent groqSceneAnalyzerScript {"hint":"Drag the GroqSceneAnalyzer script component"}
// @input Component.Text snapchatSTTText {"hint":"Drag the SnapchatSTT outputText to monitor voice input"}
// @input string groqApiKey {"hint":"Groq API Key"}
// @input string groqModel = "llama-3.1-8b-instant" {"hint":"Groq model"}
// @input float minInterval = 5.0 {"hint":"Min seconds between suggestions"}
// @input bool enableDebug = true
// @input int maxHistorySize = 25 {"hint":"Max conversation history items (~12 exchanges)"}
// @input float sceneCheckInterval = 100.0 {"hint":"Seconds between scene-only suggestion checks"}
// @input bool enableSceneOnlySuggestions = true {"hint":"Enable suggestions when only scene data is available"}

const Internet = require("LensStudio:InternetModule");

let lastSuggestionTime = 0.0;
let isProcessing = false;
let pendingTranscript = "";
let lastUserTranscript = ""; // Store the user's actual question
let conversationHistory = []; // Store conversation history [{role: "user", content: "..."}, {role: "assistant", content: "..."}]
let lastSceneAnalysis = "";

script.createEvent("OnStartEvent").bind(function() {
    safeLog("GroqModelSuggestions initialized - API Key: " + (script.groqApiKey ? "SET" : "NOT SET"));

    // Subscribe to VoiceML updates
    const delayedSubscription = script.createEvent("DelayedCallbackEvent");
    delayedSubscription.bind(function() {
        try {
            const VoiceMLModule = require("LensStudio:VoiceMLModule");
            VoiceMLModule.onListeningUpdate.add(function(eventData) {
                handleListeningUpdate(eventData);
            });
        } catch (e) {
            safeLog("VoiceMLModule ERROR: " + e);
        }
    });
    delayedSubscription.reset(3.0);
    
    // Start voice input polling
    startVoiceInputPolling();
    
    // Start scene-only suggestions
    if (script.enableSceneOnlySuggestions) {
        scheduleSceneCheck();
    }
});

function handleListeningUpdate(eventData) {
    // Only process FINAL transcriptions
    if (!eventData || !eventData.transcription || !eventData.isFinalTranscription) {
        return;
    }

    pendingTranscript = (eventData.transcription || "").trim();
    
    if (pendingTranscript.length === 0) {
        return;
    }
    
    // Store the user's transcript
    lastUserTranscript = pendingTranscript;

    const now = getTime();
    const timeSinceLast = now - lastSuggestionTime;
    const minInterval = Math.max(1.0, script.minInterval);
    
    if (timeSinceLast < minInterval) {
        return;
    }

    // Pull emotion from RekaEmotionAnalyzer if available
    const emotion = getCurrentEmotionSafe();
    // Pull scene analysis from GroqSceneAnalyzer if available
    const sceneAnalysis = getCurrentSceneAnalysisSafe();
    
    requestGroqSuggestion(pendingTranscript, emotion, sceneAnalysis);
}

function startVoiceInputPolling() {
    if (script.snapchatSTTText) {
        safeLog("✅ SnapchatSTT text component connected");
    } else {
        safeLog("⚠️ No SnapchatSTT text component connected");
    }
    
    const updateEvent = script.createEvent("UpdateEvent");
    let lastPolledTranscript = "";
    
    updateEvent.bind(function() {
        if (!script.snapchatSTTText) {
            return;
        }
        
        const currentText = script.snapchatSTTText.text || "";
        
        // Only process FINAL transcriptions (those with ✅ prefix)
        if (currentText.indexOf("✅ ") === 0 && currentText !== lastPolledTranscript && currentText.length > 0) {
            // Extract the actual transcript
            let transcript = currentText.substring(2).trim();
            
            if (transcript && transcript.length > 0) {
                lastPolledTranscript = currentText;
                
                // Get emotion and scene
                const emotion = getCurrentEmotionSafe();
                const sceneAnalysis = getCurrentSceneAnalysisSafe();
                
                // Check throttling
                const now = getTime();
                const timeSinceLast = now - lastSuggestionTime;
                const minInterval = Math.max(0.5, script.minInterval);
                
                if (timeSinceLast >= minInterval) {
                    requestGroqSuggestion(transcript, emotion, sceneAnalysis);
                }
            }
        }
    });
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
    // Log raw inputs
    safeLog("📥 [RAW INPUTS]");
    safeLog("Transcript: '" + transcript + "'");
    safeLog("Emotion: " + emotion);
    safeLog("Scene Analysis: '" + (sceneAnalysis || "(none)") + "'");
    safeLog("========================================");
    
    if (isProcessing) {
        return;
    }
    
    if (!script.groqApiKey || script.groqApiKey.length === 0) {
        safeLog("Missing Groq API Key");
        return;
    }

    isProcessing = true;
    lastSuggestionTime = getTime();
    setStatus("💭 Thinking...");
    
    const prompt = buildPrompt(transcript, emotion, sceneAnalysis);
    const apiKey = script.groqApiKey.trim();

    let messages = [];
    if (conversationHistory.length > 0) {
        messages = messages.concat(conversationHistory);
    }
    messages.push({ role: "user", content: prompt });
    
    let systemPrompt = "You are a real-time conversation coach on Snap Spectacles AR glasses. You see through the user's first-person camera view. Generate SUGGESTIONS for what the user should SAY in response. DO NOT answer questions - suggest what THEY should say. 12 words max. Be brief and natural.";
    
    if (sceneAnalysis && sceneAnalysis.length > 0) {
        systemPrompt += ` Through the glasses camera, you see: ${sceneAnalysis}.`;
    }
    
    // Check if there's a person in the scene
    const hasPeople = sceneAnalysis && (
        sceneAnalysis.toLowerCase().includes("person") ||
        sceneAnalysis.toLowerCase().includes("people") ||
        sceneAnalysis.toLowerCase().includes("they're") ||
        sceneAnalysis.toLowerCase().includes("he ") ||
        sceneAnalysis.toLowerCase().includes("she ")
    );
    
    if (hasPeople) {
        systemPrompt += " There is a PERSON in view - they are the person the user is currently talking to. Suggest what the user should say to THAT PERSON based on what they heard. MAXIMUM 12 WORDS. Be brief.";
    } else if (sceneAnalysis && sceneAnalysis.length > 0) {
        systemPrompt += " No person in view - suggest what the user could comment about what they're seeing. MAXIMUM 12 WORDS.";
    } else {
        systemPrompt += " MAXIMUM 12 WORDS. Be brief.";
    }
    
    const payload = {
        model: script.groqModel || "llama-3.1-8b-instant",
        max_tokens: 30,
        temperature: 0.3,
        messages: [
            { role: "system", content: systemPrompt },
            ...messages
        ]
    };

    // Log API INPUT
    safeLog("========================================");
    safeLog("📥 [GROQ API INPUT]");
    safeLog("========================================");
    safeLog("Model: " + payload.model);
    safeLog("Max tokens: " + payload.max_tokens);
    safeLog("Temperature: " + payload.temperature);
    safeLog("Message count: " + payload.messages.length);
    safeLog("System prompt: " + systemPrompt);
    safeLog("User prompt: " + prompt);
    safeLog("Conversation history: " + (conversationHistory.length > 0 ? "YES (" + conversationHistory.length + " msgs)" : "NO"));
    safeLog("========================================");

    try {
        safeLog("🚀 Sending request to Groq API...");
        const resp = await Internet.fetch(new Request("https://api.groq.com/openai/v1/chat/completions", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${apiKey}`
            },
            body: JSON.stringify(payload)
        }));
        
        safeLog("📊 Response status: " + resp.status);
        
        if (resp.status !== 200) {
            const t = await resp.text();
            safeLog("❌ [GROQ API ERROR] Status: " + resp.status);
            safeLog("Error response: " + t);
            setStatus("⚠️ Error");
            isProcessing = false;
            return;
        }

        const data = await resp.json();
        safeLog("========================================");
        safeLog("📤 [GROQ API OUTPUT]");
        safeLog("========================================");
        safeLog("Response keys: " + Object.keys(data || {}).join(', '));
        
        let suggestion = extractGroqText(data) || "";
        suggestion = (suggestion || "").trim();
        
        safeLog("Extracted suggestion: '" + suggestion + "'");
        safeLog("========================================");
        
        if (suggestion.length === 0) {
            safeLog("⚠️ No suggestion - empty response");
            setStatus("⚠️ No suggestion");
            isProcessing = false;
            return;
        }

        safeLog("✅ Suggestion generated: " + suggestion);
        
        const hasTranscript = transcript && transcript.trim().length > 0;
        if (hasTranscript) {
            addToConversationHistory(transcript, suggestion);
            safeLog("💾 Added to conversation history");
            
            // Only update display for real user transcriptions (not scene-only triggers)
            updateSuggestionDisplay(suggestion);
            setStatus("🎯 Ready");
        } else {
            safeLog("⏭️ Scene-only suggestion - NOT updating display");
            setStatus("🎯 Ready");
        }
    } catch (e) {
        safeLog("❌ [GROQ API EXCEPTION]");
        safeLog("Error: " + e);
        safeLog("Type: " + (typeof e));
        setStatus("⚠️ Error");
    } finally {
        isProcessing = false;
        safeLog("🏁 [COMPLETE] Request finished");
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
        // User spoke - make transcript the MOST IMPORTANT part
        let p = `The user is on Snap Spectacles glasses. Someone said to them: "${transcript}"\n`;
        
        // Add visual scene context (secondary)
        if (sceneAnalysis && sceneAnalysis.length > 0) {
            p += `What the glasses see: ${sceneAnalysis}\n`;
        }
        
        // Add emotion context (tertiary)
        if (emotion && emotion !== "Neutral") {
            p += `User's tone: ${emotion}\n`;
        }
        
        // Adjust prompt based on whether people are present
        if (hasPeople) {
            p += "\nSTRICT: Maximum 12 words. The person in view is who said that to the user. Suggest what the user should SAY BACK to that person. DO NOT answer the question yourself - suggest their response.\n";
        } else if (sceneAnalysis && sceneAnalysis.length > 0) {
            p += "\nSTRICT: Maximum 12 words. The user said that. Suggest a natural response they could give based on what they're seeing.\n";
        } else {
            p += "\nSTRICT: Maximum 12 words. Suggest what the user could say in response.\n";
        }
        return p;
    } else {
        // No transcript - scene only
        if (sceneAnalysis && sceneAnalysis.length > 0) {
            let p = `The user is on Snap Spectacles. Through the glasses camera, you see: ${sceneAnalysis}\n`;
            
            // Adjust prompt based on whether people are present
            if (hasPeople) {
                p += "\nSTRICT: Maximum 12 words. The PERSON visible is who the user is talking to. Suggest what the user could say TO THAT PERSON based on what you see about them (appearance, actions, etc.).\n";
            } else {
                p += "\nSTRICT: Maximum 12 words. No person visible. Suggest what the user could say or think about what they're seeing.\n";
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

// Expose the user's transcript
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

