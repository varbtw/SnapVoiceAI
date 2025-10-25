# Décor Assistant: AR Interior Design for Spectacles

[![Experimental 
API](https://img.shields.io/badge/Spectacles-Experimental_API-FFFC00?logo=snapchat&labelColor=000000)](https://spectacles.snap.dev)
[![World Query 
Hit](https://img.shields.io/badge/World_Query_Hit-AR_Placement-6E6E6E)](https://docs.snap.com/lens-studio/references/guides/worldmesh/worldmesh-overview)
[![Spawn On 
Surface](https://img.shields.io/badge/Spawn_On_Surface-Object_Placement-8E8E8E)](https://docs.snap.com/lens-studio/references/guides/worldmesh/spawning-objects)
[![Surface 
Detection](https://img.shields.io/badge/Surface_Detection-WorldMesh-9E9E9E)](https://docs.snap.com/lens-studio/references/guides/worldmesh/worldmesh-basics)
[![SIK 
TTS](https://img.shields.io/badge/SIK-Text_To_Speech-00F4FF)](https://docs.snap.com/lens-studio/references/guides/audio/sik-text-to-speech)
[![AI 
Vision](https://img.shields.io/badge/AI_Vision-WorldQueryHit-8A2BE2)](https://docs.snap.com/lens-studio/references/guides/worldmesh/worldmesh-overview)

🔗 **Built on Snap's [AI Assistant Sample](https://github.com/Snapchat/Spectacles-Sample/tree/main/AI%20Assistant)**  
*(Original features: Text-to-Speech, Camera Access, AI Vision, Fetch API)*

---

## Project Description
Décor Assistant is an augmented reality tool built for Snap Spectacles, enabling users to visualize and interact with interior design 
concepts within their own physical spaces. This project leverages Snap's AI Assistant Sample as a foundation, extending its capabilities for 
intelligent spatial design.

## Base Project Features
- Voice commands (SIK Text-to-Speech)
- Real-time camera feed processing
- HTTP requests via Fetch API

## Key Features
**Surface-Aware AR Placement**: Precisely anchors virtual décor objects to detected walls and floors using WorldQueryHit (integrated from 
Snap's AI Assistant Sample).

**AI-Powered Style Analysis**: Employs custom integration with GPT-4o to analyze scanned room environments and suggest relevant interior 
design styles.

**DALLE Visualization**: Generates photorealistic image previews of redesigned spaces based on AI style recommendations and user 
customizations.

**Dual Interaction Modes**:
- Toggle between AI suggestions & manual drag-and-drop
  - **AI Suggestions Mode**: Receives automated décor style recommendations and visualizations driven by AI.
  - **Manual Design Mode**: Allows for direct and intuitive placement of virtual objects using SpawnOnSurface for personalized design.

## 🛠️ Technical Stack
| Component | Source |
|-----------|--------|
| AR Foundation | Snap Spectacles Experimental API |
| Surface Detection | Custom WorldQueryHit extensions |
| AI Integration | OpenAI GPT-4o + DALLE-3 |
| 3D Models | CREDITS.md |

## 🛠️ Technical Implementation
**Base Project**: Modified version of Snap's AI Assistant Sample (developed with Lens Studio v5.7.2.25).

**Key Extensions**:
- **Custom OpenAI Integration**: Seamlessly integrates GPT-4o for intelligent style analysis and DALLE for realistic image generation.

## Demo Video
## 🎬 Demo

[![Décor Assistant Demo](https://img.youtube.com/vi/n2HYkKANrEA/0.jpg)](https://www.youtube.com/watch?v=n2HYkKANrEA "Décor Assistant Demo - 
Click to Watch!")
## ⚙️ Setup
### Prerequisites
- Snap Spectacles (2021 or later)
- Lens Studio (v5.7.2.25 or later)
- OpenAI API key with access to both GPT-4o and DALLE models.

### Run the Project
1. Clone the repository:
   ```bash
   git clone [this-repository-url]




