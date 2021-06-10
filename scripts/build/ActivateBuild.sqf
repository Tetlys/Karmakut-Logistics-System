params ["_buildings"];

diag_log "ActivateBuild.sqf";

_AddItems = player addItem "ACE_Fortify"; //Adds ability to fortify

_BuildPoint = getPos player nearestObject [FOB,COP]; // Gets location of nearest build point to the player

_RemoveItems = player removeItem "ACE_Fortify"; // Removes ability to fortify

_content =

    if nearestObject [Player, [FOB,COP]]) == FOB then {

           	_FortifyAllowed = createTrigger ["EmptyDetector", _BuildPoint];
           	_FortifyAllowed setTriggerActivation ["ANYPLAYER", "PRESENT", true];
           	_FortifyAllowed setTriggerArea [250, 250, getDir this, true];
           	_FortifyAllowed setTriggerStatements [
           	    if getPlayerUID _Player in BUILD_PERMS then {"this", {hint 'Building Enabled'; _AddItems;}, {hint 'Building Disabled'; _RemoveItems;};
                };
            ];
    };

    if [player nearestObject FOB,COP] == COP then {

          _FortifyAllowed = createTrigger ["EmptyDetector", _BuildPoint];
          _FortifyAllowed setTriggerActivation ["ANYPLAYER", "PRESENT", true];
          _FortifyAllowed setTriggerArea [100, 100, getDir this, true];
          _FortifyAllowed setTriggerStatements [
           	   if getPlayerUID _Player in BUILD_PERMS then {"this", {hint 'Building Enabled'; _AddItems;}, {hint 'Building Disabled'; _RemoveItems;};
               };
          ];
    };
    ;

_activated = profileNamespace getVariable "Activated"; // Calls for number of activated build stations (Max 1)

while {true} do {
      if (_activated == 0) then {
          _buildings addAction ["<t color='#FF0000'>Activate Building</t>", { // Add activate building option
              if ((_this select 1) in BUILD_PERMS) then {
                  if ( _activated == 0 ) then {  // If less than 1 active, Run script, add one to profile name space
                      execVM _content; // Starts build trigger
                      _activated = _activated + 1; // adds one to activated
                      profileNamespace setVariable ["Activated", _activated]; // Sets new Variable
                      saveProfileNamespace; // saves profile
                  } else {
                  hint "build is already active elsewhere";
                  };
              };
          }];
      } else {
          _buildings addAction [ "<t color='#FF0000'>Stop Building</t>" , {
              if ((_this select 1) in BUILD_PERMS) then {
                  deleteVehicle _FortifyAllowed;
                  _activated = 0; // removes one from activated
                  if (isPlayer (_this select 1)) then {[removeItem "ACE_Fortify"];};
                  profileNamespace setVariable ["Activated", _activated]; // Sets new Variable
                  saveProfileNamespace; // saves profile
              } else {
                  hint "build is already active elsewhere";
              };
          }
          ];
      };
};
