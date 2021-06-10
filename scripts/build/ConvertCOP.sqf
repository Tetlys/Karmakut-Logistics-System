params ["_building"];

// TODO: Fix this conditional
if ( true ) then {
    
     _building addAction [ "Convert COP" , {
        params ["_target", "_caller", "_actionId", "_arguments"];

        private _vehiclePos = getPos _target;

        deleteVehicle _target;

        private _newCOPTransit = COPTransit createVehicle (_vehiclePos);

        COPs = COPs - [str _vehiclePos];

        }
    ];
};