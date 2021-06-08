
_content = preprocessFile "BuildTrigger.sqf"; // File path for Start build system
_activated = profileNamespace getVariable "Activated"; // Calls for number of activated build stations (Max 1)
_CanBuild = profileNamespace getVariable "Perms_Build";  // Calls for UID list of people with build perms

while {true} do {
    if (alive Player && (getPlayerUID Player in _CanBuild))   then {  // If alive, and has build perms
	
        _this addAction
            ["<t color='#FF0000'>Activate Building</t>", {  // Add activate building option

                if (count _activated = 0 ) then {  // If less than 1 active, Run script, add one to profile name space

                    execVM _content; // Starts build trigger

                    _activated = _activated + 1; // adds one to activated

                    profileNamespace setVariable ["Activated", _activated]; // Sets new Variable

                    saveProfileNamespace; // saves profile

                        if (alive Player && (getplayerUid player) in _CanBuild)) then {

                            _this addAction
                                [ "<t color='#FF0000'>Stop Building</t>" , {

                                    deleteVehicle _FortifyAllowed;

                                    _activated = 0; // removes one from activated

                                        if {isPlayer _x} then [removeItem "ACE_Fortify"];

                                        profileNamespace setVariable ["Activated", _activated]; // Sets new Variable

                                        saveProfileNamespace; // saves profile
                                }




    } else {

_this addAction
["<t color='#FF0000'>Activate Building</t>", {  // Add activate building option

if (count _activated => 1 ) then {  // If less than 1 active, Run script, add one to profile name space

Player remoteExec hint "Already activated somewhere else!"; // Already a build in progress, deny start.





