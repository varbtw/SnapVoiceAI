"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.VisionOpenAI = void 0;
var __selfType = requireType("./VisionOpenAI");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SIK_1 = require("SpectaclesInteractionKit/SIK");
let VisionOpenAI = class VisionOpenAI extends BaseScriptComponent {
    onAwake() {
        this.createEvent("OnStartEvent").bind(() => {
            this.onStart();
        });
    }
    onStart() {
        let interactionManager = SIK_1.SIK.InteractionManager;
        // Define the desired callback logic for the relevant Interactable event.
        let onTriggerEndCallback = (event) => {
            this.handleTriggerEnd(event);
        };
        this.interactable.onInteractorTriggerEnd(onTriggerEndCallback);
    }
    async handleTriggerEnd(eventData) {
        if (this.isProcessing) {
            print("A request is already in progress. Please wait.");
            return;
        }
        if (!this.textInput.text || !this.image || !this.apiKey) {
            print("Text, Image, or API key input is missing");
            return;
        }
        try {
            this.isProcessing = true;
            // Access the texture from the image component
            const texture = this.image.mainPass.baseTex;
            if (!texture) {
                print("Texture not found in the image component.");
                return;
            }
            const base64Image = await this.encodeTextureToBase64(texture);
            const requestPayload = {
                model: "gpt-4o-mini",
                messages: [
                    {
                        role: "system",
                        content: "You are a helpful AI assistant that works for Snapchat that has access to the view that the user is looking at using Augmented Reality Glasses." +
                            " The user is asking for help with the following image and text. Keep it short like under 30 words. Be a little funny and keep it positive.",
                    },
                    {
                        role: "user",
                        content: [
                            { type: "text", text: this.textInput.text },
                            {
                                type: "image_url",
                                image_url: {
                                    url: `data:image/jpeg;base64,${base64Image}`,
                                },
                            },
                        ],
                    },
                ],
            };
            const request = new Request("https://api.openai.com/v1/chat/completions", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${this.apiKey}`,
                },
                body: JSON.stringify(requestPayload),
            });
            // More about the fetch API: https://developers.snap.com/spectacles/about-spectacles-features/apis/fetch
            let response = await this.remoteServiceModule.fetch(request);
            if (response.status === 200) {
                let responseData = await response.json();
                this.textOutput.text = responseData.choices[0].message.content;
                print(responseData.choices[0].message.content);
                // Call TTS to generate and play speech from the response
                if (this.ttsComponent) {
                    this.ttsComponent.generateAndPlaySpeech(responseData.choices[0].message.content);
                }
            }
            else {
                print("Failure: response not successful");
            }
        }
        catch (error) {
            print("Error: " + error);
        }
        finally {
            this.isProcessing = false;
        }
    }
    // More about encodeTextureToBase64: https://platform.openai.com/docs/guides/vision or https://developers.snap.com/api/lens-studio/Classes/OtherClasses#Base64
    encodeTextureToBase64(texture) {
        return new Promise((resolve, reject) => {
            Base64.encodeTextureAsync(texture, resolve, reject, CompressionQuality.LowQuality, EncodingType.Jpg);
        });
    }
    __initialize() {
        super.__initialize();
        this.apiKey = "Insert your Open AI Key";
        this.remoteServiceModule = require("LensStudio:RemoteServiceModule");
        this.isProcessing = false;
    }
};
exports.VisionOpenAI = VisionOpenAI;
exports.VisionOpenAI = VisionOpenAI = __decorate([
    component
], VisionOpenAI);
//# sourceMappingURL=VisionOpenAI.js.map