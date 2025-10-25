"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.FixedStyleControl = void 0;
var __selfType = requireType("./DecorStyleControl");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Interactable_1 = require("SpectaclesInteractionKit/Components/Interaction/Interactable/Interactable");
const SIK_1 = require("SpectaclesInteractionKit/SIK");
var DecorStyle;
(function (DecorStyle) {
    DecorStyle["Boho"] = "Boho";
    DecorStyle["Scandi"] = "Scandi";
    DecorStyle["Vintage"] = "Vintage";
})(DecorStyle || (DecorStyle = {}));
/**
 * Controls style visibility with direct button-to-object mapping
 * CRITICAL: This script must be on an ENABLED object!
 */
let FixedStyleControl = class FixedStyleControl extends BaseScriptComponent {
    // Called after all objects are instantiated
    onAwake() {
        print("FixedStyleControl: Awake");
        // Create an event that will be triggered once SIK is fully initialized
        this.createEvent('OnStartEvent').bind(() => {
            this.onStartSetup();
        });
        // Force all objects to start disabled
        if (this.bohoObject)
            this.bohoObject.enabled = false;
        if (this.scandiObject)
            this.scandiObject.enabled = false;
        if (this.vintageObject)
            this.vintageObject.enabled = false;
        // Disable the entire rug prefab initially (if it exists)
        if (this.rugPrefab) {
            this.rugPrefab.enabled = false;
        }
        else {
            print("Note: No rug prefab assigned");
        }
        // Also ensure individual rugs are disabled - CRITICAL to prevent all rugs appearing simultaneously
        if (this.bohoRug)
            this.bohoRug.enabled = false;
        if (this.scandiRug)
            this.scandiRug.enabled = false;
        if (this.vintageRug)
            this.vintageRug.enabled = false;
        if (this.debugText) {
            this.debugText.text = "Design Your Way";
        }
    }
    // Called when the script component is started
    onStart() {
        print("FixedStyleControl: Start");
        // We'll let the OnStartEvent handle the actual setup 
        // to ensure SIK is fully initialized
    }
    // Setup that runs after SIK is properly initialized
    onStartSetup() {
        print("FixedStyleControl: Running OnStartSetup");
        this.validateComponents();
        // Don't try to initialize if critical components are missing
        if (!this.checkRequiredComponents()) {
            print("FixedStyleControl: Missing critical components, initialization skipped");
            return;
        }
        this.setupButtonListeners();
    }
    // Perform components validation with helpful error messages
    validateComponents() {
        // Check required button components
        if (!this.bohoButton)
            print("ERROR: Boho button not set");
        if (!this.scandiButton)
            print("ERROR: Scandi button not set");
        if (!this.vintageButton)
            print("ERROR: Vintage button not set");
        if (!this.rugToggleButton)
            print("ERROR: Rug toggle button not set");
        // Check required object components
        if (!this.bohoObject)
            print("ERROR: Boho object not set");
        if (!this.scandiObject)
            print("ERROR: Scandi object not set");
        if (!this.vintageObject)
            print("ERROR: Vintage object not set");
        // Check rug components - Now showing warnings instead of errors for optional components
        if (!this.rugPrefab)
            print("WARNING: Rug prefab not set - rug container functionality will be limited");
        if (!this.bohoRug)
            print("WARNING: Boho rug not set - style-specific rug will not appear");
        if (!this.scandiRug)
            print("WARNING: Scandi rug not set - style-specific rug will not appear");
        if (!this.vintageRug)
            print("WARNING: Vintage rug not set - style-specific rug will not appear");
        // Check if interactables exist on buttons
        const interactionManager = SIK_1.SIK.InteractionManager;
        if (!interactionManager) {
            print("CRITICAL ERROR: SIK Interaction Manager not found!");
            return;
        }
        if (this.bohoButton && !this.bohoButton.getComponent(Interactable_1.Interactable.getTypeName())) {
            print("ERROR: Boho button has no Interactable component!");
        }
        if (this.scandiButton && !this.scandiButton.getComponent(Interactable_1.Interactable.getTypeName())) {
            print("ERROR: Scandi button has no Interactable component!");
        }
        if (this.vintageButton && !this.vintageButton.getComponent(Interactable_1.Interactable.getTypeName())) {
            print("ERROR: Vintage button has no Interactable component!");
        }
        if (this.rugToggleButton && !this.rugToggleButton.getComponent(Interactable_1.Interactable.getTypeName())) {
            print("ERROR: Rug toggle button has no Interactable component!");
        }
    }
    // Check if we have the minimum required components to function
    checkRequiredComponents() {
        // Need at least one button and object pair to function
        const hasStyleComponents = (SIK_1.SIK.InteractionManager != null &&
            ((this.bohoButton != null && this.bohoObject != null) ||
                (this.scandiButton != null && this.scandiObject != null) ||
                (this.vintageButton != null && this.vintageObject != null)));
        // Need the rug toggle button for rug functionality
        // The rugPrefab is now optional - we'll handle its absence gracefully
        const hasRugComponents = this.rugToggleButton != null;
        return hasStyleComponents && hasRugComponents;
    }
    // Set up event listeners for buttons
    setupButtonListeners() {
        const interactionManager = SIK_1.SIK.InteractionManager;
        print("Setting up button listeners");
        // Boho button
        if (this.bohoButton) {
            const bohoInteractable = this.bohoButton.getComponent(Interactable_1.Interactable.getTypeName());
            if (bohoInteractable) {
                const onTriggerEndCallback = (event) => {
                    print("Boho style selected");
                    this.showStyle(DecorStyle.Boho);
                };
                bohoInteractable.onInteractorTriggerEnd.add(onTriggerEndCallback);
                print("Boho button listener added");
            }
        }
        // Scandi button
        if (this.scandiButton) {
            const scandiInteractable = this.scandiButton.getComponent(Interactable_1.Interactable.getTypeName());
            if (scandiInteractable) {
                const onTriggerEndCallback = (event) => {
                    print("Scandi style selected");
                    this.showStyle(DecorStyle.Scandi);
                };
                scandiInteractable.onInteractorTriggerEnd.add(onTriggerEndCallback);
                print("Scandi button listener added");
            }
        }
        // Vintage button
        if (this.vintageButton) {
            const vintageInteractable = this.vintageButton.getComponent(Interactable_1.Interactable.getTypeName());
            if (vintageInteractable) {
                const onTriggerEndCallback = (event) => {
                    print("Vintage style selected");
                    this.showStyle(DecorStyle.Vintage);
                };
                vintageInteractable.onInteractorTriggerEnd.add(onTriggerEndCallback);
                print("Vintage button listener added");
            }
        }
        // Rug toggle button
        if (this.rugToggleButton) {
            const rugToggleInteractable = this.rugToggleButton.getComponent(Interactable_1.Interactable.getTypeName());
            if (rugToggleInteractable) {
                const onTriggerEndCallback = (event) => {
                    print("Rug toggle pressed");
                    this.toggleRug();
                };
                rugToggleInteractable.onInteractorTriggerEnd.add(onTriggerEndCallback);
                print("Rug toggle button listener added");
            }
        }
        this.isInitialized = true;
        print("All button listeners set up!");
    }
    // Show the selected style and hide others
    showStyle(style) {
        print(`${style} Style`);
        this.selectedStyle = style;
        // Hide all objects first
        if (this.bohoObject)
            this.bohoObject.enabled = false;
        if (this.scandiObject)
            this.scandiObject.enabled = false;
        if (this.vintageObject)
            this.vintageObject.enabled = false;
        // Show only the selected style
        switch (style) {
            case DecorStyle.Boho:
                if (this.bohoObject) {
                    this.bohoObject.enabled = true;
                }
                break;
            case DecorStyle.Scandi:
                if (this.scandiObject) {
                    this.scandiObject.enabled = true;
                }
                break;
            case DecorStyle.Vintage:
                if (this.vintageObject) {
                    this.vintageObject.enabled = true;
                }
                break;
        }
        // Update debug text if available
        if (this.debugText) {
            this.debugText.text = `${style} Selected`;
        }
        // Update rug visibility if toggle is on
        if (this.rugsVisible) {
            // Make sure to update the active rug when style changes
            // This will disable all rugs and enable only the one that matches the selected style
            this.updateActiveRug();
        }
    }
    // Toggle rug visibility for the current style
    toggleRug() {
        this.rugsVisible = !this.rugsVisible;
        print(this.rugsVisible ? "Place On Floor" : "Remove From Floor");
        // Toggle the entire rug prefab visibility first (if it exists)
        if (this.rugPrefab) {
            this.rugPrefab.enabled = this.rugsVisible;
        }
        // Always ensure proper rug state regardless of prefab existence
        if (!this.rugsVisible) {
            // Disable all individual rugs when toggling off
            if (this.bohoRug)
                this.bohoRug.enabled = false;
            if (this.scandiRug)
                this.scandiRug.enabled = false;
            if (this.vintageRug)
                this.vintageRug.enabled = false;
        }
        else {
            // Show the appropriate rug based on style (or vintage as default)
            this.updateActiveRug();
        }
        // Update debug text to show rug status
        if (this.debugText) {
            if (this.selectedStyle) {
                this.debugText.text = this.rugsVisible ?
                    `${this.selectedStyle} Rug + Accessories` :
                    `${this.selectedStyle} Selected`;
            }
            else {
                this.debugText.text = "Select Style";
            }
        }
    }
    // Update which rug is visible based on current style
    updateActiveRug() {
        // First check if we have any rugs to work with
        const hasAnyRugs = this.bohoRug || this.scandiRug || this.vintageRug;
        if (!hasAnyRugs) {
            return;
        }
        // CRITICAL: Ensure all rugs are disabled first to prevent multiple rugs showing simultaneously
        if (this.bohoRug)
            this.bohoRug.enabled = false;
        if (this.scandiRug)
            this.scandiRug.enabled = false;
        if (this.vintageRug)
            this.vintageRug.enabled = false;
        // If a style is selected, show ONLY that style's rug
        if (this.selectedStyle) {
            switch (this.selectedStyle) {
                case DecorStyle.Boho:
                    if (this.bohoRug) {
                        this.bohoRug.enabled = true;
                    }
                    break;
                case DecorStyle.Scandi:
                    if (this.scandiRug) {
                        this.scandiRug.enabled = true;
                    }
                    break;
                case DecorStyle.Vintage:
                    if (this.vintageRug) {
                        this.vintageRug.enabled = true;
                    }
                    break;
            }
        }
        else {
            // If no style is selected, show ONLY the vintage rug as default
            if (this.vintageRug) {
                this.vintageRug.enabled = true;
            }
        }
    }
    // Called every frame - use for debugging if needed
    onUpdate() {
        // For debugging only - uncomment if needed
        /*
        if (!this.isInitialized) {
            print("WARNING: Script not properly initialized!");
        }
        */
    }
    __initialize() {
        super.__initialize();
        this.selectedStyle = null;
        this.isInitialized = false;
        this.rugsVisible = false;
    }
};
exports.FixedStyleControl = FixedStyleControl;
exports.FixedStyleControl = FixedStyleControl = __decorate([
    component
], FixedStyleControl);
//# sourceMappingURL=DecorStyleControl.js.map