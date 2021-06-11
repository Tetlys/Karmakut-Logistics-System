params ["_building"];
_BUDGETPOS = _building getVariable "Budget";
if ( _BUDGETPOS < 1) then {
    sleep 30;
     _building addAction [ "Convert COP" , {
        params ["_target", "_caller", "_actionId", "_arguments"];

        private _vehiclePos = getPos _target;

        deleteVehicle _target;

        private _newCOPTransit = COPTransit createVehicle (_vehiclePos);

        COPs = COPs - [str _vehiclePos];

        }
    ];
};