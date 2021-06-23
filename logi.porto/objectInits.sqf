params ["_vehicle", "_Building"];


diag_log "objectInits.sqf INIT";

{
    diag_log format ["Detected existing COP Structure %1", _x];
    _x execVM "scripts\build\ConvertCOP.sqf";
    _x execVM "scripts\build\client\AddBuildActions.sqf";
} forEach nearestObjects [getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"), [COP], 15000, true];
{
    diag_log format ["Detected existing FOB Structure %1", _x];
    _x execVM "scripts\build\ConvertFOB.sqf";
    _x execVM "scripts\build\client\AddBuildActions.sqf";
} forEach nearestOBjects [getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"), [FOB], 15000, true];

[FOB, "init", {
    diag_log "FOB Init";
    _this execVM "scripts\build\ConvertFOB.sqf";
    _this execVM "scripts\build\client\AddBuildActions.sqf"
}, true, [], true] call CBA_fnc_addClassEventHandler;


[FOBTransit, "init", {
    diag_log "FOBTransit Init";
    _this execVM "scripts\build\ConvertFOBTransit.sqf";
}, true, [], true] call CBA_fnc_addClassEventHandler;

[COP, "init", {
    diag_log "COP Init";
    _this execVM "scripts\build\ConvertCOP.sqf";
    _this execVM "scripts\build\client\AddBuildActions.sqf"
}, true, [], true] call CBA_fnc_addClassEventHandler;

[COPTransit, "init", {
    diag_log "COPTransit Init";
    _this execVM "scripts\build\ConvertCOPTransit.sqf";
}, true, [], true] call CBA_fnc_addClassEventHandler;



objectInits = [

    // Add helipads to zeus, as they can't be recycled after built
    [
        ["Helipad_base_F", "LAND_uns_Heli_pad", "Helipad", "LAND_uns_evac_pad", "LAND_uns_Heli_H"],
        {{[_x, [[_this], true]] remoteExecCall ["addCuratorEditableObjects", 2]} forEach allCurators;},
        true
    ],

    // Enables convert vehicle option

    [
        [FOBTransit],
        {
        {[_this] execVM "scripts\build\ConvertFOBTransit.sqf";}
        }
    ],

    [
        [FOB],
        {
        {[_this] execVM "scripts\build\ConvertFOB.sqf";}
        }
    ],

    [
        [COPTransit],
        {
        {[_this] execVM "scripts\build\ConvertCOPTransit.sqf";}
        }
    ],

    [
        [COP],
        {
        {[_this] execVM "scripts\build\ConvertCOP.sqf";}
        }
    ],

    //Adds Activate Build option

    [
        [FOB],
        {
        {[_this] execVM "scripts\build\client\AddBuildActions.sqf";}
        }
    ],

    [
        [COP],
        {
        {[_this] execVM "scripts\build\client\AddBuildActions.sqf";}
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
        {[_this, true, [0, 1.5, 0], 0] call ["ace_dragging_fnc_setCarryable"];}
    ],
    [
        [ace_canDrag],
        {[_this, true, [0, 1.5, 0], 0] call ["ace_dragging_fnc_setDraggable"];}
    ]
];


