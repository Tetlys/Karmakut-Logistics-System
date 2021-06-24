params ["_vehicle", "_Building"];


diag_log "objectInits.sqf INIT";


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
    [
        [ace_canCarry],
        {[_this, true, [0, 1.5, 0], 0] call ["ace_dragging_fnc_setCarryable"];}
    ],
    [
        [ace_canDrag],
        {[_this, true, [0, 1.5, 0], 0] call ["ace_dragging_fnc_setDraggable"];}
    ]
];


