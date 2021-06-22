
OnBuildActivated = {
	params ["_currentBudget", "_building", "_activator"];

	diag_log format ["Received OnBuildActivated Event (%1, %2, %3)", _currentBudget, _building, _activator];

	BUDGET = _currentBudget;

	[west, BUDGET, false] call acex_fortify_fnc_updateBudget;
	[west, BUDGET, ResourceExchange] call acex_fortify_fnc_registerObjects;

	ACTIVATED = 1;
	ACTIVATED_BUILDING = _building;

	diag_log format ["Set activated to %1, activated building is %2", ACTIVATED, ACTIVATED_BUILDING];

	_currentDistance = player distance2D _building;
	_inBuildPerms = getPlayerUID player in BUILD_PERMS;
	diag_log format ["Current distance is %1, build range is %2, playerUID in build perms? %3", _currentDistance, BUILD_RANGE, _inBuildPerms];


	if ( _currentDistance < BUILD_RANGE && _inBuildPerms ) then {
		diag_log format ["Current player is within build range, should display a hint"];
		hint "Building Activated";
	};
};

