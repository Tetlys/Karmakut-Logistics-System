OnBuildDeactivated = {
	params ["_building", "_activator"];
	diag_log format ["Received OnBuildDeactivated Event (%1, %2, %3)", _building, _activator];

	if ( player distance2D _building >= BUILD_RANGE && getPlayerUID player in BUILD_PERMS ) then {
		hint "Building De-activated";
	};
};