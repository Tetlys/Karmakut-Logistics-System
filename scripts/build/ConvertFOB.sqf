params ["_building"];
// if (profileNamespace getVariable str getpos _building)  == 0 then {


diag_log format ["Player UID ConvertFOB %1", getPlayerUID player];

// TODO: Prevent people without perms getting this action added?
// TODO: Fix this conditional
if ( true ) then {
    _building addAction [ "Convert FOB" , {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        private _vehiclePos = getPos _target;
        deleteVehicle _target;

        private _newFOBTransit = FOBTransit createVehicle (_vehiclePos);

        _newFOBTransit execVM "scripts\build\ConvertFOBTransit.sqf";

        FOBs = FOBs - [str _vehiclePos];

        }
    ];
};
