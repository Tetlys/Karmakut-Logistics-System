params ["_vehicle"];
sleep 30;

_vehicle addAction [ "Convert FOB" , {
    params ["_target", "_caller", "_actionId", "_arguments"];
    private _vehiclePos = getPos _target;

    deleteVehicle _target;

    private _newFOB = FOB createVehicle (_vehiclePos);

    _newFOB setVariable ["Budget", 0];

    FOBs pushback (str _vehiclePos);

    _newFOB execVM "scripts\build\ConvertFOB.sqf";
    _newFOB execVM "scripts\build\ActivateBuild.sqf";

    }
];


//Use FOBs instead of variables for calling budget, then save FOBs array at end and call at start