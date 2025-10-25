// Import required modules
const WorldQueryModule = require("LensStudio:WorldQueryModule");
const SIK = require("SpectaclesInteractionKit/SIK").SIK;
const InteractorTriggerType = require("SpectaclesInteractionKit/Core/Interactor/Interactor").InteractorTriggerType;
const EPSILON = 0.01;

@component
export class SurfacePlacementScript extends BaseScriptComponent {
    private primaryInteractor;
    private hitTestSession: HitTestSession;
    private transform: Transform;

    @input hitIndicator: SceneObject; // Simple 3D mesh for indicating hit area (before hit)
    @input objectsToSpawn: SceneObject[]; // [Painting, Rug, Vase]
    @input objectPreviews: SceneObject[]; // Preview versions of objects (after hit, before tap)
    @input filterEnabled: boolean;

    private objectToSpawnIndex: number = -1;

    onAwake() {
        // Create hit session
        this.hitTestSession = this.createHitTestSession(this.filterEnabled);

        if (!this.hitIndicator) {
            print("Error: Missing Hit Indicator object.");
            return;
        }

        this.transform = this.hitIndicator.getTransform();
        this.hitIndicator.enabled = false; // Hide initially
        
        // Hide all preview objects initially
        if (this.objectPreviews) {
            for (let i = 0; i < this.objectPreviews.length; i++) {
                if (this.objectPreviews[i]) {
                    this.objectPreviews[i].enabled = false;
                }
            }
        }

        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
    }

    createHitTestSession(filterEnabled) {
        var options = HitTestSessionOptions.create();
        options.filter = filterEnabled;
        return WorldQueryModule.createHitTestSessionWithOptions(options);
    }

    onHitTestResult(results) {
        // Hide all preview objects initially
        if (this.objectPreviews) {
            for (let i = 0; i < this.objectPreviews.length; i++) {
                if (this.objectPreviews[i]) {
                    this.objectPreviews[i].enabled = false;
                }
            }
        }
        
        if (results === null) {
            // No hit, hide indicator
            this.hitIndicator.enabled = false;
            this.objectToSpawnIndex = -1;
        } else {
            const hitPosition = results.position;
            const hitNormal = results.normal.normalize();

            // First, always show the hit indicator
            const lookDirection = (1 - Math.abs(hitNormal.dot(vec3.up())) < EPSILON)
                ? vec3.forward()
                : hitNormal.cross(vec3.up());
            
            const toRotation = quat.lookAt(lookDirection, hitNormal);
            
            // Position and show the hit indicator
            this.hitIndicator.enabled = true;
            this.hitIndicator.getTransform().setWorldPosition(hitPosition);
            this.hitIndicator.getTransform().setWorldRotation(toRotation);
            
            // Decide what object to spawn
            const UP_DOT = hitNormal.dot(vec3.up());
            const threshold = 0.75;

            if (UP_DOT > threshold) {
                // Upward surface
                if (hitPosition.y > 0.5) {
                    this.objectToSpawnIndex = 2; // Vase
                } else {
                    this.objectToSpawnIndex = 1; // Rug
                }
            } else if (Math.abs(UP_DOT) < 0.3) {
                // Wall (mostly vertical)
                this.objectToSpawnIndex = 0; // Painting
            } else {
                // Ignore ceilings or bad surfaces
                this.objectToSpawnIndex = -1;
                return;
            }

            // Check if the object index is valid
            if (this.objectToSpawnIndex < 0 || 
                this.objectToSpawnIndex >= this.objectsToSpawn.length || 
                !this.objectPreviews || 
                this.objectToSpawnIndex >= this.objectPreviews.length) {
                return;
            }
            
            // When the primary trigger is pressed, show the preview of the actual object
            if (this.primaryInteractor && 
                this.primaryInteractor.isActive() && 
                this.primaryInteractor.currentTrigger !== InteractorTriggerType.None) {
                
                // Hide the hit indicator
                this.hitIndicator.enabled = false;
                
                // Show the appropriate preview object
                if (this.objectPreviews[this.objectToSpawnIndex]) {
                    const previewObj = this.objectPreviews[this.objectToSpawnIndex];
                    previewObj.enabled = true;
                    previewObj.getTransform().setWorldPosition(hitPosition);
                    previewObj.getTransform().setWorldRotation(toRotation);
                }
            }
        }
    }

    onUpdate() {
        this.primaryInteractor = SIK.InteractionManager.getTargetingInteractors().shift();

        if (this.primaryInteractor &&
            this.primaryInteractor.isActive() &&
            this.primaryInteractor.isTargeting()
        ) {
            const rayStartOffset = new vec3(this.primaryInteractor.startPoint.x, this.primaryInteractor.startPoint.y, this.primaryInteractor.startPoint.z + 30);
            const rayStart = rayStartOffset;
            const rayEnd = this.primaryInteractor.endPoint;

            this.hitTestSession.hitTest(rayStart, rayEnd, this.onHitTestResult.bind(this));

            // Handle tap (trigger end)
            if (
                this.objectToSpawnIndex !== -1 &&
                this.primaryInteractor.previousTrigger !== InteractorTriggerType.None &&
                this.primaryInteractor.currentTrigger === InteractorTriggerType.None
            ) {
                let spawnPosition, spawnRotation;
                
                // Get the position and rotation from either the preview or the indicator
                if (this.objectPreviews && 
                    this.objectToSpawnIndex < this.objectPreviews.length && 
                    this.objectPreviews[this.objectToSpawnIndex] && 
                    this.objectPreviews[this.objectToSpawnIndex].enabled) {
                    
                    spawnPosition = this.objectPreviews[this.objectToSpawnIndex].getTransform().getWorldPosition();
                    spawnRotation = this.objectPreviews[this.objectToSpawnIndex].getTransform().getWorldRotation();
                } else {
                    spawnPosition = this.hitIndicator.getTransform().getWorldPosition();
                    spawnRotation = this.hitIndicator.getTransform().getWorldRotation();
                }
                
                // Copy the correct object
                let parent = this.objectsToSpawn[this.objectToSpawnIndex].getParent();
                let newObject = parent.copyWholeHierarchy(this.objectsToSpawn[this.objectToSpawnIndex]);
                newObject.setParentPreserveWorldTransform(null);
                newObject.getTransform().setWorldPosition(spawnPosition);
                newObject.getTransform().setWorldRotation(spawnRotation);
                
                // Make sure the spawned object is properly scaled and visible
                newObject.enabled = true;
                
                // Hide all previews after placing
                if (this.objectPreviews) {
                    for (let i = 0; i < this.objectPreviews.length; i++) {
                        if (this.objectPreviews[i]) {
                            this.objectPreviews[i].enabled = false;
                        }
                    }
                }
                // Hide indicator as well
                this.hitIndicator.enabled = false;
            }

        } else {
            // Hide everything when not actively targeting
            this.hitIndicator.enabled = false;
            if (this.objectPreviews) {
                for (let i = 0; i < this.objectPreviews.length; i++) {
                    if (this.objectPreviews[i]) {
                        this.objectPreviews[i].enabled = false;
                    }
                }
            }
            this.objectToSpawnIndex = -1;
        }
    }
}