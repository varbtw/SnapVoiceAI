// @input Component.Text locationText {"hint":"Text component to display location"}
// @input Component.Text coordinatesText {"hint":"Text component to display coordinates"}
// @input bool enableDebug = true
// @input float updateInterval = 1.0 {"hint":"Update location every N seconds"}

print("🔷 [LOCATION TRACKER] Initializing...");

let currentLatitude = 0.0;
let currentLongitude = 0.0;
let currentAltitude = 0.0;
let isTracking = false;

script.createEvent("OnStartEvent").bind(function() {
    print("🔷 [LOCATION TRACKER] Starting...");
    
    // Check if geolocation is available
    try {
        const GeolocationModule = require("LensStudio:GeolocationModule");
        print("✅ [LOCATION TRACKER] GeolocationModule available");
        
        // Request location permissions
        if (typeof GeolocationModule.requestPermissions === 'function') {
            GeolocationModule.requestPermissions();
        }
        
        // Start location tracking
        startLocationTracking();
    } catch (e) {
        print("❌ [LOCATION TRACKER] Error: " + e);
        print("💡 Geolocation may not be available in this Lens Studio version");
        
        // Fallback: Use mock location for testing
        startMockLocation();
    }
});

function startLocationTracking() {
    print("📍 [LOCATION TRACKER] Starting location updates every " + script.updateInterval + "s");
    
    isTracking = true;
    const updateEvent = script.createEvent("UpdateEvent");
    let lastUpdateTime = 0;
    
    updateEvent.bind(function() {
        const now = getTime();
        
        if (now - lastUpdateTime < script.updateInterval) {
            return;
        }
        
        lastUpdateTime = now;
        
        try {
            const GeolocationModule = require("LensStudio:GeolocationModule");
            
            // Get current location
            if (typeof GeolocationModule.getCurrentPosition === 'function') {
                GeolocationModule.getCurrentPosition(function(position) {
                    updateLocation(position.latitude, position.longitude, position.altitude || 0);
                }, function(error) {
                    debugLog("❌ [LOCATION] Error getting position: " + error);
                });
            } else {
                // Try alternate API
                updateLocation(
                    GeolocationModule.latitude,
                    GeolocationModule.longitude,
                    GeolocationModule.altitude || 0
                );
            }
        } catch (e) {
            debugLog("⚠️ [LOCATION] Error in update: " + e);
        }
    });
}

function startMockLocation() {
    print("🧪 [LOCATION TRACKER] Using MOCK location for testing");
    print("💡 Replace with real GeolocationModule when available");
    
    // Mock location (San Francisco, CA)
    let mockLat = 37.7749;
    let mockLon = -122.4194;
    let mockAlt = 0;
    
    // Update mock location with slight variations to simulate movement
    const updateEvent = script.createEvent("UpdateEvent");
    let lastUpdateTime = 0;
    let timeOffset = 0;
    
    updateEvent.bind(function() {
        const now = getTime();
        
        if (now - lastUpdateTime < script.updateInterval) {
            return;
        }
        
        lastUpdateTime = now;
        timeOffset += 0.00001; // Small drift to simulate movement
        
        // Add slight random movement
        const driftLat = (Math.random() - 0.5) * 0.0001;
        const driftLon = (Math.random() - 0.5) * 0.0001;
        
        updateLocation(mockLat + driftLat, mockLon + driftLon, mockAlt);
    });
}

function updateLocation(lat, lon, alt) {
    currentLatitude = lat;
    currentLongitude = lon;
    currentAltitude = alt;
    
    debugLog("📍 [LOCATION] Lat: " + lat.toFixed(6) + ", Lon: " + lon.toFixed(6));
    
    // Update text displays
    updateLocationDisplay();
}

function updateLocationDisplay() {
    // Update coordinates text
    if (script.coordinatesText) {
        script.coordinatesText.text = 
            "📍 " + currentLatitude.toFixed(6) + ", " + currentLongitude.toFixed(6);
    }
    
    // Update location text with address (would require reverse geocoding)
    if (script.locationText) {
        script.locationText.text = 
            "📍 Location\n" + 
            "Lat: " + currentLatitude.toFixed(4) + "\n" +
            "Lon: " + currentLongitude.toFixed(4);
    }
}

function debugLog(msg) {
    if (script.enableDebug) {
        print(msg);
    }
}

// Public API
script.api.getCurrentLocation = function() {
    return {
        latitude: currentLatitude,
        longitude: currentLongitude,
        altitude: currentAltitude
    };
};

script.api.isTracking = function() {
    return isTracking;
};

print("✅ [LOCATION TRACKER] Ready!");

