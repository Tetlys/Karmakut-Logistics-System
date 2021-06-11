params ["_building"];
_BUDGETPOS = _building getVariable "Budget";
if ( _BUDGETPOS < 1) then {
    sleep 30;
    _building addAction [ "Convert FOB" , {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        private _vehiclePos = getPos _target;
        deleteVehicle _target;

        private _newFOBTransit = FOBTransit createVehicle (_vehiclePos);

        FOBs = FOBs - [str _vehiclePos];

        }
    ];
};
