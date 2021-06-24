waitUntil {time > 0};

if ( isNil "BUILD_INTERACTION_MENU_ADDED" ) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\build\InteractionMenu.sqf";
	BUILD_INTERACTION_MENU_ADDED = true;
};


player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";


// NOTE: Is outside of if case to handle some fucky case I guess
_centerOfWorld = [worldSize / 2, worldSize / 2, 0];
_closestCOPs = nearestObjects [_centerOfWorld, [COP], worldSize, true];
_closestFOBs = nearestObjects [_centerOfWorld, [FOB], worldSize, true];

diag_log format ["World Size %1, Position from %2", worldSize, _centerOfWorld];
diag_log format ["Closest COPs %1", _closestCOPs];
diag_log format ["Closest FOBs %1", _closestFOBs];

{
    diag_log format ["Detected existing COP Structure %1", _x];

	private _actionsSet = _x getVariable ["buildActionsSet", false];

	diag_log format ["Actions set is %1", _actionsSet];

	if(!_actionsSet) then {
		_x setVariable ["buildActionsSet", true];
		_x execVM "scripts\build\ConvertCOP.sqf";
		_x execVM "scripts\build\client\AddBuildActions.sqf";
	};
} forEach _closestCOPs;
{
    diag_log format ["Detected existing FOB Structure %1", _x];

	private _actionsSet = _x getVariable ["buildActionsSet", false];

	diag_log format ["Actions set is %1", _actionsSet];

	if(!_actionsSet) then {
		_x setVariable ["buildActionsSet", true];
		_x execVM "scripts\build\ConvertFOB.sqf";
		_x execVM "scripts\build\client\AddBuildActions.sqf";
	};
} forEach _closestFOBs;
