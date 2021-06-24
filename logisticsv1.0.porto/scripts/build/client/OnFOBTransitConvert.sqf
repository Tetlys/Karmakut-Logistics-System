OnFOBTransitConvert = {
	params ["_building"];
	_building execVM "scripts\build\ConvertFOB.sqf";
	_building execVM "scripts\build\client\AddBuildActions.sqf";
};