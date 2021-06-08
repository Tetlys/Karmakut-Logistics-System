
/*
 * Set the cargo size of any object. Has global effect.
 * Adds the load action menu if necessary.
 * Negative size makes unloadable.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Cargo size <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, 3] call ace_cargo_fnc_setSize

  * Set the cargo space of any object. Has global effect.
 * Adds the cargo action menu if necessary.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Cargo space <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, 20] call ace_cargo_fnc_setSpace
  */


//which type of barrel to spawn
Small_Barrel = "Land_MetalBarrel_F";
Bigger_Barrel = "CargoNet_01_barrels_F";

// max number of barrels factory will spawn
Resource_Cap_Factory = 5;

// chance that factory will spawn smaller barrel
Small_Barrel_Chance = 50;

//buildings in which supplies will spawn
Factory_Buildings = ["Land_i_Shed_Ind_F"];


[playerSide west,  "Land_MetalBarrel_F"] call ace_dragging_fnc_canDrop_carry;
[playerSide west, "CargoNet_01_barrels_F"] call ace_dragging_fnc_canDrop_carry;

