// @input Component.AudioListenerComponent audioListener {"hint":"Drag the Audio Listener component here"}
// @input Component.Text outputText {"hint":"Text component to display transcription"}
// @input Component.Text statusText {"hint":"Optional status text component"}
// @input bool enableContinuousListening {"hint":"Enable continuous listening mode"}

print("========================================");
print("🚀 SNAPCHAT SPEECH-TO-TEXT - LOADING");
print("Using Lens Studio VoiceML Module");
print("========================================");

// VoiceML Module
let voiceMLModule;
let isListening = false;

script.createEvent("OnStartEvent").bind(function() {
    print("========================================");
    print("✅ SNAPCHAT STT - INITIALIZED!");
    print("========================================");
    
    try {
        voiceMLModule = require("LensStudio:VoiceMLModule");
        print("✓ VoiceML module loaded");
        
        // Check if Audio Listener is connected
        if (script.audioListener) {
            print("✓ Audio Listener connected: " + script.audioListener.getTypeName());
        } else {
            print("⚠️  Warning: Audio Listener not connected (optional)");
        }
        
        if (script.outputText) {
            script.outputText.text = "🎤 Ready to listen...";
            print("✓ Output text connected");
        } else {
            print("⚠️  Warning: Output text component not connected");
        }
        
        if (script.statusText) {
            script.statusText.text = "Initializing...";
            print("✓ Status text connected");
        }
        
        // Start after 2 seconds
        var delayedStart = script.createEvent("DelayedCallbackEvent");
        delayedStart.bind(function() {
            print("⏰ Starting voice recognition...");
            startListening();
        });
        delayedStart.reset(2.0);
        
    } catch (e) {
        print("❌ ERROR: " + e);
        if (script.statusText) {
            script.statusText.text = "❌ Error: " + e;
        }
    }
});

function startListening() {
    if (isListening) {
        print("⚠️  Already listening, skipping start");
        return;
    }
    
    print("========================================");
    print("🎤 LISTENING FOR SPEECH");
    print("========================================");
    
    if (script.outputText) {
        script.outputText.text = "🎤 Listening...";
    }
    
    if (script.statusText) {
        script.statusText.text = "🎤 Active";
    }
    
    try {
        var options = VoiceML.ListeningOptions.create();
        options.shouldReturnAsrTranscription = true;
        options.shouldReturnInterimAsrTranscription = true;
        
        print("✓ Options created");
        
        voiceMLModule.onListeningUpdate.add(function(eventData) {
            print("========================================");
            print("📝 SPEECH DETECTED!");
            print("========================================");
            
            if (eventData.transcription) {
                print("Text: " + eventData.transcription);
                print("Final: " + eventData.isFinalTranscription);
                
                if (script.outputText) {
                    if (eventData.isFinalTranscription) {
                        script.outputText.text = "✅ " + eventData.transcription;
                        print("========================================");
                        print("🎯 FINAL: " + eventData.transcription);
                        print("========================================");
                        
                        if (script.statusText) {
                            script.statusText.text = "✅ Complete";
                        }
                    } else {
                        script.outputText.text = "... " + eventData.transcription;
                        if (script.statusText) {
                            script.statusText.text = "🔄 Processing...";
                        }
                    }
                }
            }
        });
        
        print("✓ Callback registered");
        
        voiceMLModule.startListening(options);
        isListening = true;
        print("✅ LISTENING ACTIVE - SPEAK NOW!");
        
        // Auto-restart if continuous listening is enabled
        if (script.enableContinuousListening) {
            var stopTimer = script.createEvent("DelayedCallbackEvent");
            stopTimer.bind(function() {
                print("⏰ Restarting listening cycle...");
                voiceMLModule.stopListening();
                isListening = false;
                
                var restartTimer = script.createEvent("DelayedCallbackEvent");
                restartTimer.bind(function() {
                    startListening();
                });
                restartTimer.reset(2.0);
            });
            stopTimer.reset(10.0);
        }
        
    } catch (e) {
        print("❌ ERROR in startListening: " + e);
        if (script.statusText) {
            script.statusText.text = "❌ Error: " + e;
        }
        isListening = false;
    }
}

// Public function to manually start/stop listening
script.startListening = function() {
    if (!isListening) {
        startListening();
    }
};

script.stopListening = function() {
    if (isListening && voiceMLModule) {
        voiceMLModule.stopListening();
        isListening = false;
        print("🛑 Listening stopped");
        if (script.statusText) {
            script.statusText.text = "🛑 Stopped";
        }
    }
};

print("========================================");
print("✅ SNAPCHAT STT - READY!");
print("Speak to test voice recognition");
print("========================================");

