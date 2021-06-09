
#include "Buildconfig.sqf"

_AddItems = player addItem "ACE_Fortify"; //Adds ability to fortify

_AddMenuFOB = nil;
_AddMenuCOP = nil;

// * Example:
// * [typeOf cursorTarget, 0, ["ACE_TapShoulderRight"],VulcanPinchAction] call ace_interact_menu_fnc_addActionToClass;



_RemoveMenuFOB = nil;
_RemoveMenuCOP = nil;



_BuildPoint = getPos player nearestObject [FOB,COP]; // Gets location of nearest build point to the player

_RemoveItems = player removeItem "ACE_Fortify"; // Removes ability to fortify 


 if (nearestObject [getPos player, [FOB,COP]]) == FOB then {

	_FortifyAllowed = createTrigger ["EmptyDetector", _BuildPoint];
	_FortifyAllowed setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_FortifyAllowed setTriggerArea [250, 250, getDir this, true];
	_FortifyAllowed setTriggerStatements ["this", {hint 'Building Enabled'; _AddItems; _AddMenuFOB; }, {hint 'Building Disabled'; _RemoveItems; _RemoveMenuFOB;}];
  };

 if [player nearestObject FOB,COP] == COP then {

	_FortifyAllowed = createTrigger ["EmptyDetector", _BuildPoint];
	_FortifyAllowed setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_FortifyAllowed setTriggerArea [100, 100, getDir this, true];
	_FortifyAllowed setTriggerStatements ["this", {hint 'Building Enabled'; _AddItems; _AddMenuCOP; }, {hint 'Building Disabled'; _RemoveItems; _RemoveMenuCOP; }];
  };

