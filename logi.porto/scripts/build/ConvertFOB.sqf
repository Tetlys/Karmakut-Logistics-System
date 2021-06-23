params ["_building"];

diag_log format ["ConvertFOB.sqf %1", _building];
private _var = _building getVariable "budget";
if (isNil "_var") then
{
	_building setVariable ["budget", 500];
	_var = 500;
};
if ( _var < 100) then {
    sleep 5;
    _building addAction [ "Convert FOB" , {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        private _vehiclePos = getPos _target;
        deleteVehicle _target;

        private _newFOBTransit = FOBTransit createVehicle (_vehiclePos);


        }
    ];
};
