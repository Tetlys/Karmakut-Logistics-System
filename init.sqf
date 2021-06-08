ExecVM "AddMarkers.sqf";
[] call compileFinal preprocessFileLineNumbers "GlobalVariables.sqf";
[] call compileFinal preprocessFileLineNumbers "configFile.sqf";

if ([player, west, {}] call acex_fortify_objectPlaced) then [execVM "SetBudget.sqf"];
if ([player, west, {}] call acex_fortify_objectDeleted) then [execVM "SetBudget.sqf"];

[ALiVE_SYS_LOGISTICS,"updateObject",[acex_fortify_objectPlaced]] call ALIVE_fnc_logistics;
[ALiVE_SYS_LOGISTICS,"updateObject",[acex_fortify_objectDeleted]] call ALIVE_fnc_logistics;

[{
    params ["_unit", "_object", "_cost"];
    private _return = (Count FOB) < 5;
    _return
}] call acex_fortify_fnc_addDeployHandler;

[{
    params ["_unit", "_object", "_cost"];
    private _return = (Count COP) < 10;
    _return
}] call acex_fortify_fnc_addDeployHandler;

ExecVM "Objectinit.sqf"



