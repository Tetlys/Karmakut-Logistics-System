params ["_vehicle"];

_vehicle addAction [ "Convert COP" , {

    profileNamespace setVariable ["_vehicle getpos" ,  0 ]; // Sets new Variable

    deleteVehicle _vehicle;

    COP createVehicle (getpos _vehicle);

    COPs pushback (getpos _vehicle);

    }
];