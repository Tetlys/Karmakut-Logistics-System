params ["_vehicle"];
diag_log format ["ConvertFOBTransit.sqf %1", _vehicle];
sleep 5;

_vehicle addAction [ "Convert FOB" , {
    params ["_target", "_caller", "_actionId", "_arguments"];
    private _vehiclePos = getPos _target;

    // TODO: Needs to attach marker to FOB and create teleport point

    deleteVehicle _target;

    private _newFOB = FOB createVehicle (_vehiclePos);

    _newFOB setVariable ["Budget", 500, true];


    [_newFOB, player] remoteExec ["OnFOBTransitConverted", 2];


    }
];


