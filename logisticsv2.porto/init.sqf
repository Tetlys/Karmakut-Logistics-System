[] call compileFinal preprocessFileLineNumbers "GlobalVariables.sqf";
[] call compileFinal preprocessFileLineNumbers "configFile.sqf";
[] call compileFinal preprocessFileLineNumbers "objectInits.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\build\init.sqf";



ACTIVATED = 0;
ACTIVATED_BUILDING = objNull;


diag_log "init.sqf INIT";




["acex_fortify_objectPlaced", {
  params ["_player", "_side", "_objectPlaced"];
  [ALiVE_SYS_LOGISTICS,"updateObject",[_objectPlaced]] call ALIVE_fnc_logistics;
	BUDGETTEMP = [west] call acex_fortify_fnc_getBudget;
  diag_log format ["Object %1 Placed, new budget is %2", _objectPlaced, BUDGETTEMP];
	if (BUDGETTEMP <= 0) then {BUDGET = 1;} else {BUDGET = BUDGETTEMP;}
}] call CBA_fnc_addEventHandler;

["acex_fortify_objectDeleted", {
  params ["_player", "_side", "_objectDeleted"];
  [ALiVE_SYS_LOGISTICS,"updateObject",[_objectDeleted]] call ALIVE_fnc_logistics;
	BUDGET = [west] call acex_fortify_fnc_getBudget;
  diag_log format ["Object %1 Deleted, new budget is %2", _objectDeleted, BUDGET];
}] call CBA_fnc_addEventHandler;

[{
    params ["_unit", "_object", "_cost"];
    private _return = (getPosATL _object) select 2 < 2;
    _return
}] call acex_fortify_fnc_addDeployHandler;

["acex_fortify_onDeployStart", {
  params ["_player", "_object", "_cost"];
  _object enableSimulationGlobal false;
}] call CBA_fnc_addEventHandler;

["acex_fortify_objectPlaced", {
  params ["_player", "_side", "_objectPlaced"];
  _objectPlaced enableSimulationGlobal false;
  _objectPlaced setDamage 0;
}] call CBA_fnc_addEventHandler;

_fnc_makeCarrayble = {
    params ["_object"];
    diag_log text format ["Making %1 [%2] Carryable", _object, typeOf _object];
    [_object, true, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
};
["Land_MetalBarrel_F", "init", _fnc_makeCarrayble, true, [], true] call CBA_fnc_addClassEventHandler;

_fnc_makeCarrayble1 = {
    params ["_object"];
    diag_log text format ["Making %1 [%2] Carryable", _object, typeOf _object];
    [_object, true, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
};
["CargoNet_01_barrels_F", "init", _fnc_makeCarrayble1, true, [], true] call CBA_fnc_addClassEventHandler;