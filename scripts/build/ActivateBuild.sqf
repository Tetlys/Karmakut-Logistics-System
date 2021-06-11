params ["_building"];

_AddItems = player addItem "ACE_Fortify"; //Adds ability to fortify

_BuildPoint = getPos _this; // Gets location of nearest build point to the player

_RemoveItems = player removeItem "ACE_Fortify"; // Removes ability to fortify

_activated = profileNamespace getVariable "Activated"; // Calls for number of activated build stations (Max 1)

  _building addAction ["<t color='#FF0000'>Activate Building</t>", { // Add activate building option
      if ((_this select 1) in BUILD_PERMS) then {
          if ( _activated == 0 ) then {  // If less than 1 active, Run script, add one to profile name space
                _FortifyAllowed = createTrigger ["EmptyDetector", _BuildPoint];
                _FortifyAllowed setTriggerActivation ["ANYPLAYER", "PRESENT", true];
                _FortifyAllowed setTriggerArea [250, 250, getDir this, true];
                _FortifyAllowed setTriggerStatements [
                "this", "[hint 'Building Activated'; _addItems]", "[hint 'Building Activated'; _RemoveItems]"
                ];
          };


              _this getVariable "Budget"
              _activated = _activated + 1; // adds one to activated
              profileNamespace setVariable ["Activated", _activated]; // Sets new Variable
              saveProfileNamespace; // saves profile
          } else {
            hint "build is already active elsewhere";
          };
      };
  }];

_building addAction [ "<t color='#FF0000'>Stop Building</t>" , {
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


