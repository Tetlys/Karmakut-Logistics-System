OnCOPTransitConvert = {
	params ["_building"];
	_building execVM "scripts\build\ConvertCOP.sqf";
	_building execVM "scripts\build\client\AddBuildActions.sqf";
};