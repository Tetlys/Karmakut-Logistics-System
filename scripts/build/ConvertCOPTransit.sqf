params ["_vehicle"];

_vehicle addAction [ "Convert COP" , {
    params ["_target", "_caller", "_actionId", "_arguments"];
    private _vehiclePos = getPos _target;

    deleteVehicle _target;

    private _newCOP = COP createVehicle (_vehiclePos);
    
    COPs pushback (str _vehiclePos);
    
    _newCOP execVM "scripts\build\ConvertCOP.sqf";


    }
];