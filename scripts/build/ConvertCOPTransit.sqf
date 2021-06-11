params ["_vehicle"];
sleep 30;

_vehicle addAction [ "Convert COP" , {
    params ["_target", "_caller", "_actionId", "_arguments"];
    private _vehiclePos = getPos _target;

    deleteVehicle _target;

    private _newCOP = COP createVehicle (_vehiclePos);

    _newCOP setVariable ["Budget", 0];
    
    COPs pushback (str _vehiclePos);
    
    _newCOP execVM "scripts\build\ConvertCOP.sqf";
    _newCOP execVM "scripts\build\ActivateBuild.sqf";

    }
];