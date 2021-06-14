params ["_caller", "_target"];

if ("ACE_Fortify" in ((vestItems player) + (uniformItems player) + (backpackItems player))) then {
DeleteVehicle _caller;
[west, 100, false] call acex_fortify_fnc_updateBudget;
} else {hint "No Build Active"} ;