OnBuildDeactivateRequest = {
	params ["_requester", "_building"];

	diag_log format ["OnBuildDeactivateRequest(%1, %2)", _requester, _building];

	// Check that they are in build perms
    if (!(getPlayerUID _requester in BUILD_PERMS)) exitWith {
        // Inform client they are not allowed to build
		diag_log format ["Client does not have permissions to build %1", _requester];
        "No Build Permissons" remoteExec ["hint", owner _requester];
    };

    // Check activation
    if ( ACTIVATED <= 0) exitWith {
        // Inform client where the other build area is active
		diag_log format ["Client tried to deactivate building when it was already inactive %1", _requester];
        "Build is already deactivated." remoteExec ["hint", owner _requester];
    };


	if (_building != ACTIVATED_BUILDING) exitWith {
		// Inform client wrong building..
		diag_log format ["Client tried to deactive building on the wrong building %1", _requester];
        "Can not de-activate building here" remoteExec ["hint", owner _requester];
	};


	ACTIVATED_BUILDING setVariable ["budget", BUDGET, true];
	BUDGET = 0;

	{ _x allowDamage true; _x enableSimulationGlobal true; } forEach nearestObjects [ACTIVATED_BUILDING, ["ALL"], BUILD_RANGE];

	{ _x removeItem 'ACE_FORTIFY'; } forEach allPlayers; 

	ACTIVATED = 0;
    ACTIVATED_BUILDING = objNull;

	deleteVehicle BUILDING_TRIGGER;
	deleteVehicle BUILDING_LEAVE_TRIGGER;


	[_building, _requester] remoteExec ["OnBuildDeactivated", -2];


};