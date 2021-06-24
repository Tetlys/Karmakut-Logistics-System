OnBuildRadiusEntered = {
	params ["_currentBudget", "_building", "_currentBuildList"];

	_inBuildPerms = getPlayerUID player in BUILD_PERMS;

	if ( !_inBuildPerms ) exitWith {
		diag_log format ["Not in build perms, entering build radius does not matter."];
	};

	diag_log format ["OnBuildRadiusEntered (%1, %2, %3)", _currentBudget, _building, _currentBuildList];

	if ( ACTIVATED != 1) then {
		ACTIVATED = 1;
		ACTIVATED_BUILDING = _building;
		BUDGET = _currentBudget;
		[west, BUDGET, false] call acex_fortify_fnc_updateBudget;
		[west, BUDGET, _currentBuildList] call acex_fortify_fnc_registerObjects;

		hint "Entered the build area";
	};
};