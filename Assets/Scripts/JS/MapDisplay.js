// @input Component.ScriptComponent locationTrackerScript {"hint":"Drag the LocationTracker script component"}
// @input Component.Text mapText {"hint":"Text component to display map coordinates"}
// @input Component.SpriteVisual mapVisual {"hint":"Visual component for map display - will show the map image"}
// @input string mapboxToken {"hint":"Optional Mapbox access token for better maps (get from mapbox.com)"}
// @input bool enableDebug = true
// @input float mapScale = 0.001 {"hint":"How much map to show (higher = more zoomed in)"}
// @input int mapZoom = 15 {"hint":"Map zoom level (10-18, higher = more zoomed in)"}

const Internet = require("LensStudio:InternetModule");

print("🗺️ [MAP DISPLAY] Initializing...");

let currentLatitude = 37.7749; // Default San Francisco
let currentLongitude = -122.4194;
let currentMapURL = "";

script.createEvent("OnStartEvent").bind(function() {
    print("🗺️ [MAP DISPLAY] Starting...");
    
    if (!script.locationTrackerScript) {
        print("❌ [MAP DISPLAY] LocationTracker not connected!");
        return;
    }
    
    if (script.mapText) {
        print("✅ [MAP DISPLAY] Map text connected");
    }
    
    // Start update loop
    startMapUpdates();
});

function startMapUpdates() {
    const updateEvent = script.createEvent("UpdateEvent");
    let lastUpdateTime = 0;
    
    updateEvent.bind(function() {
        const now = getTime();
        
        // Update every 2 seconds
        if (now - lastUpdateTime < 2.0) {
            return;
        }
        
        lastUpdateTime = now;
        
        // Get current location from LocationTracker
        try {
            const location = script.locationTrackerScript.api.getCurrentLocation();
            
            if (location) {
                currentLatitude = location.latitude;
                currentLongitude = location.longitude;
                
                // Update map texture
                updateMapTexture();
            }
        } catch (e) {
            debugLog("⚠️ [MAP] Error getting location: " + e);
        }
    });
    
    // Initial update
    updateMapTexture();
}

function updateMapTexture() {
    debugLog("🗺️ [MAP] Updating map at " + currentLatitude.toFixed(4) + ", " + currentLongitude.toFixed(4));
    
    // Update map display text with coordinates
    if (script.mapText) {
        script.mapText.text = 
            "🗺️ MAP VIEW\n" +
            "📍 You are here\n" +
            "Lat: " + currentLatitude.toFixed(6) + "\n" +
            "Lon: " + currentLongitude.toFixed(6) + "\n" +
            "\n" +
            "🌍 " + convertToDMS(currentLatitude, currentLongitude);
    }
    
    // Load actual map image if visual component is connected
    if (script.mapVisual) {
        loadMapImage();
    }
}

function convertToDMS(lat, lon) {
    // Convert decimal degrees to degrees, minutes, seconds
    const latDir = lat >= 0 ? 'N' : 'S';
    const lonDir = lon >= 0 ? 'E' : 'W';
    
    const latDeg = Math.abs(Math.floor(lat));
    const latMin = Math.abs(Math.floor((lat - Math.floor(lat)) * 60));
    
    const lonDeg = Math.abs(Math.floor(lon));
    const lonMin = Math.abs(Math.floor((lon - Math.floor(lon)) * 60));
    
    return `${latDeg}°${latMin}'${latDir}, ${lonDeg}°${lonMin}'${lonDir}`;
}

function loadMapImage() {
    debugLog("🌐 [MAP] Preparing map URL...");
    
    let mapURL = "";
    
    // Generate map URL (Mapbox or OpenStreetMap)
    if (script.mapboxToken && script.mapboxToken.length > 0) {
        // Use Mapbox Static API (high quality, requires token)
        const style = "mapbox/streets-v12"; // Options: streets-v12, dark-v10, satellite-v9
        const size = "512x512";
        const zoom = script.mapZoom || 15;
        mapURL = `https://api.mapbox.com/styles/v1/${style}/static/${currentLongitude},${currentLatitude},${zoom}/${size}?access_token=${script.mapboxToken}`;
        
        debugLog("🗺️ [MAP] Mapbox URL: " + mapURL.substring(0, 80));
        debugLog("💡 [MAP] To view the map:");
        debugLog("   1. Copy the URL above");
        debugLog("   2. Open it in a browser");
        debugLog("   3. Use Lens Studio's WebTexture to load it");
    } else {
        // Generate a simple map link
        mapURL = `https://www.google.com/maps/@${currentLatitude},${currentLongitude},${script.mapZoom || 15}z`;
        debugLog("🗺️ [MAP] Google Maps link: " + mapURL);
        debugLog("💡 [MAP] Open this URL in your device browser to see the map");
    }
    
    // Store URL for external access
    currentMapURL = mapURL;
    
    debugLog("📍 [MAP] Current location: " + currentLatitude.toFixed(6) + ", " + currentLongitude.toFixed(6));
}

function debugLog(msg) {
    if (script.enableDebug) {
        print(msg);
    }
}

// Public API
script.api.setLocation = function(lat, lon) {
    currentLatitude = lat;
    currentLongitude = lon;
    updateMapTexture();
};

script.api.getCurrentLocation = function() {
    return {
        latitude: currentLatitude,
        longitude: currentLongitude
    };
};

script.api.getMapURL = function() {
    return currentMapURL;
};

print("✅ [MAP DISPLAY] Ready!");

