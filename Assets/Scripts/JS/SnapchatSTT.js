// @input Component.AudioListenerComponent audioListener {"hint":"Drag the Audio Listener component here"}
// @input Component.Text outputText {"hint":"Text component to display transcription"}

print("========================================");
print("🚀 SNAPCHAT SPEECH-TO-TEXT - LOADING");
print("Using Lens Studio VoiceML Module");
print("========================================");

// VoiceML Module
let voiceMLModule;

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
            script.outputText.text = "Initializing...";
            print("✓ Output text connected");
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
    }
});

function startListening() {
    print("========================================");
    print("🎤 LISTENING FOR SPEECH");
    print("========================================");
    
    if (script.outputText) {
        script.outputText.text = "🎤 Listening...";
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
                    } else {
                        script.outputText.text = "... " + eventData.transcription;
                    }
                }
            }
        });
        
        print("✓ Callback registered");
        
        voiceMLModule.startListening(options);
        print("✅ LISTENING ACTIVE - SPEAK NOW!");
        
        // Auto-restart after 10 seconds
        var stopTimer = script.createEvent("DelayedCallbackEvent");
        stopTimer.bind(function() {
            print("⏰ Restarting listening cycle...");
            voiceMLModule.stopListening();
            
            var restartTimer = script.createEvent("DelayedCallbackEvent");
            restartTimer.bind(function() {
                startListening();
            });
            restartTimer.reset(2.0);
        });
        stopTimer.reset(10.0);
        
    } catch (e) {
        print("❌ ERROR in startListening: " + e);
    }
}

print("========================================");
print("✅ SNAPCHAT STT - READY!");
print("Speak to test voice recognition");
print("========================================");

