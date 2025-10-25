"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.TextToSpeechOpenAI = void 0;
var __selfType = requireType("./TextToSpeechOpenAI");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let TextToSpeechOpenAI = class TextToSpeechOpenAI extends BaseScriptComponent {
    onAwake() {
        if (!this.remoteServiceModule || !this.audioComponent || !this.apiKey) {
            print("Remote Service Module, Audio Component, or API key is missing.");
            return;
        }
        if (!this.audioOutputAsset) {
            print("Audio Output asset is not assigned. Please assign an Audio Output asset in the Inspector.");
            return;
        }
        this.generateAndPlaySpeech("TextToSpeechOpenAI Ready!");
    }
    async generateAndPlaySpeech(inputText) {
        if (!inputText) {
            print("No text provided for speech synthesis.");
            return;
        }
        try {
            const requestPayload = {
                model: "tts-1",
                voice: this.voice,
                input: inputText,
                response_format: "pcm",
            };
            const request = new Request("https://api.openai.com/v1/audio/speech", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${this.apiKey}`,
                },
                body: JSON.stringify(requestPayload),
            });
            print("Sending request to OpenAI...");
            let response = await this.remoteServiceModule.fetch(request);
            print("Response status: " + response.status);
            if (response.status === 200) {
                try {
                    const audioData = await response.bytes();
                    print("Received audio data, length: " + audioData.length);
                    if (!this.audioOutputAsset) {
                        throw new Error("Audio Output asset is not assigned");
                    }
                    const track = this.getAudioTrackFromData(audioData);
                    this.audioComponent.audioTrack = track;
                    this.audioComponent.play(1);
                    print("Playing speech: " + inputText);
                }
                catch (processError) {
                    print("Error processing audio data: " + processError);
                }
            }
            else {
                const errorText = await response.text();
                print("API Error: " + response.status + " - " + errorText);
            }
        }
        catch (error) {
            print("Error generating speech: " + error);
        }
    }
    __initialize() {
        super.__initialize();
        this.apiKey = "Insert your Open AI Key";
        this.remoteServiceModule = require("LensStudio:RemoteServiceModule");
        this.getAudioTrackFromData = (audioData) => {
            let outputAudioTrack = this.audioOutputAsset; // Use the assigned asset
            if (!outputAudioTrack) {
                throw new Error("Failed to get Audio Output asset");
            }
            const sampleRate = 24000;
            const BUFFER_SIZE = audioData.length / 2;
            print("Processing buffer size: " + BUFFER_SIZE);
            var audioOutput = outputAudioTrack.control;
            if (!audioOutput) {
                throw new Error("Failed to get audio output control");
            }
            audioOutput.sampleRate = sampleRate;
            var data = new Float32Array(BUFFER_SIZE);
            // Convert PCM16 to Float32
            for (let i = 0, j = 0; i < audioData.length; i += 2, j++) {
                const sample = ((audioData[i] | (audioData[i + 1] << 8)) << 16) >> 16;
                data[j] = sample / 32768;
            }
            const shape = new vec3(BUFFER_SIZE, 1, 1);
            shape.x = audioOutput.getPreferredFrameSize();
            // Enqueue audio frames in chunks
            let i = 0;
            while (i < BUFFER_SIZE) {
                try {
                    const chunkSize = Math.min(shape.x, BUFFER_SIZE - i);
                    shape.x = chunkSize;
                    audioOutput.enqueueAudioFrame(data.subarray(i, i + chunkSize), shape);
                    i += chunkSize;
                }
                catch (e) {
                    throw new Error("Failed to enqueue audio frame - " + e);
                }
            }
            return outputAudioTrack;
        };
    }
};
exports.TextToSpeechOpenAI = TextToSpeechOpenAI;
exports.TextToSpeechOpenAI = TextToSpeechOpenAI = __decorate([
    component
], TextToSpeechOpenAI);
//# sourceMappingURL=TextToSpeechOpenAI.js.map