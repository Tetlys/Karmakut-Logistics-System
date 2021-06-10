params ["_building"];
if (profileNamespace getVariable str getpos _building)  == 0 then {

     _building addAction [ "Convert FOB" , {

        profileNamespace setVariable [str getpos _building ,  nil ]; // Sets new Variable

        deleteVehicle _building;

        FOBTransit createVehicle (getpos _building);

        FOBs = FOBs - (getpos _building);

        }
    ];
};