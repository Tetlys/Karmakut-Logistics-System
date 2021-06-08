
_content = preprocessFile "BuildTrigger.sqf"; // File path for Start build system
_activated = profileNamespace getVariable "Activated"; // Calls for number of activated build stations (Max 1)
_CanBuild = profileNamespace getVariable "Perms_Build";  // Calls for UID list of people with build perms

if (alive Player && (getplayerUid player in _CanBuild))   then {  // If alive, and has build perms
	
	_this addAction ["<t color='#FF0000'>Activate Building</t>", {  // Add activate building option
		
      if (count _activated <1) then {  // If less than 1 active, Run script, add one to profile name space

        execVM _content; // Starts build trigger

        _activated = _activated + 1; // adds one to activated

        profileNamespace setVariable ["Activated", _activated]; // Sets new Variable

        saveProfileNamespace; // saves profile

        profileNamespace setVariable ["", _activated]; // Sets new Variable

      } else {
      Player remoteExec hint "Already activated somewhere else!"; // Already a build in progress, deny start.
      };
	}
	];
};




