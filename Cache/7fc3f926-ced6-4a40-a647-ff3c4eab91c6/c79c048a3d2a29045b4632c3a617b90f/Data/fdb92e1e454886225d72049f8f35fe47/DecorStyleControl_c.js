if (script.onAwake) {
	script.onAwake();
	return;
};
function checkUndefined(property, showIfData){
   for (var i = 0; i < showIfData.length; i++){
       if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]){
           return;
       }
   }
   if (script[property] == undefined){
      throw new Error('Input ' + property + ' was not provided for the object ' + script.getSceneObject().name);
   }
}
// @input SceneObject bohoButton
checkUndefined("bohoButton", []);
// @input SceneObject scandiButton
checkUndefined("scandiButton", []);
// @input SceneObject vintageButton
checkUndefined("vintageButton", []);
// @input SceneObject bohoObject
checkUndefined("bohoObject", []);
// @input SceneObject scandiObject
checkUndefined("scandiObject", []);
// @input SceneObject vintageObject
checkUndefined("vintageObject", []);
// @input SceneObject rugToggleButton
checkUndefined("rugToggleButton", []);
// @input SceneObject rugPrefab
checkUndefined("rugPrefab", []);
// @input SceneObject bohoRug
checkUndefined("bohoRug", []);
// @input SceneObject scandiRug
checkUndefined("scandiRug", []);
// @input SceneObject vintageRug
checkUndefined("vintageRug", []);
// @input Component.Text debugText
checkUndefined("debugText", []);
var scriptPrototype = Object.getPrototypeOf(script);
if (!global.BaseScriptComponent){
   function BaseScriptComponent(){}
   global.BaseScriptComponent = BaseScriptComponent;
   global.BaseScriptComponent.prototype = scriptPrototype;
   global.BaseScriptComponent.prototype.__initialize = function(){};
   global.BaseScriptComponent.getTypeName = function(){
       throw new Error("Cannot get type name from the class, not decorated with @component");
   }
}
var Module = require("../../../Modules/Src/Assets/DecorStyleControl");
Object.setPrototypeOf(script, Module.FixedStyleControl.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}
