[] call compileFinal preprocessFileLineNumbers "GlobalVariables.sqf";
[] call compileFinal preprocessFileLineNumbers "configFile.sqf";
[] call compileFinal preprocessFileLineNumbers "objectInits.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";


_this addEventHandler ["acex_fortify_objectPlaced", {
  params ["_player", "_side", "_objectPlaced"];
  [ALiVE_SYS_LOGISTICS,"updateObject",[_objectPlaced]] call ALIVE_fnc_logistics;
	BUDGET = call acex_fortify_fnc_getBudget;
}];

_this addEventHandler ["acex_fortify_objectDeleted", {
  params ["_player", "_side", "_objectDeleted"];
  [ALiVE_SYS_LOGISTICS,"updateObject",[_objectDeleted]] call ALIVE_fnc_logistics;
	BUDGET = call acex_fortify_fnc_getBudget;
}];

[{
    params ["_unit", "_object", "_cost"];
    private _return = (getPosATL _object) select 2 < 1;
    _return
}] call acex_fortify_fnc_addDeployHandler;

[{
    params ["_unit", "_object", "_cost"];
    private _return = (Count COP) < MAX_COPS;
    _return
}] call acex_fortify_fnc_addDeployHandler;


