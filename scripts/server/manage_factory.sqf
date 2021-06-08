waitUntil { time > 0 }; // Wait until mission fully started
private _factories = nearestObjects [[0,0,0], Factory_Buildings, 50000]; //get all factories
private _barrelsSpawned = 0;
private _resourcesPerFactory = createHashMap;

{
 _resourcesPerFactory set [getPos _x, count nearestObjects [getPos _x, Factory_Buildings, 200]];
} forEach _factories

while (true) do {
  {
      if ((_resourcesPerFactory get (getPos _x)) < resource_cap_factory) then {   // if factory has less than 5 barrels

        if (random [1,50,100] < Small_Barrel_Chance) then { // chance of spawn of type of supplies. big or small
          createVehicle [Small_Barrel, getpos _x, [], 0, "NONE"];
        } else {
          createVehicle [Bigger_Barrel, getpos _x, [], 0, "NONE"];
        };
        _resourcesPerFactory set [getPos _x, _resourcesPerFactory get (getPos _x) + 1]; // update the number of resources in the factory
      };
  } forEach _factories
  sleep 3600; // wait 60 minutes until next spawn of supplies
}
