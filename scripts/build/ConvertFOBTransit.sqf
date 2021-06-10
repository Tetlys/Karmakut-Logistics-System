params ["_vehicle"];

_vehicle addAction [ "Convert FOB" , {

    missionNamespace setVariable [str getpos _vehicle, 0]; // Sets new Variable

    deleteVehicle _vehicle;

    FOB createVehicle (getpos _vehicle);

    FOBs pushback (str getpos _vehicle);

    }
];


//Use FOBs instead of variables for calling budget, then save FOBs array at end and call at start