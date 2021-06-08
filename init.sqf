ExecVM "AddMarkers.sqf"

_FOB = ""; // FOB Building Type
_FOBTransit = ""; //Sets FOB in transit Vehicle Type
_COP = ""; // COP Building Type

if acex_fortify_objectPlaced [player, west, {}] then [execVM "SetBudget.sqf"];
if acex_fortify_objectDeleted [player, west, {}] then [execVM "SetBudget.sqf"];

[ALiVE_SYS_LOGISTICS,"updateObject",[acex_fortify_objectPlaced]] call ALIVE_fnc_logistics;
[ALiVE_SYS_LOGISTICS,"updateObject",[acex_fortify_objectDeleted]] call ALIVE_fnc_logistics;

[{
    params ["_unit", "_object", "_cost"];
    private _return = ![(Count _FOB) == 5];
    _return
}] call acex_fortify_fnc_addDeployHandler

[{
    params ["_unit", "_object", "_cost"];
    private _return = ![(Count _COP) == 10];
    _return
}] call acex_fortify_fnc_addDeployHandler

ExecVM "Objectinit.sqf"



