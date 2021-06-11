params ["_building"];

    if (true) then {
        _building addAction [
            "<t color='#FF0000'>Activate Building</t>", {
                if ( ACTIVATED == 0 ) then {  // If less than 1 active, Run script, add one to profile name space
                    params ["_target", "_caller", "_actionId", "_arguments"];
                    ACTIVATED = ACTIVATED + 1;
                    hint "Building Activated";
                    private _var = _target getVariable "budget";
                    if (isNil "_var") then
                        {
                    	    _target setVariable ["budget", 500];
                    	    _var = 500;
                        };
                    diag_log format ["Loaded FOB Budget %1", _var];
                    BUDGET = _var;
                    [west, BUDGET, false] call acex_fortify_fnc_updateBudget;
                    [west, BUDGET, ResourceExchange] call acex_fortify_fnc_registerObjects;
                    {_x enableSimulationGlobal false; _x allowDamage false;} foreach nearestObjects [_target, ["Air", "LandVehicle"], BUILD_RANGE] ;
                    _trg = createTrigger ["EmptyDetector", getPos _target, true];
                    _trg setTriggerArea [BUILD_RANGE, BUILD_RANGE, 0, false];
                    _trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
                    _trg setTriggerStatements [ "this" , "Player addItem 'ACE_FORTIFY'", "Player removeItem 'ACE_FORTIFY'"];

                    sleep 1;
                    _target removeAction _actionId;
                    if (ACTIVATED == 1) then {
                        _target  addAction [
                            "<t color='#FF0000'>De-Activate Building</t>", {
                                if !( ACTIVATED < 1 ) then {
                                    params ["_target", "_caller", "_actionId", "_arguments"];

                                    hint "Building De-Activated!";

                                    //REMOVE TRIGGER
                                    _trg = _this select 3 select 0;
                                    deleteVehicle _trg;

                                    BUDGET = [west] call acex_fortify_fnc_getBudget;

                                    _target setVariable ["budget", BUDGET, true];

                                    BUDGET = 0;

                                    {_x enableSimulationGlobal true; _x allowDamage true;} foreach nearestObjects [_target, ["Air", "LandVehicle"], BUILD_RANGE];

                                    ACTIVATED = ACTIVATED - 1; // removes one from activated
                                    _target removeAction _actionId;
                                    _target execVM "scripts\build\ActivateBuild.sqf";

                                    {player RemoveItem "ACE_FORTIFY"} foreach allplayers;
                                };
                            } , [_trg]
                        ];
                    };
                } else {
                hint "Building active somwhere else!"
                };
            }
        ];
    sleep 10;
    };




