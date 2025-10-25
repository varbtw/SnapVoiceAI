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
// @input Component.AudioComponent audioComponent
checkUndefined("audioComponent", []);
// @input Asset.Asset audioOutputAsset
checkUndefined("audioOutputAsset", []);
// @input string voice = "alloy" {"widget":"combobox", "values":[{"label":"Alloy", "value":"alloy"}, {"label":"Echo", "value":"echo"}, {"label":"Fable", "value":"fable"}, {"label":"Onyx", "value":"onyx"}, {"label":"Nova", "value":"nova"}, {"label":"Shimmer", "value":"shimmer"}]}
checkUndefined("voice", []);
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
var Module = require("../../../../../Modules/Src/Assets/Scripts/TS/TextToSpeechOpenAI");
Object.setPrototypeOf(script, Module.TextToSpeechOpenAI.prototype);
script.__initialize();
if (script.onAwake) {
   script.onAwake();
}
