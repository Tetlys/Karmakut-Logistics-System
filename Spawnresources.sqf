#include "Resources.sqf"

waitUntil { time > 0 }; // Wait until mission fully started
private _factories = [];
private _barrelsSpawned = 0;

_factories = nearestObjects [[0,0,0], Factory_Buildings, 50000]; //get all factories

while (_barrelsSpawned < 5) do {
    {
        if (random [1,5,10] < 5) then {
            createVehicle [Small_Barrel, getpos _x, [], 0, "NONE"];
        } else {
            createVehicle [Bigger_Barrel, getpos _x, [], 0, "NONE"];
        };
    } forEach _factories;
    _barrelsSpawned = _barrelsSpawned + 1;
    sleep 3600; // wait 60 minutes until next spawn of supplies
};