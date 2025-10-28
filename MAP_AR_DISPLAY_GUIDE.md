# How to Display Map Inside Snap Spectacles Glasses

## Quick Setup (5 minutes)

### What You'll See in the Glasses:
```
🗺️ MAP VIEW
📍 You are here
Lat: 37.774900
Lon: -122.419400

🌍 37°46'N, 122°25'W
```

## Step-by-Step Instructions

### Step 1: Add Script Components to Your Scene

1. Open your project in Lens Studio
2. In the **Objects Panel**, create a new SceneObject:
   - Right-click → Create New → SceneObject
   - Name it: `LocationTrackerObject`
3. Add **LocationTracker.js** script to it:
   - Select the object
   - In **Inspector** → Click "Add Component" → Script Component → LocationTracker
4. Create another SceneObject:
   - Name it: `MapDisplayObject`
5. Add **MapDisplay.js** script to it

### Step 2: Create Text Component for Map Display

1. Create a new Text object:
   - Right-click → Create New → Text
   - Name it: `MapText`
2. Position it where you want the map info to appear:
   - **Position**: `0, 250, 0` (in front of camera)
   - **Scale**: `5, 5, 1` (make it readable)
3. Style the text:
   - Color: Yellow or bright color (visible on camera feed)
   - Size: 32 or larger
   - Alignment: Center

### Step 3: Connect Components

1. Select **LocationTrackerObject**:
   - In Inspector, find "Location Tracker" script
   - Set **locationText**: Drag the `MapText` object here
   - Set **updateInterval**: `1.0` (update every second)
   - Set **enableDebug**: `true`

2. Select **MapDisplayObject**:
   - Find "Map Display" script
   - Set **locationTrackerScript**: Drag `LocationTrackerObject` here
   - Set **mapText**: Drag the same `MapText` object here
   - Set **mapZoom**: `15` (good zoom level)
   - Set **enableDebug**: `true`

### Step 4: Position in AR View

Adjust the Text position so it appears in your view:

1. In **Preview** mode, move the text object:
   - Position: `0, 250, -100` (in front of camera)
   - Rotation: `0, 0, 0`
   - Scale: `3, 3, 1`

2. The text will overlay on your camera feed in the glasses

### Step 5: Test It

1. Open **Preview** in Lens Studio
2. You should see the coordinates updating
3. On actual Snap Spectacles, you'll get real GPS coordinates
4. In desktop preview, you'll see mock San Francisco location

## Visual Layout in Glasses

```
┌─────────────────────────────────┐
│    Camera Feed (what you see)    │
│                                  │
│      🗺️ MAP VIEW                  │
│      📍 You are here             │
│      Lat: 37.774900             │
│      Lon: -122.419400           │
│                                  │
│      🌍 37°46'N, 122°25'W       │
│                                  │
└─────────────────────────────────┘
```

## Optional: Add Mapbox Token for Mapbox URLs

If you want to use Mapbox static maps instead of coordinates:

1. Get a free Mapbox token from: https://account.mapbox.com/
2. In **MapDisplayObject** script:
   - Set **mapboxToken**: Paste your token
3. The script will generate Mapbox map URLs (shown in console)

## Adjusting Position in Glasses

The text appears as an overlay. To adjust where you see it:

1. Select `MapText` object
2. In **Transform**:
   - **Position Y**: Increase to move up, decrease to move down
   - **Position X**: Positive = right, negative = left
   - **Position Z**: Negative = closer to camera

**Recommended Settings:**
- **Position**: `0, 250, -50`
- **Size**: `32pt` or larger
- **Color**: Bright yellow (visible on any background)

## Troubleshooting

### Don't see the text?
- Make sure both scripts are connected
- Check that `MapText` is connected to both scripts
- Enable debug mode to see logs

### Text is too small?
- Increase font size to 40 or larger
- Increase Scale transform (3, 3, 1)

### Want to move the text?
- Adjust Position Y to move up/down
- Adjust Position X to move left/right
- Adjust Position Z to bring closer/farther

## Example Scene Setup

```
📁 Scene Hierarchy
├── 📁 LocationTrackerObject
│   └── LocationTracker.js script
├── 📁 MapDisplayObject  
│   └── MapDisplay.js script
└── 📄 MapText (Text component)
    ├── Connected to LocationTracker
    └── Connected to MapDisplay
```

## Running on Actual Spectacles

1. Deploy to your Spectacles
2. Location tracking will request GPS permissions
3. You'll see your real-time location coordinates
4. Coordinates update every second

## Next Steps

Once you have coordinates displaying, you can:
- Add reverse geocoding to show street addresses
- Add distance tracking ("You are 0.5 miles from...")
- Integrate with Groq to add location-aware suggestions
- Add navigation arrows

## API Reference

### Get Current Location
```javascript
const location = mapDisplayScript.api.getCurrentLocation();
// Returns: {latitude: 37.7749, longitude: -122.4194}
```

### Get Map URL
```javascript
const mapURL = mapDisplayScript.api.getMapURL();
// Returns: "https://www.google.com/maps/@37.7749,-122.4194,15z"
```

## Need Help?

Check the console logs with `enableDebug: true` to see:
- Current location updates
- Map URL generation
- Any errors in tracking

