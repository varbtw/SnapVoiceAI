# 🎤 Speech-to-Text Setup Guide for Snap Spectacles

## Overview
This guide will help you set up live speech-to-text functionality that displays real-time transcription on your Snap Spectacles.

## ✅ Prerequisites
- Lens Studio installed
- Snap Spectacles (for testing)
- Microphone permissions enabled

## 🎯 Step-by-Step Setup

### Step 1: Create Scene Objects

In Lens Studio Objects Panel, create this hierarchy:

```
Scene
├── SpeechToText System
│   ├── SpeechToTextController (Scene Object)
│   ├── LiveTranscriptionDisplay (Screen Text)
│   └── StatusDisplay (Screen Text)
└── Audio Listener (already exists)
```

### Step 2: Add Script Components

1. **SpeechToTextController** object:
   - Add Component → Script → `SpeechToText.js` OR `SnapchatSTT.js`
   - **Recommended**: Use `SnapchatSTT.js` for more features

2. **LiveTranscriptionDisplay** object:
   - Add Component → Text
   - Position: Center of screen
   - Font Size: 48-60
   - Color: White with black outline for visibility

3. **StatusDisplay** object:
   - Add Component → Text  
   - Position: Top of screen
   - Font Size: 32-40
   - Color: Yellow/Green for status updates

### Step 3: Configure Script Inputs

For **SnapchatSTT.js** script:
- **audioListener**: Drag the Audio Listener component
- **outputText**: Drag the LiveTranscriptionDisplay Text component
- **statusText**: Drag the StatusDisplay Text component
- **enableContinuousListening**: Check this for continuous listening

For **SpeechToText.js** script:
- **text**: Drag the LiveTranscriptionDisplay Text component
- **statusText**: Drag the StatusDisplay Text component (optional)

### Step 4: Text Component Settings

**LiveTranscriptionDisplay**:
- Font Size: 48-60
- Alignment: Center
- Overflow: Wrap
- Outline: Enabled (black, size 0.25)
- Position: Center screen

**StatusDisplay**:
- Font Size: 32-40
- Alignment: Center
- Position: Top of screen
- Color: Bright yellow/green

## 🎮 How It Works

### Live Transcription Flow:
1. **Initialization**: Script starts and shows "Ready to listen..."
2. **Listening**: Status shows "🎤 Listening..." 
3. **Interim Results**: Shows "... [partial text]" as you speak
4. **Final Results**: Shows "✅ [complete text]" when speech is complete
5. **Continuous**: Automatically restarts listening (if enabled)

### Visual Feedback:
- **🎤 Ready to listen...** - Initial state
- **🎤 Listening...** - Actively listening for speech
- **... [text]** - Partial/interim transcription
- **✅ [text]** - Final confirmed transcription
- **🔄 Processing...** - Processing speech
- **✅ Complete** - Transcription finished

## 🔧 Advanced Configuration

### Manual Control (SnapchatSTT.js only):
```javascript
// Start listening manually
script.startListening();

// Stop listening manually  
script.stopListening();
```

### Continuous Listening:
- Enable `enableContinuousListening` for automatic restart
- Disable for single-shot transcription

## 🚀 Testing

1. **In Lens Studio Preview**:
   - Check console logs for initialization messages
   - Speak into microphone
   - Verify text appears on screen

2. **On Snap Spectacles**:
   - Deploy to device
   - Grant microphone permissions
   - Speak clearly and watch for live transcription

## 🐛 Troubleshooting

### Issue: "No transcription appearing"
**Solutions:**
- Check microphone permissions
- Verify Text components are connected to script inputs
- Check console logs for error messages
- Ensure Audio Listener is properly configured

### Issue: "Text not visible"
**Solutions:**
- Increase font size
- Add outline/shadow to text
- Check text color contrast
- Verify text component positioning

### Issue: "Script not starting"
**Solutions:**
- Check VoiceML module is available
- Verify script is attached to scene object
- Check console for initialization errors

## 📱 Best Practices

1. **Text Visibility**:
   - Use large font sizes (48-60px)
   - Add black outline to white text
   - Position in center of view

2. **User Experience**:
   - Show clear status indicators
   - Provide visual feedback for interim results
   - Use emojis for quick status recognition

3. **Performance**:
   - Enable continuous listening for hands-free operation
   - Use interim results for real-time feedback
   - Monitor console logs for debugging

## 🎉 You're Done!

Your speech-to-text system is now ready! Put on your Snap Spectacles and start speaking to see live transcription appear in your field of view.

The system will:
- ✅ Listen continuously for speech
- ✅ Show real-time transcription
- ✅ Provide visual status feedback
- ✅ Work seamlessly with AR interactions

For questions or issues, check the console logs in Lens Studio.
