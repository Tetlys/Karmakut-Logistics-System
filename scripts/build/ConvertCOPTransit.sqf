params ["_vehicle"];
sleep 5;

_vehicle addAction [ "Convert COP" , {
    params ["_target", "_caller", "_actionId", "_arguments"];
    private _vehiclePos = getPos _target;

    deleteVehicle _target;

    private _newCOP = COP createVehicle (_vehiclePos);

    _newCOP setVariable ["Budget", 500, true];
    
    _newCOP execVM "scripts\build\ConvertCOP.sqf";
    _newCOP execVM "scripts\build\ActivateBuild.sqf";

    }
];