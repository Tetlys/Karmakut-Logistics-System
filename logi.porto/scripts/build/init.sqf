
if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\build\server\OnBuildActivateRequest.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\server\OnBuildDeactivateRequest.sqf";
} else {
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnBuildActivated.sqf";
	[] call compileFinal preprocessFileLineNumbers "scripts\build\client\OnBuildDeactivated.sqf";
};	