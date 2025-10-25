// @input Component.Text textInput
// @input Component.Text textOutput
// @input Component.Image image
// @input Component.Image generatedImage
// @input Component.ScriptComponent ttsComponent {"hint":"Attach the TextToSpeechOpenAI Component"}
// @input SceneObject interactableObject {"hint":"Drag the SceneObject with the Interactable component"}
// @input string openAiApiKey

const remoteServiceModule = require("LensStudio:RemoteServiceModule");
const remoteMediaModule = require("LensStudio:RemoteMediaModule");
const SIK = require("SpectaclesInteractionKit/SIK").SIK;
const interactionManager = SIK.InteractionManager;

let isProcessing = false;

script.createEvent("OnStartEvent").bind(() => {
    const interactable = interactionManager.getInteractableBySceneObject(script.interactableObject);
    if (!interactable) {
        print("❗ Interactable not found.");
        return;
    }

    interactable.onInteractorTriggerEnd(() => handleTriggerEnd());
});

async function handleTriggerEnd() {
    if (isProcessing || !script.textInput.text || !script.image || !script.openAiApiKey) {
        print("❗ Missing input values or already processing.");
        return;
    }

    isProcessing = true;

    try {
        const texture = script.image.mainPass.baseTex;
        if (!texture) {
            print("❗ No base texture found.");
            return;
        }

        const base64Image = await encodeTextureToBase64(texture);
        const roomDescription = await analyzeRoomLayout(base64Image);

        const requestPayload = {
            model: "gpt-4o",
            messages: [
                {
                    role: "system",
                    content: "You are a helpful AI interior designer. Reply with the detected decor style and give exactly two short improvement suggestions. Don't number them. Keep total reply under 30 words.",
                },
                {
                    role: "user",
                    content: [
                        { type: "text", text: script.textInput.text },
                        {
                            type: "image_url",
                            image_url: { url: `data:image/jpeg;base64,${base64Image}` },
                        },
                    ],
                },
            ],
        };

        const response = await remoteServiceModule.fetch(new Request(
            "https://api.openai.com/v1/chat/completions",
            {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${script.openAiApiKey}`,
                },
                body: JSON.stringify(requestPayload),
            }
        ));

        if (response.status === 200) {
            const data = await response.json();
            const content = data.choices[0].message.content.trim();
            script.textOutput.text = content;
            print("✅ GPT Success: " + content);

            if (script.ttsComponent && script.ttsComponent.api.generateAndPlaySpeech) {
                script.ttsComponent.api.generateAndPlaySpeech(content);
            }

            const imagePrompt = `${content}. Layout: ${roomDescription}`;
            await generateDecorImage(imagePrompt);
        } else {
            print("❗ GPT failed: " + response.status);
        }
    } catch (err) {
        print("❗ ERROR: " + err);
    } finally {
        isProcessing = false;
    }
}

function encodeTextureToBase64(texture) {
    return new Promise((resolve, reject) => {
        Base64.encodeTextureAsync(
            texture,
            resolve,
            reject,
            CompressionQuality.LowQuality,
            EncodingType.Jpg
        );
    });
}

async function analyzeRoomLayout(base64Image) {
    const payload = {
        model: "gpt-4o",
        messages: [
            {
                role: "system",
                content: "You are a visual layout interpreter. Analyze the structure and layout of the room from the image and describe it in one sentence (e.g., 'a small living room with one sofa and a window on the left'). No stylistic info.",
            },
            {
                role: "user",
                content: [
                    { type: "text", text: "Describe the layout of this room:" },
                    {
                        type: "image_url",
                        image_url: { url: `data:image/jpeg;base64,${base64Image}` },
                    },
                ],
            },
        ],
    };

    const response = await remoteServiceModule.fetch(new Request(
        "https://api.openai.com/v1/chat/completions",
        {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                Authorization: `Bearer ${script.openAiApiKey}`,
            },
            body: JSON.stringify(payload),
        }
    ));

    if (response.status === 200) {
        const data = await response.json();
        const layout = data.choices[0].message.content.trim();
        print("📐 Layout description: " + layout);
        return layout;
    } else {
        print("❗ Failed to analyze layout: " + response.status);
        return "";
    }
}

async function generateDecorImage(prompt) {
    const imagePayload = {
        prompt: prompt,
        model: "dall-e-3",
        n: 1,
        size: "1024x1024",
        response_format: "url"
    };

    const request = new Request("https://api.openai.com/v1/images/generations", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${script.openAiApiKey}`,
        },
        body: JSON.stringify(imagePayload),
    });

    const response = await remoteServiceModule.fetch(request);

    if (response.status === 200) {
        const json = await response.json();
        const imageUrl = json.data[0].url;

        const dynamicResource = remoteServiceModule.makeResourceFromUrl(imageUrl);
        remoteMediaModule.loadResourceAsImageTexture(dynamicResource, function(texture) {
            if (texture) {
                script.generatedImage.mainPass.baseTex = texture;
                print("🖼️ Decor image set!");
            } else {
                print("❗ Failed to load generated image.");
            }
        }, function(error) {
            print("❗ Error loading image texture: " + error);
        });
    } else {
        print("❗ DALL·E generation failed: " + response.status);
    }
}
