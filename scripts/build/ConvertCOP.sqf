params ["_building"];
if (profileNamespace getVariable str ("getpos _building") == 0 ) then {

     _building addAction [ "Convert COP" , {

        profileNamespace setVariable ["getpos _building" ,  nil ]; // Sets new Variable

        deleteVehicle _building;

        COPTransit createVehicle (getpos _building);

        COPs = COPs - (getpos _building);

        }
    ];
};