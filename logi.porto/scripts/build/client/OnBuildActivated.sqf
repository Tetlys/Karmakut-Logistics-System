
OnBuildActivated = {
	params ["_currentBudget", "_building", "_activator"];

	diag_log format ["Received OnBuildActivated Event (%1, %2, %3)", _currentBudget, _building, _activator];

	BUDGET = _currentBudget;

	[west, BUDGET, false] call acex_fortify_fnc_updateBudget;
	[west, BUDGET, ResourceExchange] call acex_fortify_fnc_registerObjects;

	ACTIVATED = 1;
	ACTIVATED_BUILDING = _building;


	if ( player distance2D _building <= BUILD_RANGE && getPlayerUID player in BUILD_PERMS ) then {
		hint "Building Activated";
	};
};

