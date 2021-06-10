params ["_vehicle"];

_vehicle addAction [ "Convert FOB" , {

    profileNamespace setVariable ["_vehicle getpos" ,  0 ]; // Sets new Variable

    deleteVehicle _vehicle;

    FOB createVehicle (getpos _vehicle);

    FOBs pushback (getpos _vehicle);

    }
];


//Use FOBs instead of variables for calling budget, then save FOBs array at end and call at start