params ["_building"];
private _var = _building getVariable "budget";
if (isNil "_var") then
{
	_object setVariable ["budget", 500];
	_var = 500;
};
if ( _var < 100) then {
    sleep 5;
     _building addAction [ "Convert COP" , {
        params ["_target", "_caller", "_actionId", "_arguments"];

            private _vehiclePos = getPos _target;

            deleteVehicle _target;

            private _newCOPTransit = COPTransit createVehicle (_vehiclePos);

        }
    ];
};