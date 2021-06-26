params ["_vehicle"];

diag_log format ["ConvertCOPTransit.sqf %1", _vehicle];
sleep 5;

_vehicle addAction [ "Convert COP" , {
    params ["_target", "_caller", "_actionId", "_arguments"];
    private _vehiclePos = getPos _target;

    //TODO: Needs to attach marker to COP and create teleport point



    deleteVehicle _target;

    private _newCOP = COP createVehicle (_vehiclePos);

    _newCOP setVariable ["Budget", 500, true];
    
    [_newCOP, player] remoteExec ["OnCOPTransitConverted", 2];

    }
];