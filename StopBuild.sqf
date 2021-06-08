private _CanBuild = profileNamespace getVariable "Perms_Build";  // Calls for UID list of people with build perms

private _activated = profileNamespace getVariable "Activated"; // Calls for number of activated build stations (Max 1)

if (alive Player && (getplayerUid player) in _CanBuild) then {

	_this addAction [ "<t color='#FF0000'>Stop Building</t>" , {

		deleteVehicle _FortifyAllowed 

		_activated = _activated = 0; // removes one from activated

		if {isPlayer _x} then [removeItem "ACE_Fortify"];

		profileNamespace setVariable ["Activated", _activated]; // Sets new Variable

		saveProfileNamespace; // saves profile

		};
	
	];
};
	
