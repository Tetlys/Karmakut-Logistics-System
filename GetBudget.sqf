/*
 * Author: Kingsley
 * Gets the budget for the given side.
 *
 * Arguments:
 * 0: Side <SIDE>
 *
 * Return Value:
 * Budget <NUMBER>
 *
 * Example:
 * [west] call acex_fortify_fnc_getBudget
 *
 * Public: Yes
 */
 /*
 * Author: Kingsley
 * Updates the given sides budget.
 *
 * Arguments:
 * 0: Side <SIDE>
 * 1: Change <NUMBER> (default: 0)
 * 2: Display hint <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [west, -250, false] call acex_fortify_fnc_updateBudget
 *
 * Public: Yes
 */






//Needs to:

//Identify marker for each FOB and COP from addmarkers.sqf
//use marker to get the budget variable, save individual variables namespace for each FOB/COP, Call the nearest one, save to namespace for _budget

//if budget returns nil for marker, then set to 0

Needs to update budget to variable each time a object is placed - Uses event handler to update current buildingExit

Budget = Fob Location Variable for strBudget 



_OldBudget = call acex_fortify_fnc_getBudget
_FOBLocation = getpos this
_Budget = missionNamespace setVariable [str _FOBLocation, _oldBudget;




 








































