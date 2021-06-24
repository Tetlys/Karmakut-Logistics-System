OnPresetChangeRequest = {
	params ["_requester", "_objectClassNames"];

	diag_log format ["OnPresetChangeRequest (%1, %2)", _requester, _objectClassNames];

	if (!(getPlayerUID _requester in BUILD_PERMS)) exitWith {
        // Inform client they are not allowed to build
        diag_log format ["Client does not have permissions to build %1", _requester];
        "No Build Permissons" remoteExec ["hint", owner _requester];
    };	


	if (ACTIVATED <= 0) exitWith {
		diag_log format ["Client is attempting to change preset despite build not activated %1", _requester];
		"Build is not activated" remoteExec ["hint", owner _requester];
	};


	private _playerDistance = _requester distance2D ACTIVATED_BUILDING;

	if (_playerDistance > BUILD_RANGE) exitWith {
		diag_log format ["Client exceeds build range while trying to change preset %1", _requester];
		"Not within build range" remoteExec ["hint", owner _requester];
	};

	[west, BUDGET, _objectClassNames] call acex_fortify_fnc_registerObjects;

	CURRENT_BUILD_LIST = _objectClassNames;

	diag_log format ["Preset changed to contain %1, BUDGET of %2, SIDE west", _objectClassNames, BUDGET];


	["Success", _objectClassNames] remoteExec ["OnPresetChangeResponse", -2];
};