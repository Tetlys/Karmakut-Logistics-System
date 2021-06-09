objectInits = [

    // Add helipads to zeus, as they can't be recycled after built
    [
        ["Helipad_base_F", "LAND_uns_Heli_pad", "Helipad", "LAND_uns_evac_pad", "LAND_uns_Heli_H"],
        {{[_x, [[_this], true]] remoteExecCall ["addCuratorEditableObjects", 2]} forEach allCurators;},
        true
    ],

    [
        [FOBTransit],
        {
        		_this addAction [ "Convert FOB" , {

        		    profileNamespace setVariable [str (_this getpos) ,  0 ]; // Sets new Variable

        		    deleteVehicle _this;

        		    FOB createVehicle (_this getpos);

        		    FOBs pushback (_this getpos);

        		    }
        		];
        }
    ],

    [
        [FOB],
        {
            if (profileNamespace getVariable str (_this getpos) = 0)  then {

        		_this addAction [ "Convert FOB" , {

        		    profileNamespace setVariable [str (_this getpos) ,  nil ]; // Sets new Variable

        		    deleteVehicle _this;

        		    FOBTransit createVehicle (_this getpos);

        		    FOBs = FOBs - (_this getpos);

        		    }
        	    ];
            };
        }
    ],

    [
        [COPTransit],
        {
        		_this addAction [ "Convert COP" , {

        		    profileNamespace setVariable [str (_this getpos) ,  0 ]; // Sets new Variable

        		    deleteVehicle _this;

        		    COP createVehicle (_this getpos);

        		    COPs pushback (_this getpos);

        		    }
        		];
        }
    ],

    [
        [FOB],
        {
            if (profileNamespace getVariable str (_this getpos) = 0)  then {

        		_this addAction [ "Convert COP" , {

        		    profileNamespace setVariable [str (_this getpos) ,  nil ]; // Sets new Variable

        		    deleteVehicle _this;

        		    COPTransit createVehicle (_this getpos);

        		    COPs = COPs - (_this getpos);

        		    }
        	    ];
            };
        }
    ],




    //Adds fob object to the
    [
        [FOB,COP],
        {
        _this addAction [ "<t color='#FF0000'>Stop Building</t>" , {
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

    ],

    [
        [FOB,COP],
        {
          _this addAction ["<t color='#FF0000'>Activate Building</t>", { // Add activate building option
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
        }

    ],

    // Add ACE variables to corresponding building types
    [
        [repair_buildings],
        {_this setVariable ["ace_isRepairFacility", 1, true];}
    ],
    [
        [medical_facilities],
        {_this setVariable ["ace_medical_isMedicalFacility", true, true];}
    ],
    [
        [medical_vehicles],
        {_this setVariable ["ace_medical_isMedicalVehicle", true, true];}
    ],

    // Crate to Aresenal
    [
        [Arsenal_typename], 
        {[_this] execVM "arsenal_presets\custom.sqf";}
    ],


    // Custom Karmakut Scripts createSimpleObject

    [
        ["USAF_A10"],
        {[_this] execVM "scripts\pylons\a10pylons.sqf";}
    ],

    [
        ["RHSGREF_A29B_HIDF"],
        {[_this] execVM "scripts\pylons\a29pylons.sqf";}
    ],

    [
        ["vtx_MH60M_DAP"],
        {[_this] execVM "scripts\pylons\dappylons.sqf";}
    ],

    [
        ["UK3CB_CW_US_B_LATE_AH64"],
        {[_this] execVM "scripts\pylons\ah64pylons.sqf";}
    ],

    [
        ["UK3CB_TKA_O_L39_PYLON"],
        {[_this] execVM "scripts\pylons\l39pylons.sqf";}
    ],

    [
        ["USAF_MQ9"],
        {[_this] execVM "scripts\pylons\reaperpylons.sqf";}
    ],

    [
        ["B_Radar_System_01_F"],
        {[_this] execVM "scripts\crew\radarcrew.sqf";}
    ],

    [
        ["itc_land_cram_praetorian2"],
        {[_this] execVM "scripts\crew\praetoriancrew.sqf";}
    ],

    [
        ["VirtualReammoBox_camonet_F"],
        {[_this] execVM "scripts\ammoboxes\USAFlaunchers.sqf";}
    ],

    [
        ["Box_NATO_Ammo_F"],
        {[_this] execVM "scripts\ammoboxes\USAFammo.sqf";}
    ],
    [
        [ace_canCarry],
        {[_this, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];}
    ]
];
