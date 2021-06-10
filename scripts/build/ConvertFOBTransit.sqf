params ["_vehicle"];


// TODO: Prevent people without perms getting this action added?

_vehicle addAction [ "Convert FOB" , {
    params ["_target", "_caller", "_actionId", "_arguments"];


    diag_log format ["ConvertFOBTransit Action Vehicle Cache Type", typeOf _target];

    private _vehiclePos = getPos _target;

    deleteVehicle _target;

    private _newFOB = FOB createVehicle (_vehiclePos);

    FOBs pushback (str _vehiclePos);

    _newFOB execVM "scripts\build\ConvertFOB.sqf";


  

    }
];


//Use FOBs instead of variables for calling budget, then save FOBs array at end and call at start