// @input Component.ScriptComponent locationTrackerScript {"hint":"Drag the LocationTracker script component"}
// @input Component.Text mapText {"hint":"Text component to display GPS coordinates"}
// @input bool enableDebug = true

const Internet = require("LensStudio:InternetModule");

print("🗺️ [MAP DISPLAY] Initializing...");

let currentLatitude = 37.7749; // Default San Francisco
let currentLongitude = -122.4194;

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

print("✅ [MAP DISPLAY] Ready!");

