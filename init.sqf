[] call compileFinal preprocessFileLineNumbers "GlobalVariables.sqf";
[] call compileFinal preprocessFileLineNumbers "configFile.sqf";
[] call compileFinal preprocessFileLineNumbers "objectInits.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\build\InteractionMenu.sqf";

BUDGET = 0;

_activated = 0;


diag_log "init.sqf INIT";

["acex_fortify_objectPlaced", {
  params ["_player", "_side", "_objectPlaced"];
  [ALiVE_SYS_LOGISTICS,"updateObject",[_objectPlaced]] call ALIVE_fnc_logistics;
	BUDGET = call acex_fortify_fnc_getBudget;
}] call CBA_fnc_addEventHandler;

["acex_fortify_objectDeleted", {
  params ["_player", "_side", "_objectDeleted"];
  [ALiVE_SYS_LOGISTICS,"updateObject",[_objectDeleted]] call ALIVE_fnc_logistics;
	BUDGET = call acex_fortify_fnc_getBudget;
}] call CBA_fnc_addEventHandler;

[{
    params ["_unit", "_object", "_cost"];
    private _return = (getPosATL _object) select 2 < 1;
    _return
}] call acex_fortify_fnc_addDeployHandler;

[{
    params ["_unit", "_object", "_cost"];
    private _return = (count COPs) < MAX_COPS;
    _return
}] call acex_fortify_fnc_addDeployHandler;



diag_log format ["COP Type %1 FOB Type %2", COP, FOB];

private _centerOfWorld = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
private _objectsNear = nearestObjects[_centerOfWorld, [COP, FOB], 20000];
{

  if ( typeOf _x == FOB ) then {  
    _x execVM "scripts\build\ConvertFOB.sqf";
  } else {
    if (typeOf _x == COP ) then {
      _x execVM "scripts\build\ConvertCOP.sqf";
    }
  }
} forEach _objectsNear;