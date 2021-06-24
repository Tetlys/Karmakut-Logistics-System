
if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\build\server\OnBuildActivateRequest.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\server\OnBuildDeactivateRequest.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\server\OnPresetChangeRequest.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\server\OnCOPConverted.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\server\OnFOBConverted.sqf";
} else {
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnBuildActivated.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnBuildDeactivated.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnPresetChangeResponse.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnBuildRadiusEntered.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnBuildRadiusLeft.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnCOPTransitConvert.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnFOBTransitConvert.sqf";
};	