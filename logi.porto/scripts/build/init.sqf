
if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\build\server\OnBuildActivateRequest.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\server\OnBuildDeactivateRequest.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\server\OnPresetChangeRequest.sqf";
} else {
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnBuildActivated.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnBuildDeactivated.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnPresetChangeResponse.sqf";
};	