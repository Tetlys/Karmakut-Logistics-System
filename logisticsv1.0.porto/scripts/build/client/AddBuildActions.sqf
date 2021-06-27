params ["_building"];

private _actionsSet = _building getVariable ["buildActionsSet", false];

if (!_actionsSet) then {
	_building setVariable ["buildActionsSet", true];
	diag_log format ["Adding Build Actions to %1", _building];


	//TODO JIP not working correctly, Dosent add options for late joining players.

	_building addAction [
		"<t color='#FF0000'>Activate Building</t>", {
			if ( ACTIVATED == 0 ) then {  // If less than 1 active, Run script, add one to profile name space
				params ["_target", "_caller", "_actionId", "_arguments"];

				hint "Senting";
				[player, _target] remoteExec ["OnBuildActivateRequest", 2];
				
				hint "Sent to server";

				
			} else {
			hint "Building active somewhere else!"
			};
		},
		_building,
		6,
		true,
		true,
		"",
		"((ACTIVATED == 0 ) && getPlayerUID _this in BUILD_PERMS)" // Show when activated is false, or if active but the building is not the current build
	];

	_building addAction [
		"<t color='#FF0000'>De-Activate Building</t>", {
			if ( ACTIVATED > 0 ) then {
				params ["_target", "_caller", "_actionId", "_arguments"];

				[player, _target] remoteExec ["OnBuildDeactivateRequest", 2];

			};
		},
		_building,
		6,
		true,
		true,
		"",
		"((ACTIVATED == 1) && getPlayerUID _this in BUILD_PERMS)"
	];
};



