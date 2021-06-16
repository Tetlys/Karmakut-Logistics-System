// Check for activation
OnBuildActivateRequest = {
    params ["_requester", "_building"];


    diag_log format ["OnBuildActivateRequest(%1 %2)", _requester, _building];

    // Check that they are in build perms
    if (!(getPlayerUID _requester in BUILD_PERMS)) exitWith {
        // Inform client they are not allowed to build
        diag_log format ["Client does not have permissions to build %1", _requester];
        "No Build Permissons" remoteExec ["hint", owner _requester];
    };

    // Check activation
    if ( ACTIVATED > 0) exitWith {
        // Inform client where the other build area is active
        diag_log format ["Build is active elsewhere"];
        "Build is active elsewhere" remoteExec ["hint", owner _requester];
    };

    ACTIVATED = 1;
    ACTIVATED_BUILDING = _building;
    private _var = _building getVariable "budget";
    if (isNil "_var") then
    {
        _building setVariable ["budget", 500];
        _var = 500;
    };

    diag_log format ["Loaded FOB Budget %1", _var];

    BUDGET = _var;
    [west, BUDGET, false] call acex_fortify_fnc_updateBudget;
    [west, BUDGET, ResourceExchange] call acex_fortify_fnc_registerObjects;



    BUILDING_TRIGGER = createTrigger ["EmptyDetector", getPos _building, true];
    BUILDING_TRIGGER setTriggerArea [BUILD_RANGE, BUILD_RANGE, 0, false, BUILD_RANGE];
    BUILDING_TRIGGER setTriggerActivation ["ANYPLAYER", "PRESENT", true];
    BUILDING_TRIGGER setTriggerStatements ["this", "{ _x addItem 'ACE_FORTIFY'; 'Entered the build area' remoteExec ['hint', owner _x]; } forEach thisList;", ""];

    BUILDING_LEAVE_TRIGGER = createTrigger ["EmptyDetector", getPos _building, true];
    BUILDING_LEAVE_TRIGGER setTriggerArea [BUILD_RANGE + 1, BUILD_RANGE + 1, 0, false, BUILD_RANGE];
    BUILDING_LEAVE_TRIGGER setTriggerActivation ["ANYPLAYER", "NOT PRESENT", true];
    BUILDING_LEAVE_TRIGGER setTriggerStatements ["this", "{_x removeItem 'ACE_FORTIFY'; 'Left the build area' remoteExec ['hint', owner _x];  } forEach thisList;", ""];


    diag_log format ["Triggers [%1, %2]", BUILDING_TRIGGER, BUILDING_LEAVE_TRIGGER];

    [BUDGET, _building, _requester] remoteExec ["OnBuildActivated", -2];
};