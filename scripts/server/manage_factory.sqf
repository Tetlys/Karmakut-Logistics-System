waitUntil { time > 0 }; // Wait until mission fully started
private _factories = nearestObjects [[0,0,0], Factory_Buildings, 50000]; //get all factories
private _resourcesPerFactory = createHashMap;

{
 _resourcesPerFactory set [str (getPos _x), count (nearestObjects [_x, [Small_Barrel, Bigger_Barrel], 200])];
} forEach _factories;

while {true} do {
  {
    private _resourceAtX = _resourcesPerFactory get (str (getPos _x));

    if{!isNumber(_resourceAtX) then {
      _resourceAtX = 0;
    }

    if (_resourceAtX < resource_cap_factory) then {   // if factory has less than 5 barrels
      private _barrel = nil;
      if (random [1,50,100] <= Small_Barrel_Chance) then { // chance of spawn of type of supplies. big or small
        _barrel = createVehicle [Small_Barrel, getPos _x, [], 0, "NONE"];
        _barrel setMass 125;
      } else {
        _barrel = createVehicle [Bigger_Barrel, getPos _x, [], 0, "NONE"];
        _barrel setMass 500;
      };
      _resourcesPerFactory set [str getPos _x, _resourceAtX + 1]; // update the number of resources in the factory
    };
  } forEach _factories;
  sleep 3600; // wait 60 minutes until next spawn of supplies
};