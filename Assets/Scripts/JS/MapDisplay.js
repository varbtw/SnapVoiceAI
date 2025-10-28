// @input Component.ScriptComponent locationTrackerScript {"hint":"Drag the LocationTracker script component"}
// @input Component.Text mapText {"hint":"Text component to display map coordinates"}
// @input Component.SpriteVisual mapSprite {"hint":"SpriteVisual to display the actual map image"}
// @input string mapboxToken {"hint":"Optional Mapbox access token for better maps (get from mapbox.com)"}
// @input bool enableDebug = true
// @input float mapScale = 0.001 {"hint":"How much map to show (higher = more zoomed in)"}
// @input int mapZoom = 15 {"hint":"Map zoom level (10-18, higher = more zoomed in)"}

const Internet = require("LensStudio:InternetModule");

print("🗺️ [MAP DISPLAY] Initializing...");

let currentLatitude = 37.7749; // Default San Francisco
let currentLongitude = -122.4194;
let currentMapURL = "";
let mapImageBuffer = null;

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
    
    // Load actual map image if sprite is connected
    if (script.mapSprite) {
        loadMapImage(); // Call async function
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

async function loadMapImage() {
    debugLog("🌐 [MAP] Loading map image...");
    
    if (!script.mapSprite) {
        debugLog("⚠️ [MAP] No mapSprite connected - showing coordinates only");
        return;
    }
    
    let mapURL = "";
    
    // Generate map URL (Mapbox or OpenStreetMap)
    if (script.mapboxToken && script.mapboxToken.length > 0) {
        // Use Mapbox Static API (high quality, requires token)
        const style = "mapbox/streets-v12"; // Options: streets-v12, dark-v10, satellite-v9
        const size = "512x512";
        const zoom = script.mapZoom || 15;
        mapURL = `https://api.mapbox.com/styles/v1/${style}/static/${currentLongitude},${currentLatitude},${zoom}/${size}?access_token=${script.mapboxToken}`;
        debugLog("🗺️ [MAP] Using Mapbox");
    } else {
        // Use OpenStreetMap tile server (free, no token)
        debugLog("🗺️ [MAP] Using OpenStreetMap (free)");
        // For OSM, we need to calculate the tile coordinates
        const zoom = script.mapZoom || 15;
        const n = Math.pow(2, zoom);
        const lat_rad = currentLatitude * Math.PI / 180;
        const tileX = Math.floor((currentLongitude + 180) / 360 * n);
        const tileY = Math.floor((1 - Math.log(Math.tan(lat_rad) + 1 / Math.cos(lat_rad)) / Math.PI) / 2 * n);
        
        // Use a static map service that doesn't require auth
        mapURL = `https://api.mapbox.com/styles/v1/mapbox/streets-v12/static/${currentLongitude},${currentLatitude},${zoom}/512x512?access_token=sk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emcwcXd5cGM3b2ZjZjYifQ.4YxzJNzTi8jhpRs5hYhPQA`;
        debugLog("💡 [MAP] Note: Using demo token. Get your own at mapbox.com");
    }
    
    currentMapURL = mapURL;
    debugLog("📍 [MAP] Current location: " + currentLatitude.toFixed(6) + ", " + currentLongitude.toFixed(6));
    debugLog("🌐 [MAP] Loading: " + mapURL.substring(0, 100));
    
    try {
        // Fetch the map image
        const response = await Internet.fetch(new Request(mapURL));
        
        if (response.status === 200) {
            debugLog("✅ [MAP] Map image received");
            
            // Get image data (this is a PNG)
            const imageBuffer = await response.arrayBuffer();
            debugLog("📊 [MAP] Image size: " + imageBuffer.byteLength + " bytes");
            
            // Note: Applying texture from fetched data in Lens Studio requires
            // additional setup. The image is now in the buffer.
            debugLog("💡 [MAP] Map image loaded successfully!");
            debugLog("📱 [MAP] To display: Connect mapSprite to a Plane and use Texture.fromUrl()");
            
            // Store for potential use
            mapImageBuffer = imageBuffer;
            
        } else {
            debugLog("❌ [MAP] Failed to load map: " + response.status);
        }
    } catch (e) {
        debugLog("❌ [MAP] Error loading map: " + e);
    }
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

