params ["_caller", "_target"];

if ("ACE_Fortify" in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {
DeleteVehicle _caller;
MAGIC = [west] call acex_fortify_fnc_getBudget;
MAGIC = MAGIC + 500;
[west, MAGIC, false] call acex_fortify_fnc_updateBudget;
} else {hint "No Permission"} ;

