OnBuildDeactivated = {
	params ["_building", "_activator", "_budget"];
	diag_log format ["Received OnBuildDeactivated Event (%1, %2, %3)", _building, _activator, _budget];

	BUDGET = _budget;

	_currentDistance = player distance2D _building;
	_inBuildPerms = getPlayerUID player in BUILD_PERMS;
	diag_log format ["Current distance is %1, build range is %2, playerUID in build perms? %3", _currentDistance, BUILD_RANGE, _inBuildPerms];
	if ( _currentDistance <= BUILD_RANGE && _inBuildPerms ) then {
		diag_log format ["Current player is within build range, should display a hint"];
		hint "Building De-activated";
	};

	

	ACTIVATED = 0;
	ACTIVATED_BUILDING = objNull;
	diag_log format ["Set activated to %1, activated building is %2", ACTIVATED, ACTIVATED_BUILDING];
};