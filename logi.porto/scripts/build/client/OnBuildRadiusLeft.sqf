OnBuildRadiusLeft = {
	params ["_building"];

	_inBuildPerms = getPlayerUID player in BUILD_PERMS;

	if ( !_inBuildPerms ) exitWith {
		diag_log format ["Not in build perms, leaving build radius does not matter."];
	};

	if ( ACTIVATED != 0 ) then {
		ACTIVATED = 0;
		ACTIVATED_BUILDING = objNull;
		hint "Left the build area";
	};
};