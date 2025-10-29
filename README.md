# SnapVoiceAI

[![Experimental API](https://img.shields.io/badge/Spectacles-Experimental_API-FFFC00?logo=snapchat&labelColor=000000)](https://spectacles.snap.dev)

---
https://www.youtube.com/watch?v=_a314_yfQq8

## Project Description
A real-time AI conversation assistant for Snap Spectacles. Helps users understand conversations and respond appropriately by providing contextual suggestions based on speech, emotion, and visual scene analysis.

## Features
- **Real-time Speech Transcription**: Continuous voice input processing using Snapchat STT
- **Live AI Suggestions**: Groq-powered conversation coaching with sub-second response times
- **Visual Context**: AI analyzes the scene to provide contextually relevant suggestions
- **Emotion Detection**: Tracks emotional tone to tailor suggestions
- **Web Search Integration**: Tavily-powered background search for relevant information

## Technical Stack
| Component | Technology |
|-----------|-----------|
| AR Platform | Snap Spectacles Experimental API |
| Speech-to-Text | Snapchat STT |
| AI Models | Groq (Llama 3.1 8B Instant) |
| Scene Analysis | Groq Vision (Meta Llama 4 Scout) |
| Web Search | Tavily API |
| Emotion Detection | Reka Emotion Analyzer |

## Setup
### Prerequisites
- Snap Spectacles (2021 or later)
- Lens Studio (v5.7.2.25 or later)
- API Keys:
  - Groq API key
  - Tavily API key

### Configuration
1. Clone the repository:
   ```bash
   git clone https://github.com/varbtw/SnapVoiceAI.git
   ```

2. Open the project in Lens Studio

3. Configure API keys in the Inspector:
   - `GroqModelSuggestions`: Set your Groq API key
   - `GroqSceneAnalyzer`: Set your Groq API key
   - `TavilySuggestions`: Set your Tavily API key

4. Connect components as shown in the Scene hierarchy

## Usage
Once configured, speak into your Spectacles and receive real-time AI-powered conversation suggestions based on what you're seeing and saying.
