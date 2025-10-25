# 🚀 Social AI Assistant - Setup Guide

## Overview
This guide will help you set up the complete Social AI Assistant system in Lens Studio for Snap Spectacles.

## ✅ Prerequisites
- Lens Studio installed
- Snap Spectacles (for testing)
- All TypeScript files created in `Assets/` folder

## 📁 Files Created
- `EmotionAnalyzer.ts` - Emotion detection via REKA
- `SpeechToTextManager.ts` - Speech transcription via Deepgram
- `ClaudeAssistant.ts` - Conversation suggestions via Claude (ONLY AI used)
- `TextToSpeechManager.ts` - Text display manager (NO audio, text-only)
- `MainOrchestrator.ts` - Central coordinator
- `ConversationOverlay.ts` - UI display

## 🎯 Step-by-Step Setup

### Step 1: Create Scene Objects

In Lens Studio Objects Panel, create this hierarchy:

```
Scene
├── Camera
│   └── Device Camera Texture (already exists)
├── Social AI System
│   ├── EmotionAnalyzer (Scene Object)
│   ├── SpeechToText (Scene Object)
│   ├── ClaudeAssistant (Scene Object)
│   ├── TextToSpeech (Scene Object)
│   ├── MainOrchestrator (Scene Object)
│   └── Overlay (Scene Object)
└── UI
    ├── EmotionText (Screen Text)
    ├── TranscriptionText (Screen Text)
    ├── SuggestionText (Screen Text)
    └── StatusText (Screen Text)
```

### Step 2: Add Script Components

For each Scene Object, add the corresponding script:

1. **EmotionAnalyzer** object:
   - Add Component → Script → `EmotionAnalyzer.ts`

2. **SpeechToText** object:
   - Add Component → Script → `SpeechToTextManager.ts`

3. **ClaudeAssistant** object:
   - Add Component → Script → `ClaudeAssistant.ts`

4. **TextToSpeech** object:
   - Add Component → Script → `TextToSpeechManager.ts`
   - **NO Audio Component needed** (text-only mode)

5. **MainOrchestrator** object:
   - Add Component → Script → `MainOrchestrator.ts`

6. **Overlay** object:
   - Add Component → Script → `ConversationOverlay.ts`

### Step 3: Create Audio Assets

1. **Create Microphone Audio Asset:**
   - Assets Panel → Add New → Audio → Microphone Audio
   - Name it: `Microphone Audio`

2. **Audio Output Asset:**
   - ~~NOT NEEDED~~ (Text-only mode, no audio output)

### Step 4: Create UI Text Components

Create 4 Text components in the UI:

1. **EmotionText:**
   - Position: Top-left
   - Font Size: 32
   - Color: White
   - Text: "😐 Neutral"

2. **TranscriptionText:**
   - Position: Middle-center
   - Font Size: 24
   - Color: White
   - Text: ""

3. **SuggestionText:**
   - Position: Bottom-center
   - Font Size: 28
   - Color: Yellow/Gold
   - Text: ""

4. **StatusText:**
   - Position: Top-right
   - Font Size: 20
   - Color: Gray
   - Text: "Ready"

### Step 5: Configure EmotionAnalyzer

Select `EmotionAnalyzer` object, in Inspector:
- **Camera Texture**: Drag `Device Camera Texture` asset
- **Emotion Display Text**: Drag `EmotionText` component
- **Analysis Interval**: 3 seconds
- **Enable Debug Mode**: ✓ (for testing)

### Step 6: Configure SpeechToTextManager

Select `SpeechToText` object, in Inspector:
- **Microphone Audio Asset**: Drag `Microphone Audio` asset
- **Audio Output Asset**: Drag `Audio Output` asset
- **Transcription Display Text**: Drag `TranscriptionText` component
- **Recording Interval**: 3 seconds
- **Enable Debug Mode**: ✓

### Step 7: Configure ClaudeAssistant

Select `ClaudeAssistant` object, in Inspector:
- **Suggestion Display Text**: Drag `SuggestionText` component
- **Enable Debug Mode**: ✓

### Step 8: Configure TextToSpeechManager

Select `TextToSpeech` object, in Inspector:
- **Enable Text Display**: ✓ (checked)
- **Enable Debug Mode**: ✓
- **NO AUDIO CONFIGURATION NEEDED** - Text suggestions display only

### Step 9: Configure MainOrchestrator

Select `MainOrchestrator` object, in Inspector:
- **Emotion Analyzer Object**: Drag `EmotionAnalyzer` object
- **Speech-to-Text Object**: Drag `SpeechToText` object
- **Claude Assistant Object**: Drag `ClaudeAssistant` object
- **Text-to-Speech Object**: Drag `TextToSpeech` object
- **Overlay Object**: Drag `Overlay` object
- **Status Text**: Drag `StatusText` component
- **Enable Debug Mode**: ✓
- **Auto-Generate Suggestions**: ✓

### Step 10: Configure ConversationOverlay

Select `Overlay` object, in Inspector:
- **Emotion Text**: Drag `EmotionText` component
- **Transcription Text**: Drag `TranscriptionText` component
- **Suggestion Text**: Drag `SuggestionText` component
- **Status Text**: Drag `StatusText` component
- **Max Transcript Length**: 80
- **Max Suggestion Length**: 100
- **Enable Animations**: ✓

## 🎨 UI Layout Recommendations

### Screen Layout:
```
┌─────────────────────────────────────┐
│ 😊 Happy          🎯 Social AI Active│ ← Top bar
│                                     │
│                                     │
│     "You said: Hello there..."      │ ← Transcription (center)
│                                     │
│                                     │
│ 💡 Try asking how they're doing     │ ← Suggestion (bottom)
└─────────────────────────────────────┘
```

### Text Positioning:
- **EmotionText**: Anchor to top-left, offset (20, -20)
- **StatusText**: Anchor to top-right, offset (-20, -20)
- **TranscriptionText**: Anchor to center, offset (0, 0)
- **SuggestionText**: Anchor to bottom-center, offset (0, 100)

## 🔧 Testing the System

### Test Sequence:

1. **Test Emotion Detection:**
   - Run the app
   - Make different facial expressions
   - Check if `EmotionText` updates every 3 seconds

2. **Test Speech Recognition:**
   - Speak into the microphone
   - Check console logs for transcription
   - Verify `TranscriptionText` updates

3. **Test Claude Integration:**
   - After speaking, wait 1-2 seconds
   - Check if suggestion appears in `SuggestionText`
   - **Text only, no audio** (Claude-only mode)

4. **Test Complete Flow:**
   - Wear Spectacles
   - Start conversation
   - Observe: emotion → speech → suggestion → **text display** (no audio)

## 🐛 Troubleshooting

### Issue: "Camera texture not set"
**Solution:** Verify `Device Camera Texture` asset is dragged to EmotionAnalyzer

### Issue: "No transcription"
**Solution:** 
- Check microphone permissions
- Verify Microphone Audio asset is correctly assigned
- Enable Debug Mode to see console logs

### Issue: "No suggestions"
**Solution:**
- Check all objects are properly linked in MainOrchestrator
- Verify API keys are correct in the scripts
- Check Debug Mode logs for errors

### Note: No Audio Output
**This is expected!** The system uses **text-only display** as requested (Claude only).
- Suggestions appear as text on screen
- No audio/TTS functionality
- All feedback is visual through ConversationOverlay

### Issue: Components not found
**Solution:**
- Make sure all script components are added to correct objects
- Verify object names match exactly
- Check getComponent() calls in MainOrchestrator

## 📊 Expected Flow

```
User wears Spectacles
        ↓
Camera captures face → REKA analyzes → Emotion displayed
        ↓
User speaks → Deepgram transcribes → Text displayed
        ↓
Silence detected → Claude generates suggestion
        ↓
Suggestion displayed as text on screen
        ↓
Loop continues...
```

## ⚙️ Configuration Options

### Adjust Analysis Frequency:
- EmotionAnalyzer: Change `analysisInterval` (1-10 seconds)
- SpeechToText: Change `recordingInterval` (2-10 seconds)

### Adjust Suggestion Timing:
- MainOrchestrator: Change `MIN_PROCESS_INTERVAL` in code (5-30 seconds)

### Text Display Mode:
- TextToSpeech: Text-only mode (no audio configuration needed)

### Disable Auto-Suggestions:
- MainOrchestrator: Uncheck `Auto-Generate Suggestions`
- Manually trigger with `mainOrchestrator.triggerSuggestion()`

## 🚀 Performance Tips

1. **Optimize API Calls:**
   - Increase intervals to reduce API usage
   - EmotionAnalyzer: 5 seconds instead of 3
   - MainOrchestrator: 10 seconds minimum between suggestions

2. **Battery Saving:**
   - Disable Debug Mode in production
   - Use lower quality camera capture
   - Reduce TTS quality if needed

3. **Network Optimization:**
   - All APIs called directly from Spectacles
   - No backend server needed
   - Ensure good WiFi/cellular connection

## 📝 API Keys Location

All API keys are hardcoded in the respective scripts:
- **REKA**: `EmotionAnalyzer.ts` line 35
- **Deepgram**: `SpeechToTextManager.ts` line 32
- **Claude**: `ClaudeAssistant.ts` line 19 (ONLY AI USED)
- ~~OpenAI~~: NOT USED (text-only mode per user request)

**Note:** In production, these should be moved to environment variables or a secure backend.

## ✅ Final Checklist

Before deploying to Spectacles:
- [ ] All scripts added to correct objects
- [ ] Microphone asset created (NO Audio Output needed)
- [ ] All UI text components created and positioned
- [ ] All Inspector fields filled in
- [ ] Debug Mode enabled for testing
- [ ] Microphone permissions granted
- [ ] Camera permissions granted
- [ ] Network connection available
- [ ] Tested in Lens Studio preview
- [ ] Tested on actual Spectacles hardware
- [ ] Confirmed text-only mode (no audio output expected)

## 🎉 You're Done!

Your Social AI Assistant is now ready! Put on your Spectacles and start having AI-guided conversations in real-time.

For questions or issues, check the console logs (Debug Mode must be enabled).