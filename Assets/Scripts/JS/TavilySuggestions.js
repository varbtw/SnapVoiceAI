// @input Component.Text webResultsText {"hint":"Text component to display web search results"}
// @input Component.Text statusText {"hint":"Optional status indicator"}
// @input Component.Text claudeSuggestionText {"hint":"Drag the SAME text component that GroqModelSuggestions uses (suggestionText)"}
// @input Component.ScriptComponent claudeIntegrationScript {"hint":"Drag the GroqModelSuggestions script component here"}
// @input string tavilyApiKey {"hint":"Tavily API Key"}
// @input int maxResults = 3 {"hint":"Maximum number of search results to display"}
// @input bool enableDebug = true
// @input string systemPrompt = ""
// @input bool autoRewriteQuery = true {"hint":"Automatically rewrite user questions into search-friendly queries"}


print("========================================");
print("🔍 TAVILY WEB SEARCH - LOADING");
print("========================================");

const Internet = require("LensStudio:InternetModule");

let isSearching = false;
let lastClaudeSuggestion = "";
let lastSearchResults = null;

script.createEvent("OnStartEvent").bind(function() {
    print("========================================");
    print("✅ TAVILY SUGGESTIONS - INITIALIZED");
    print("========================================");
    
    // Check all required inputs
    if (!script.tavilyApiKey || script.tavilyApiKey.length === 0) {
        print("❌ ERROR: Tavily API key not set!");
        print("Please add your Tavily API key in the Inspector");
    } else {
        print("✓ Tavily API Key: " + script.tavilyApiKey.substring(0, 10) + "...");
    }
    
    if (!script.claudeSuggestionText) {
        print("❌ ERROR: Claude suggestion text not connected!");
        print("Please drag the SAME text component that GroqModelSuggestions uses to 'Claude Suggestion Text'");
    } else {
        print("✓ Claude suggestion text connected");
    }
    
    if (!script.claudeIntegrationScript) {
        print("❌ ERROR: GroqModelSuggestions script not connected!");
        print("Please drag the GroqModelSuggestions script component to 'Claude Integration Script'");
    } else {
        print("✓ GroqModelSuggestions script connected");
    }
    
    if (script.webResultsText) {
        script.webResultsText.text = "Ready for web search...";
        print("✓ Web results text connected");
    } else {
        print("⚠️ WARNING: Web results text not connected (results will only show in console)");
    }
    
    if (script.statusText) {
        print("✓ Status text connected");
    } else {
        print("⚠️ WARNING: Status text not connected (optional)");
    }
    
    print("Max Results: " + script.maxResults);
    print("Debug Mode: " + script.enableDebug);
    
    // Set a reasonable default if maxResults is too high
    if (script.maxResults > 5) {
        print("⚠️ WARNING: Max results is set to " + script.maxResults + " which may be too long to display!");
        print("⚠️ Consider setting it to 3-5 for better readability");
    }
    
    print("========================================");
    
    // Set up polling to check for Claude suggestions
    setupClaudeListener();
    
    print("🔄 Listening for Claude suggestions every 2 seconds...");
    print("========================================\n");
});

function setupClaudeListener() {
    print("🔧 [TAVILY] Setting up Claude output listener...");
    
    // Poll every 2 seconds to check for new Claude suggestions
    const updateEvent = script.createEvent("UpdateEvent");
    let lastCheckTime = 0;
    
    print("✅ [TAVILY] UpdateEvent created - polling will begin");
    
    updateEvent.bind(function() {
        const now = getTime();
        
        // Check every 2 seconds
        if (now - lastCheckTime < 2.0) {
            return;
        }
        
        lastCheckTime = now;
        
        // Get Claude's suggestion
        const suggestion = getClaudeSuggestion();
        
        debugLog("🔍 [TAVILY POLL] Checking for new Claude suggestion...");
        debugLog("   Last suggestion: " + (lastClaudeSuggestion || "(none)"));
        debugLog("   Current suggestion: " + (suggestion || "(none)"));
        
        if (suggestion && suggestion !== lastClaudeSuggestion && suggestion.length > 0) {
            print("========================================");
            print("🆕 [TAVILY] NEW CLAUDE SUGGESTION DETECTED");
            print("========================================");
            print("💡 Claude said: " + suggestion);
            print("🕐 Time: " + now.toFixed(2));
            print("========================================");
            
            // Get the user's original question from GroqModelSuggestions
            let userQuestion = "";
            if (script.claudeIntegrationScript && script.claudeIntegrationScript.api && script.claudeIntegrationScript.api.getUserTranscript) {
                userQuestion = script.claudeIntegrationScript.api.getUserTranscript();
                print("👤 [TAVILY] User transcript retrieved: " + userQuestion);
            } else {
                print("⚠️ [TAVILY] Could not get user transcript - GroqModelSuggestions API not available");
            }
            
            // If we have the user's question, search for that instead of Claude's suggestion
            const searchQuery = userQuestion && userQuestion.length > 0 ? userQuestion : suggestion;
            print("📋 [TAVILY] Query source: " + (userQuestion && userQuestion.length > 0 ? "User transcript" : "suggestion"));
            print("🔍 [TAVILY] Will search Tavily for: " + searchQuery);
            print("========================================");
            
            lastClaudeSuggestion = suggestion;
            
            print("▶️ [TAVILY] Triggering search...");
            searchTavily(searchQuery);
        } else if (suggestion === lastClaudeSuggestion) {
            // Duplicate suggestion - don't search again
            debugLog("⏭️ [TAVILY] Duplicate suggestion detected - skipping search");
        } else if (!suggestion || suggestion.length === 0) {
            debugLog("⏳ [TAVILY] No suggestion yet - waiting...");
        }
    });
}

function getClaudeSuggestion() {
    try {
        if (!script.claudeSuggestionText) {
            return "";
        }
        
        // Read directly from the text component
        if (script.claudeSuggestionText.text) {
            let text = script.claudeSuggestionText.text;
            
            // Remove the emoji prefix if present
            if (text.indexOf("💡 ") === 0) {
                text = text.substring(2).trim();
            }
            
            const cleanText = text.trim();
            
            // Only log when there's actual text (avoid spam)
            if (cleanText.length > 0 && cleanText !== "Ready for web search..." && cleanText !== "🎯 Ready") {
                debugLog("📖 Read from Claude: '" + cleanText + "'");
            }
            
            return cleanText;
        }
    } catch (e) {
        print("⚠️ Error getting Claude suggestion: " + e);
    }
    
    return "";
}

async function searchTavily(query) {
    print("🚀 [TAVILY] searchTavily() called with query: " + query);
    print("   isSearching: " + isSearching);
    print("   has API key: " + (script.tavilyApiKey && script.tavilyApiKey.length > 0));
    
    if (isSearching) {
        debugLog("⏸️ [TAVILY] Already searching - skipping duplicate request");
        return;
    }
    
    if (!script.tavilyApiKey || script.tavilyApiKey.length === 0) {
        print("❗ [TAVILY] ERROR: Missing Tavily API Key");
        setStatus("⚠️ No API Key");
        return;
    }
    
    if (!query || query.length === 0) {
        print("⚠️ [TAVILY] Empty query - skipping search");
        return;
    }
    
    print("✅ [TAVILY] All checks passed - starting search process");
    isSearching = true;
    setStatus("🔍 Searching...");
    
    print("========================================");
    print("🔍 TAVILY WEB SEARCH STARTED");
    print("========================================");
    print("📝 Original Query: " + query);
    print("Max Results: " + script.maxResults);
    print("API Key: " + script.tavilyApiKey.substring(0, 10) + "...");
    print("========================================");
    
    // 🧠 Process the query for better search results
    let finalQuery = query;
    
    // Optional: rewrite into a full natural-language search question
    if (script.autoRewriteQuery) {
        // Check if it's already a good question (ends with ?)
        if (query.trim().endsWith("?")) {
            // It's already a question, just use it
            finalQuery = query.trim();
            print("✓ Query is already a question, using as-is");
        } else {
            // Convert to a factual search question
            finalQuery = "What is " + query.trim() + "?";
            print("🔄 Query rewritten to: " + finalQuery);
        }
    }
    
    // Add system prompt if configured (optional, usually not needed)
    if (script.systemPrompt && script.systemPrompt.length > 0) {
        finalQuery = script.systemPrompt.trim() + " " + finalQuery;
        print("🧭 Added system prompt: " + script.systemPrompt);
    }
    
    print("🧠 Final Query Sent to Tavily: " + finalQuery);
    print("========================================");
    
    const payload = {
        api_key: script.tavilyApiKey.trim(),
        query: finalQuery,
        search_depth: "advanced", // ✅ improved factual retrieval
        max_results: script.maxResults || 3,
        include_answer: true,
        include_raw_content: false
    };
    
    print("Request Payload:");
    print(JSON.stringify({
        query: payload.query,
        search_depth: payload.search_depth,
        max_results: payload.max_results,
        include_answer: payload.include_answer
    }, null, 2));
    print("========================================");
    
    try {
        print("📤 Sending request to Tavily API...");
        print("🌐 Endpoint: https://api.tavily.com/search");
        
        const resp = await Internet.fetch(new Request("https://api.tavily.com/search", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(payload)
        }));
        
        print("========================================");
        print("📥 TAVILY RESPONSE RECEIVED");
        print("========================================");
        print("Status: " + resp.status);
        
        if (resp.status !== 200) {
            const errorText = await resp.text();
            print("========================================");
            print("❌ TAVILY ERROR");
            print("========================================");
            print("Status Code: " + resp.status);
            print("Error Response: " + errorText);
            print("========================================");
            setStatus("⚠️ Search Error");
            displayError("Search failed (status " + resp.status + ")");
            isSearching = false;
            return;
        }
        
        const data = await resp.json();
        print("✅ Tavily data received successfully");
        print("========================================");
        
        processSearchResults(data);
        setStatus("✅ Results Ready");
        
    } catch (e) {
        print("========================================");
        print("❌ [TAVILY] TAVILY EXCEPTION");
        print("========================================");
        print("Error: " + e);
        print("Error type: " + (typeof e));
        print("Error message: " + (e?.message || "No message"));
        print("========================================");
        setStatus("⚠️ Error");
        displayError("Network error");
    } finally {
        isSearching = false;
        print("🏁 [TAVILY] Search completed, isSearching reset to false");
        print("   Query was: " + query);
        print("   Ready for next search\n");
    }
}

function processSearchResults(data) {
    print("========================================");
    print("📊 PROCESSING TAVILY RESULTS");
    print("========================================");
    
    // Log full response for debugging
    print("Full Tavily Response:");
    print(JSON.stringify(data, null, 2));
    print("========================================");
    
    try {
        // Store results for API access
        lastSearchResults = {
            answer: data.answer || "",
            results: data.results || [],
            query: data.query || "",
            timestamp: getTime()
        };
        
        let displayText = "";
        
        // Ultra-compact format for AR glasses
        
        // Show ultra-condensed AI summary (max 60 characters / ~10 words)
        if (data.answer && data.answer.length > 0) {
            print("========================================");
            print("💡 TAVILY AI SUMMARY (based on sources):");
            print(data.answer);
            print("========================================");
            
            // Extract first sentence or first 60 chars
            let summary = data.answer;
            
            // Try to get first sentence (up to first period, question mark, or exclamation)
            const firstSentence = summary.match(/^[^.!?]+[.!?]/);
            if (firstSentence) {
                summary = firstSentence[0].trim();
            }
            
            // Limit to 60 characters (~10 words)
            if (summary.length > 60) {
                summary = summary.substring(0, 60).trim();
                // Try to end at a word boundary
                const lastSpace = summary.lastIndexOf(' ');
                if (lastSpace > 40) {
                    summary = summary.substring(0, lastSpace);
                }
                summary += "...";
            }
            
            displayText += "💡 " + summary + "\n\n";
        }
        
        // Show ONLY top 3 sources - title only, no snippets
        if (data.results && Array.isArray(data.results) && data.results.length > 0) {
            print("========================================");
            print("📄 FOUND " + data.results.length + " SEARCH RESULTS");
            print("========================================");
            
            displayText += "📚 Sources:\n";
            
            // Limit to max 3 results for AR display
            const maxDisplay = Math.min(3, script.maxResults, data.results.length);
            
            for (let i = 0; i < maxDisplay; i++) {
                const result = data.results[i];
                
                if (result.title && result.url) {
                    print("─────────────────────────────────────");
                    print("Result #" + (i + 1) + ":");
                    print("Title: " + result.title);
                    print("URL: " + result.url);
                    print("Score: " + (result.score || "N/A"));
                    
                    if (result.content) {
                        print("Content: " + result.content.substring(0, 200) + "...");
                    }
                    print("─────────────────────────────────────");
                    
                    // Truncate title to ~30 chars (5-6 words)
                    let title = result.title;
                    if (title.length > 30) {
                        title = title.substring(0, 30).trim();
                        const lastSpace = title.lastIndexOf(' ');
                        if (lastSpace > 20) {
                            title = title.substring(0, lastSpace);
                        }
                        title += "...";
                    }
                    
                    // Super compact: just number and title
                    displayText += (i + 1) + ". " + title + "\n";
                }
            }
            
            print("========================================");
            print("✅ PROCESSED " + maxDisplay + " RESULTS (showing top 3)");
            print("========================================");
            
            displayText += "\n🌐 Real-time search";
            
        } else {
            print("⚠️ No results found in Tavily response");
            print("Response keys: " + Object.keys(data).join(", "));
            displayText += "❌ No results\nTry different words";
        }
        
        // Display on screen
        if (script.webResultsText) {
            const finalText = displayText.trim();
            script.webResultsText.text = finalText;
            
            print("✓ Displayed results on screen");
            print("📏 Text length: " + finalText.length + " characters");
            
            if (finalText.length > 500) {
                print("⚠️ WARNING: Text is " + finalText.length + " chars - may be too long to display!");
                print("⚠️ Try reducing Max Results in Inspector to 3 or less");
            }
        } else {
            print("⚠️ webResultsText not connected - results only in console");
        }
        
        print("========================================");
        print("✅ [TAVILY] Results processing complete!");
        print("========================================\n");
        
    } catch (e) {
        print("❌ [TAVILY] ERROR processing results: " + e);
        print("Error stack: " + (e.stack || "No stack"));
        displayError("Failed to process results");
    }
}

function extractDomain(url) {
    try {
        // Extract domain from URL (e.g., "https://www.example.com/path" -> "example.com")
        let domain = url.replace(/^https?:\/\//, ''); // Remove protocol
        domain = domain.replace(/^www\./, ''); // Remove www
        domain = domain.split('/')[0]; // Get domain only
        return domain;
    } catch (e) {
        return url; // Return original URL if extraction fails
    }
}

function displayError(message) {
    if (script.webResultsText) {
        script.webResultsText.text = "⚠️ " + message;
    }
}

function setStatus(s) {
    if (script.statusText) {
        script.statusText.text = s;
    }
}

function debugLog(msg) {
    if (script.enableDebug) {
        print(msg);
    }
}

// Export API for other scripts
script.api.search = searchTavily;
script.api.isSearching = function() { return isSearching; };
script.api.getLastResults = function() { return lastSearchResults; };

print("========================================");
print("✅ TAVILY WEB SEARCH - READY!");
print("========================================");

