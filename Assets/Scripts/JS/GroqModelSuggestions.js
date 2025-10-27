// @input Component.Text suggestionText {"hint":"Text to display suggestion"}
// @input Component.Text statusText {"hint":"Optional status text UI"}
// @input Component.ScriptComponent rekaEmotionScript {"hint":"Drag the RekaEmotionAnalyzer script component"}
// @input Component.ScriptComponent groqSceneAnalyzerScript {"hint":"Drag the GroqSceneAnalyzer script component"}
// @input Component.Text snapchatSTTText {"hint":"Drag the SnapchatSTT outputText to monitor voice input"}
// @input string groqApiKey {"hint":"Groq API Key"}
// @input string groqModel = "llama-3.1-8b-instant" {"hint":"Groq model"}
// @input float minInterval = 0.5 {"hint":"Min seconds between suggestions"}
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
    // Always print this regardless of debug mode
    print("========================================");
    print("✅ [INIT] GroqModelSuggestions initialized");
    print("   Debug mode: " + (script.enableDebug ? "ON" : "OFF"));
    print("========================================");
    
    safeLog("========================================");
    safeLog("✅ [INIT] GroqModelSuggestions initialized");
    safeLog("========================================");
    safeLog("📋 Configuration:");
    safeLog("   Groq API Key: " + (script.groqApiKey ? "SET" : "NOT SET"));
    safeLog("   Model: " + script.groqModel);
    safeLog("   Enable Debug: " + script.enableDebug);
    safeLog("   Scene-only suggestions: " + script.enableSceneOnlySuggestions);
    safeLog("========================================");

    // Subscribe to VoiceML updates to receive eventData from Snapchat STT without modifying the STT script
    // Use a delayed subscription to ensure we subscribe AFTER other scripts have initialized
    const delayedSubscription = script.createEvent("DelayedCallbackEvent");
    delayedSubscription.bind(function() {
        try {
            safeLog("🎧 Attempting to subscribe to VoiceMLModule (delayed)...");
            const VoiceMLModule = require("LensStudio:VoiceMLModule");
            
            safeLog("✅ VoiceMLModule loaded successfully");
            VoiceMLModule.onListeningUpdate.add(function(eventData) {
                handleListeningUpdate(eventData);
            });
            safeLog("✅ Subscribed to VoiceML onListeningUpdate");
            safeLog("   (Will receive voice events now)");
        } catch (e) {
            safeLog("⚠️ VoiceMLModule ERROR: " + e);
            safeLog("⚠️ VoiceMLModule not available or not initialized yet");
        }
    });
    delayedSubscription.reset(3.0); // Subscribe after SnapchatSTT initializes (they start at 2.0s)
    
    safeLog("========================================");
    
    // Start periodic check for voice input via SnapchatSTT text polling
    safeLog("🔍 Starting voice input polling...");
    startVoiceInputPolling();
    
    // Start periodic check for scene-only suggestions
    if (script.enableSceneOnlySuggestions) {
        safeLog("👁️ Starting scene-only suggestions polling...");
        scheduleSceneCheck();
    } else {
        safeLog("⏭️ Scene-only suggestions disabled");
    }
    
    safeLog("========================================\n");
});

function startVoiceInputPolling() {
    safeLog("🎤 Starting voice input polling...");
    if (script.snapchatSTTText) {
        safeLog("✅ SnapchatSTT text component connected!");
        safeLog("   Monitoring: " + (script.snapchatSTTText.name || "unnamed text"));
    } else {
        safeLog("⚠️ No SnapchatSTT text component connected!");
        safeLog("   Please drag the SnapchatSTT outputText to 'Snapchat STT Text' in Inspector");
    }
    
    const updateEvent = script.createEvent("UpdateEvent");
    let lastPolledTranscript = "";
    let pollCount = 0;
    
    updateEvent.bind(function() {
        pollCount++;
        
        // Poll every frame but only log every 60 frames (~1 second at 60fps)
        const shouldLog = (pollCount % 60 === 0);
        
        if (!script.snapchatSTTText) {
            if (shouldLog) {
                debugLog("⚠️ No SnapchatSTT text component connected - cannot monitor voice");
            }
            return;
        }
        
        const currentText = script.snapchatSTTText.text || "";
        
        // Debug current state occasionally
        if (shouldLog) {
            debugLog("📋 [POLL] Current text: '" + currentText + "' | Last polled: '" + lastPolledTranscript + "'");
        }
        
        // Check if text changed - accept ANY transcription for live mode
        if (currentText && currentText !== lastPolledTranscript && currentText.length > 0) {
                // Extract the actual transcript (remove any prefixes)
                let transcript = currentText;
                let prefixRemoved = false;
                
                // Remove ✅ prefix if present
                if (transcript.indexOf("✅ ") === 0) {
                    transcript = transcript.substring(2).trim();
                    prefixRemoved = true;
                }
                // Remove ... prefix if present (interim transcriptions)
                if (transcript.indexOf("... ") === 0) {
                    transcript = transcript.substring(4).trim();
                    prefixRemoved = true;
                }
                
                safeLog("🔍 Extracted transcript: '" + transcript + "' (prefix removed: " + prefixRemoved + ")");
                
                if (transcript && transcript.length > 0) {
                safeLog("========================================");
                safeLog("📥 [VOICE POLL] New transcription detected!");
                safeLog("========================================");
                safeLog("   Text from SnapchatSTT: '" + currentText + "'");
                safeLog("   Extracted transcript: '" + transcript + "'");
                safeLog("========================================");
                
                lastPolledTranscript = currentText;
                
                // Get emotion and scene
                const emotion = getCurrentEmotionSafe();
                const sceneAnalysis = getCurrentSceneAnalysisSafe();
                
                // Check throttling
                const now = getTime();
                const timeSinceLast = now - lastSuggestionTime;
                const minInterval = Math.max(0.5, script.minInterval);
                
                safeLog("⏱️ Time since last suggestion: " + timeSinceLast.toFixed(2) + "s");
                safeLog("⏱️ Min interval required: " + minInterval + "s");
                
                if (timeSinceLast >= minInterval) {
                    safeLog("✅ Throttling OK - calling requestGroqSuggestion");
                    requestGroqSuggestion(transcript, emotion, sceneAnalysis);
                } else {
                    safeLog("⏳ THROTTLED - skipping call (would be " + (minInterval - timeSinceLast).toFixed(2) + "s too soon)");
                }
            }
        }
    });
}

function handleListeningUpdate(eventData) {
    safeLog("========================================");
    safeLog("🎤 [VOICE INPUT] Event received");
    safeLog("========================================");
    
    // Debug the event structure
    safeLog("📦 Event data keys: " + Object.keys(eventData || {}).join(', '));
    safeLog("📝 Has transcription: " + (eventData?.transcription ? "YES" : "NO"));
    safeLog("✓ Is final: " + (eventData?.isFinalTranscription ? "YES" : "NO"));
    
    if (eventData && eventData.transcription) {
        safeLog("📝 Transcription text: '" + eventData.transcription + "'");
    }

    // Act on ANY transcription (live mode)
    if (!eventData || !eventData.transcription) {
        safeLog("⏭️ Skipping - no transcription");
        safeLog("========================================");
        return;
    }

    pendingTranscript = (eventData.transcription || "").trim();
    const isFinal = eventData.isFinalTranscription;
    safeLog("✅ " + (isFinal ? "FINAL" : "INTERIM") + " transcription captured: '" + pendingTranscript + "'");
    
    if (pendingTranscript.length === 0) {
        safeLog("⏭️ Skipping - empty transcript");
        safeLog("========================================");
        return;
    }
    
    // Store the user's transcript for Tavily to use
    lastUserTranscript = pendingTranscript;
    safeLog("💾 Stored user transcript for Tavily: " + lastUserTranscript);

    const now = getTime();
    const timeSinceLast = now - lastSuggestionTime;
    const minInterval = Math.max(1.0, script.minInterval);
    
    safeLog("⏱️ Time since last suggestion: " + timeSinceLast.toFixed(2) + "s");
    safeLog("⏱️ Min interval required: " + minInterval + "s");
    
    if (timeSinceLast < minInterval) {
        safeLog("⏳ Throttled; waiting min interval before next suggestion");
        safeLog("========================================");
        return;
    }
    
    safeLog("✅ Proceeding with request...");
    safeLog("========================================");

    // Pull emotion from RekaEmotionAnalyzer if available
    const emotion = getCurrentEmotionSafe();
    // Pull scene analysis from GroqSceneAnalyzer if available
    const sceneAnalysis = getCurrentSceneAnalysisSafe();
    
    safeLog("📊 Calling requestGroqSuggestion with:");
    safeLog("   Transcript: '" + pendingTranscript + "'");
    safeLog("   Emotion: " + emotion);
    safeLog("   Scene: " + (sceneAnalysis || "none"));
    safeLog("========================================\n");
    
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
    // Only check if we haven't made a suggestion recently
    const now = getTime();
    if (now - lastSuggestionTime < Math.max(1.0, script.minInterval)) {
        return; // Throttled
    }
    
    if (isProcessing) {
        return; // Already processing
    }
    
    // Check if there's scene data but no recent transcript
    const sceneAnalysis = getCurrentSceneAnalysisSafe();
    if (sceneAnalysis && sceneAnalysis.length > 0 && sceneAnalysis !== "Analyzing...") {
        // Check if this is a new scene analysis
        if (sceneAnalysis !== lastSceneAnalysis) {
            safeLog("👁️ New scene detected, triggering scene-only suggestion");
            lastSceneAnalysis = sceneAnalysis;
            
            // No transcript - trigger Groq suggestion with empty transcript to focus on scene
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
    safeLog("========================================");
    safeLog("🔵 [requestGroqSuggestion] CALLED");
    safeLog("========================================");
    safeLog("📥 Received parameters:");
    safeLog("   transcript: '" + transcript + "'");
    safeLog("   emotion: " + emotion);
    safeLog("   sceneAnalysis: " + (sceneAnalysis || "(empty)"));
    safeLog("========================================");
    
    if (isProcessing) {
        safeLog("⏸️ Already processing a suggestion - EXIT");
        return;
    }
    
    if (!script.groqApiKey || script.groqApiKey.length === 0) {
        safeLog("❗ Missing Groq API Key - EXIT");
        return;
    }
    
    safeLog("✅ All checks passed, proceeding with request");

    isProcessing = true;
    lastSuggestionTime = getTime();
    setStatus("💭 Thinking...");
    
    safeLog("🔒 isProcessing set to TRUE");
    safeLog("⏱️ lastSuggestionTime set to: " + lastSuggestionTime.toFixed(3));

    safeLog("========================================");
    safeLog("🚀 [GROQ SUGGESTION REQUEST]");
    safeLog("========================================");

    // ========== PROMPT BUILDING ==========
    safeLog("========================================");
    safeLog("📝 [BUILDING PROMPT]");
    safeLog("========================================");
    safeLog("📋 Transcript: '" + transcript + "'");
    safeLog("😊 Emotion: " + emotion);
    safeLog("👁️ Scene: " + (sceneAnalysis || "none"));
    
    // Check if people detected in scene
    const hasPeople = sceneAnalysis && (
        sceneAnalysis.toLowerCase().includes("person") ||
        sceneAnalysis.toLowerCase().includes("people") ||
        sceneAnalysis.toLowerCase().includes("they're") ||
        sceneAnalysis.toLowerCase().includes("he ") ||
        sceneAnalysis.toLowerCase().includes("she ")
    );
    safeLog(hasPeople ? "👤 PEOPLE detected in scene" : "🏠 No people in scene - environment focus");
    
    safeLog("📚 History: " + conversationHistory.length + " messages");
    
    const prompt = buildPrompt(transcript, emotion, sceneAnalysis);
    safeLog("✏️ Built prompt:");
    safeLog("---");
    safeLog(prompt);
    safeLog("---");
    
    // Trim the API key to remove any whitespace
    const apiKey = script.groqApiKey.trim();

    // Build messages array with conversation history + current prompt
    let messages = [];
    
    // Add conversation history if available
    if (conversationHistory.length > 0) {
        safeLog("📚 Including conversation history (" + conversationHistory.length + " messages)");
        messages = messages.concat(conversationHistory);
    }
    
    // Add current prompt
    messages.push({ role: "user", content: prompt });
    
    safeLog("📝 Total messages: " + messages.length + " (includes history)");
    safeLog("========================================");
    
    // Build comprehensive system prompt with scene context
    let systemPrompt = "You are a real-time conversational AI assistant for AR glasses. Your role is to help users understand conversations and respond appropriately by providing brief, natural conversation suggestions.";
    
    // Add scene context if available
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
        // ========== INPUT DEBUG ==========
        const inputTimestamp = getTime();
        safeLog("========================================");
        safeLog("📥 [GROQ INPUT] Sending request...");
        safeLog("========================================");
        safeLog("🕐 Time: " + inputTimestamp.toFixed(3));
        safeLog("🤖 Model: " + payload.model);
        safeLog("💬 Total messages in payload: " + payload.messages.length);
        safeLog("📋 System prompt:");
        safeLog("   " + systemPrompt);
        
        // Show ALL messages being sent
        safeLog("📨 ALL messages being sent:");
        for (let i = 0; i < payload.messages.length; i++) {
            const msg = payload.messages[i];
            safeLog(`   [${i}] ${msg.role}: "${msg.content.substring(0, 100)}${msg.content.length > 100 ? '...' : ''}"`);
        }
        
        safeLog("🔑 API Key: " + apiKey.substring(0, 10) + "..." + apiKey.substring(apiKey.length - 5));
        safeLog("========================================");
        
        const resp = await Internet.fetch(new Request("https://api.groq.com/openai/v1/chat/completions", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${apiKey}`
            },
            body: JSON.stringify(payload)
        }));

        const responseTimestamp = getTime();
        const responseTime = (responseTimestamp - inputTimestamp).toFixed(3);
        
        safeLog("========================================");
        safeLog("📤 [GROQ OUTPUT] Response received");
        safeLog("========================================");
        safeLog("🕐 Time: " + responseTimestamp.toFixed(3));
        safeLog("⏱️ Response time: " + responseTime + "s");
        safeLog("📊 Status: " + resp.status);
        
        if (resp.status !== 200) {
            const t = await resp.text();
            safeLog("❗ ERROR RESPONSE: " + t);
            safeLog("========================================");
            setStatus("⚠️ Error");
            isProcessing = false;
            return;
        }

        const data = await resp.json();
        safeLog("📦 Response keys: " + Object.keys(data || {}).join(', '));
        if (data.choices && data.choices.length > 0) {
            safeLog("✅ Found " + data.choices.length + " choice(s)");
        }
        
        let suggestion = extractGroqText(data) || "";
        suggestion = (suggestion || "").trim();
        
        safeLog("========================================");
        safeLog("💡 [GROQ OUTPUT] SUGGESTION:");
        safeLog("   " + suggestion);
        safeLog("========================================");
        
        if (suggestion.length === 0) {
            safeLog("⚠️ Empty suggestion received");
            setStatus("⚠️ No suggestion");
            isProcessing = false;
            return;
        }

    // Store this exchange in conversation history (only if there was a transcript)
    // For scene-only suggestions, we don't add to history to avoid cluttering
    const hasTranscript = transcript && transcript.trim().length > 0;
    if (hasTranscript) {
        addToConversationHistory(transcript, suggestion);
    } else {
        safeLog("📷 Scene-only suggestion - not adding to conversation history");
    }
    
    updateSuggestionDisplay(suggestion);
    setStatus("🎯 Ready");
    } catch (e) {
        safeLog("========================================");
        safeLog("❌ [EXCEPTION] Error caught:");
        safeLog("   Error: " + e);
        safeLog("   Type: " + (typeof e));
        safeLog("========================================");
        setStatus("⚠️ Error");
    } finally {
        isProcessing = false;
        safeLog("========================================");
        safeLog("🏁 [COMPLETE] Request finished");
        safeLog("🔓 isProcessing reset to FALSE");
        safeLog("========================================\n");
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
    // Groq/OpenAI compatible format: data.choices[0].message.content
    try {
        if (data && data.choices && data.choices.length > 0) {
            const message = data.choices[0].message;
            if (message && message.content) {
                safeLog("✓ Extracted text from data.choices[0].message.content");
                safeLog("   Content: " + message.content);
                return message.content.trim();
            } else {
                safeLog("⚠️ Message has no content field");
            }
        } else {
            safeLog("⚠️ No choices found in response");
        }
        // Fallback formats
        if (data?.text && typeof data.text === 'string') { 
            safeLog("✓ Fallback: Using data.text");
            return data.text; 
        }
    } catch (e) {
        safeLog("⚠️ Failed to parse Groq response: " + e);
    }
    const preview = JSON.stringify(data || {}).slice(0, 400);
    safeLog("ℹ️ Unrecognized Groq response structure: " + preview);
    return "";
}

function addToConversationHistory(userMessage, assistantResponse) {
    // Add user message
    conversationHistory.push({
        role: "user",
        content: userMessage
    });
    
    // Add assistant response
    conversationHistory.push({
        role: "assistant",
        content: assistantResponse
    });
    
    // Trim history to max size (keep most recent)
    if (conversationHistory.length > script.maxHistorySize) {
        const removeCount = conversationHistory.length - script.maxHistorySize;
        conversationHistory = conversationHistory.slice(removeCount);
        safeLog("🗂️ Trimmed conversation history (removed " + removeCount + " oldest messages)");
    }
    
    safeLog("💾 Added to history. Current history size: " + conversationHistory.length);
}

function clearConversationHistory() {
    conversationHistory = [];
    safeLog("🗑️ Conversation history cleared");
}

function updateSuggestionDisplay(s) {
    if (script.suggestionText) {
        script.suggestionText.text = "💡 " + s;
        // gold color
        script.suggestionText.textFill.color = new vec4(1.0, 0.84, 0.0, 1.0);
    }
    safeLog("✅ Suggestion: " + s);
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

