# Location Tracking & Map Display Setup Guide

## Overview
This feature adds GPS location tracking and a map display to your Snap Spectacles AR glasses. It shows your current coordinates and displays them in a user-friendly format.

## Components

### 1. LocationTracker.js
**Purpose**: Gets GPS coordinates from the device

**Inputs**:
- `locationText` (Text) - Text component to display location info
- `coordinatesText` (Text) - Text component to display raw coordinates
- `enableDebug` (bool) - Enable/disable debug logs
- `updateInterval` (float) - How often to update location (default: 1 second)

**Features**:
- Automatically requests GPS permissions
- Updates location at regular intervals
- Falls back to mock location for testing
- Exposes location data via API

**Usage in Code**:
```javascript
// Get current location
const location = locationTrackerScript.api.getCurrentLocation();
// Returns: {latitude, longitude, altitude}

// Check if tracking
const isTracking = locationTrackerScript.api.isTracking();
```

### 2. MapDisplay.js
**Purpose**: Displays location on a map with coordinates

**Inputs**:
- `locationTrackerScript` (ScriptComponent) - **Required** - Drag LocationTracker script here
- `mapText` (Text) - Text component to display map view
- `mapVisual` (SpriteVisual) - Visual component for map (optional)
- `enableDebug` (bool) - Enable/disable debug logs
- `mapScale` (float) - Map zoom level (default: 0.001)

**Features**:
- Shows coordinates in decimal format
- Converts to DMS (Degrees, Minutes, Seconds) format
- Updates every 2 seconds
- Clean, readable display

**Display Format**:
```
🗺️ MAP VIEW
📍 You are here
Lat: 37.774900
Lon: -122.419400

🌍 37°46'N, 122°25'W
```

## Setup Instructions

### Step 1: Create Text Components
1. In Lens Studio, create a new Text object for location display
2. Create another Text object for map display
3. Position them where you want the location info to appear

### Step 2: Add Scripts to Scene
1. Add **LocationTracker** script component to your scene
2. Add **MapDisplay** script component to your scene
3. Connect the inputs:
   - LocationTracker → locationText: Your first text component
   - LocationTracker → coordinatesText: Your second text component (optional)
   - MapDisplay → locationTrackerScript: Drag the LocationTracker script
   - MapDisplay → mapText: Your second text component

### Step 3: Configure Settings
**LocationTracker**:
- `updateInterval`: Set how often to update (1.0 = 1 second, 0.5 = twice per second)
- `enableDebug`: Set to true for development, false for production

**MapDisplay**:
- `mapScale`: Adjust zoom level (smaller = more zoomed in)
- `enableDebug`: Set to true for development

## Important Notes

### GPS Permissions
- Location tracking requires GPS permissions from the device
- On first launch, Snap Spectacles will request location permissions
- Make sure location services are enabled on your device

### Testing
- If GPS is not available (e.g., in Lens Studio simulator), the system will use a mock location (San Francisco, CA)
- Mock location includes slight movement to simulate walking

### Performance
- Location updates every 1 second by default
- Map display updates every 2 seconds
- Adjust `updateInterval` to balance accuracy and battery life
- Set to 5+ seconds for better battery life
- Set to 0.5 seconds for more real-time tracking

## Limitations

### Lens Studio
- GPS may not work in Lens Studio desktop preview
- Test on actual Snap Spectacles device for real GPS
- Use mock location for development

### Snap Spectacles
- Requires real device with GPS capability
- Must have location permissions enabled
- Requires active GPS signal (may not work indoors)

## Integration with Existing Features

### With GroqModelSuggestions
You can use location data to enhance conversation suggestions:

```javascript
// In your GroqModelSuggestions.js
const location = locationTrackerScript.api.getCurrentLocation();
const prompt = `User is at ${location.latitude}, ${location.longitude}. ${transcript}`;
```

### With Scene Analysis
Combine location with visual context:

```javascript
const location = locationTrackerScript.api.getCurrentLocation();
const sceneAnalysis = groqSceneAnalyzerScript.api.getCurrentAnalysis();
const emotion = rekaEmotionScript.api.getCurrentEmotion();

// Send all context to Groq
requestGroqSuggestion(transcript, emotion, sceneAnalysis, location);
```

## Troubleshooting

### "Geolocation not available"
- Normal in Lens Studio desktop
- Will work on actual Snap Spectacles
- Use mock location for testing

### Location not updating
- Check that `updateInterval` is reasonable (try 1.0)
- Enable debug logs to see activity
- Verify locationTrackerScript is connected

### Wrong coordinates
- Mock location is set to San Francisco
- Will show real GPS coordinates on actual device
- Make sure location services are enabled

## API Reference

### LocationTracker API
```javascript
// Get current location
script.api.getCurrentLocation()
// Returns: {latitude: number, longitude: number, altitude: number}

// Check if actively tracking
script.api.isTracking()
// Returns: boolean
```

### MapDisplay API
```javascript
// Get current displayed location
script.api.getCurrentLocation()
// Returns: {latitude: number, longitude: number}

// Manually set location (for testing)
script.api.setLocation(lat, lon)
```

## Next Steps
- Add reverse geocoding to get street addresses
- Add navigation/routing features
- Integrate with distance tracking
- Add location-based memory/context

