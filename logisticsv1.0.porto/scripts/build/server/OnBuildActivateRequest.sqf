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
        diag_log format ["Budget is not set for %1, setting to default", ACTIVATED_BUILDING];
        _building setVariable ["budget", 500, true];
        _var = 500;
    };

    diag_log format ["Loaded FOB Budget %1", _var];

    BUDGET = _var;
    [west, BUDGET, false] call acex_fortify_fnc_updateBudget;
    [west, BUDGET, ResourceExchange] call acex_fortify_fnc_registerObjects;

    CURRENT_BUILD_LIST = ResourceExchange;



    BUILDING_TRIGGER = createTrigger ["EmptyDetector", getPos _building, true];
    BUILDING_TRIGGER setTriggerArea [BUILD_RANGE, BUILD_RANGE, 0, false, BUILD_RANGE];
    BUILDING_TRIGGER setTriggerActivation ["ANYPLAYER", "PRESENT", true];
    BUILDING_TRIGGER setTriggerStatements ["this", "diag_Log format ['Player that have entered are %1', thisList]; { _x addItem 'ACE_FORTIFY'; [BUDGET, ACTIVATED_BUILDING, CURRENT_BUILD_LIST] remoteExec ['OnBuildRadiusEntered', owner _x]; } forEach thisList;", "_triggerList = list BUILDING_LEAVE_TRIGGER; diag_log format ['Players that have left are %1', _triggerList]; { _x removeItem 'ACE_FORTIFY'; [ACTIVATED_BUILDING] remoteExec ['OnBuildRadiusLeft', owner _x]; } forEach _triggerList;"];

    // NOTE: This doesn't return list of entities as thisList.
    // Instead can just use list BUILDING_LEAVE_TRIGGER in the deactivation statement to get them.. ???
    BUILDING_LEAVE_TRIGGER = createTrigger ["EmptyDetector", getPos _building, true];
    BUILDING_LEAVE_TRIGGER setTriggerArea [BUILD_RANGE, BUILD_RANGE, 0, false, BUILD_RANGE];
    BUILDING_LEAVE_TRIGGER setTriggerActivation ["ANYPLAYER", "NOT PRESENT", true];


    diag_log format ["Triggers [%1, %2]", BUILDING_TRIGGER, BUILDING_LEAVE_TRIGGER];

    [BUDGET, _building, _requester] remoteExec ["OnBuildActivated", -2];
};