
#include "Buildconfig.sqf"

_FOB = ""; // FOB Building Type
_COP = ""; // COP Building Type

_AddItems = player addItem "ACE_Fortify"; //Adds ability to fortify

_AddMenuFOB = ;
_AddMenuCOP = ;

/*
 * Author: esteldunedain
 * Insert an ACE action to a class, under a certain path
 * Note: This function is NOT global.
 *
 * Arguments:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 * 4: Use Inheritance <BOOL> (default: false)
 *
 * Return Value:
 * The entry full path, which can be used to remove the entry, or add children entries <ARRAY>.
 *
 * Example:
 * [typeOf cursorTarget, 0, ["ACE_TapShoulderRight"],VulcanPinchAction] call ace_interact_menu_fnc_addActionToClass;
 *
 * Public: Yes
 */


_RemoveMenuFOB = ;
_RemoveMenuCOP = ;

/*
 * Author: esteldunedain
 * Removes an action from a class
 *
 * Arguments:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Full path of the new action <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [typeOf cursorTarget, 0,["ACE_TapShoulderRight","VulcanPinch"]] call ace_interact_menu_fnc_removeActionFromClass;
 *
 * Public: No
 */

_BuildPoint = getPos player nearestObject [_FOB,_COP]; // Gets location of nearest build point to the player

_RemoveItems = player removeItem "ACE_Fortify"; // Removes ability to fortify 


 if [player nearestObject {_FOB,_COP}] = _FOB then [

	_FortifyAllowed = createTrigger ["EmptyDetector", _BuildPoint];
	_FortifyAllowed setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_FortifyAllowed setTriggerArea [250, 250, getDir this, true];
	_FortifyAllowed setTriggerStatements ["this", {hint 'Building Enabled', _AddItems, _AddMenuFOB }, {hint 'Building Disabled', _RemoveItems, _RemoveMenuFOB }];
	execVM "BuildTriggers.sqf";
   ];

 if [player nearestObject {_FOB,_COP}] = _COP then [

	_FortifyAllowed = createTrigger ["EmptyDetector", _BuildPoint];
	_FortifyAllowed setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_FortifyAllowed setTriggerArea [100, 100, getDir this, true];
	_FortifyAllowed setTriggerStatements ["this", {hint 'Building Enabled', _AddItems, _AddMenuCOP }, {hint 'Building Disabled', _RemoveItems, __RemoveMenuCOP }];
	execVM "BuildTriggers.sqf";
    ];

