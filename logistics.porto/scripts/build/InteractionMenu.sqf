//TODO: Limit use of FOB + Vehicle menus to within FOB's


// Who can use build menu
_condition = {
    params ["_target", "_player", "_params"];
    getPlayerUID _player in BUILD_PERMS && "ACE_Fortify" in ((vestItems _player) + (uniformItems _player) + (backpackItems _player))
};


{
//Master Menu
_buildMenu = {};
    _Menu1 = ["BuildMenu", "Build Menu", BUDGET, _buildMenu, _condition] call ace_interact_menu_fnc_createAction;
    [_x, 1, ["ACE_SelfActions"], _Menu1] call ace_interact_menu_fnc_addActionToObject;
        //COP Menu
            _COPMenu = {};
                _Menu2 = ["COPMenu","COP Menu",BUDGET,_COPMenu,_condition] call ace_interact_menu_fnc_createAction;
                [_x, 1, ["ACE_SelfActions", "BuildMenu"], _Menu2] call ace_interact_menu_fnc_addActionToObject;
            //Sandbag Small
                _COPsandbagwall = {
                    [player, Sandbags] remoteExec ["OnPresetChangeRequest", 2];
                };
                    _Menu12 = ["COPSandBagWall", "Sandbag Walls", BUDGET, _COPsandbagwall, _condition] call ace_interact_menu_fnc_createAction;
                    [_x, 1, ["ACE_SelfActions", "BuildMenu", "COPMenu"], _Menu12] call ace_interact_menu_fnc_addActionToObject;
             //Sandbag Tall
                _COPsandbagwalltall = {
                [player, SandbagWallsTall] remoteExec ["OnPresetChangeRequest", 2];
                };
                    _Menu13 = ["COPSandbagwallstall", "Sandbag Walls (Tall)", BUDGET, _COPsandbagwalltall, _condition] call ace_interact_menu_fnc_createAction;
                    [_x, 1, ["ACE_SelfActions", "BuildMenu", "COPMenu"], _Menu13] call ace_interact_menu_fnc_addActionToObject;
            //Static Weapons
                _COPstaticweapons = {
                [player, StaticWeapons] remoteExec ["OnPresetChangeRequest", 2];
                };
                    _Menu14 = ["COPStaticWeapons", "Static Weapons", BUDGET, _COPstaticweapons, _condition] call ace_interact_menu_fnc_createAction;
                    [_x, 1, ["ACE_SelfActions", "BuildMenu", "COPMenu"], _Menu14] call ace_interact_menu_fnc_addActionToObject;
            //Buildings
                _COPsandbagbunkers = {
                [player, SandbagBunkers] remoteExec ["OnPresetChangeRequest", 2];
                };
                    _Menu15 = ["COPSandbagbunkers", "Sandbag Bunkers", BUDGET, _COPsandbagbunkers, _condition] call ace_interact_menu_fnc_createAction;
                    [_x, 1, ["ACE_SelfActions", "BuildMenu", "COPMenu"], _Menu15] call ace_interact_menu_fnc_addActionToObject;

        //FOB Menu
            _FOBMenu = {};
                _Menu3 = ["FOBMenu","FOB Menu",BUDGET,_FOBMenu,_condition] call ace_interact_menu_fnc_createAction;
                [_x, 1, ["ACE_SelfActions", "BuildMenu"], _Menu3] call ace_interact_menu_fnc_addActionToObject;
            //FOB Buildings
                _FOBBuildings  = {};
                        _Menu5 = ["FOBBuildings","Buildings",BUDGET,_FOBBuildings,_condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu"], _Menu5] call ace_interact_menu_fnc_addActionToObject;
                //Walls
                    _FOBBuildingsWalls = {
                    [player, HbarrierWall] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu16 = ["FOBBuildingsWalls", "Walls", BUDGET, _FOBBuildingsWalls, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBBuildings"], _Menu16] call ace_interact_menu_fnc_addActionToObject;
                //Blocks
                    _FOBBuildingsBlocks = {
                    [player, HBarrierBlocks] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu17 = ["FOBBuildingsBlocks", "Blocks", BUDGET, _FOBBuildingsBlocks, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBBuildings"], _Menu17] call ace_interact_menu_fnc_addActionToObject;
                //Buildings
                    _FOBBuildingsBuildings =  {
                    [player, MilitaryBuildings] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu18 = ["FOBbuildingsbuildings", "Structures", BUDGET, _FOBBuildingsBuildings, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBBuildings"], _Menu18] call ace_interact_menu_fnc_addActionToObject;
                //Bunkers
                    _FOBBuildingsBunkers = {
                    [player, Bunkers] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu19 = ["FOBBuildingsBunkers", "Bunkers", BUDGET, _FOBBuildingsBunkers, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBBuildings"], _Menu19] call ace_interact_menu_fnc_addActionToObject;

            //FOB Logistics
                _FOBLogistics = {};
                        _Menu6 = ["FOBLogistics","Logistics",BUDGET,_FOBLogistics,_condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu"], _Menu6] call ace_interact_menu_fnc_addActionToObject;
                //Resupply
                    _FOBLogisticsRepair = {
                    [player, RepairPoints] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu20 = ["FOBLogisticsRepair", "RRR", BUDGET, _FOBLogisticsRepair, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBLogistics"], _Menu20] call ace_interact_menu_fnc_addActionToObject;
                //Resources
                    _FOBLogisticsSwap = {
                     [player, ResourceExchange] remoteExec ["OnPresetChangeRequest", 2];
                     };
                         _Menu21 = ["FOBLogisticsSwap", "Resources", BUDGET, _FOBLogisticsSwap, _condition] call ace_interact_menu_fnc_createAction;
                         [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBLogistics"], _Menu21] call ace_interact_menu_fnc_addActionToObject;
                //NewFOB/COP
                    _FOBLogisticsFOB = {
                     [player, BuildPoint] remoteExec ["OnPresetChangeRequest", 2];
                     };
                         _Menu22 = ["FOBLogisticsFOB", "Build FOB/COP", BUDGET, _FOBLogisticsFOB, _condition] call ace_interact_menu_fnc_createAction;
                         [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBLogistics"], _Menu22] call ace_interact_menu_fnc_addActionToObject;
                //Mdical Buildings
                    _FOBLogisticsMedical = {
                    [player, MedicalBuildings] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu23 = ["FobLogisticsMedical", "Medical", BUDGET, _FOBLogisticsMedical, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBLogistics"], _Menu23] call ace_interact_menu_fnc_addActionToObject;

            //FOB Misc
                _FOBmisc = {};
                        _Menu7 = ["FOBMisc","Misc",BUDGET,_FOBmisc,_condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu"], _Menu7] call ace_interact_menu_fnc_addActionToObject;
                //Walls
                    _FOBmiscWalls = {
                     [player, WallsAndGates] remoteExec ["OnPresetChangeRequest", 2];
                     };
                         _Menu24 = ["FOBMiscWalls", "Walls", BUDGET, _FOBmiscWalls, _condition] call ace_interact_menu_fnc_createAction;
                         [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBMisc"], _Menu24] call ace_interact_menu_fnc_addActionToObject;
                //Camo Nets
                    _FOBmiscnets = {
                     [player, CamoNets] remoteExec ["OnPresetChangeRequest", 2];
                     };
                         _Menu25 = ["FOOBMiscNets", "Camo Nets", BUDGET,  _FOBmiscnets, _condition] call ace_interact_menu_fnc_createAction;
                         [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBMisc"], _Menu25] call ace_interact_menu_fnc_addActionToObject;
                //ground Lights
                    _FOBmiscLights = {
                    [player, Lights] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu26 = ["FOBMiscLights", "Lights", BUDGET, _FOBmiscLights, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBMisc"], _Menu26] call ace_interact_menu_fnc_addActionToObject;
                //Tower Lights
                    _FOBmiscLamps = {
                     [player, AirportLamps] remoteExec ["OnPresetChangeRequest", 2];
                     };
                         _Menu27 = ["FOBMiscLamps", "Tower Lights", BUDGET, _FOBmiscLamps, _condition] call ace_interact_menu_fnc_createAction;
                         [_x, 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBMisc"], _Menu27] call ace_interact_menu_fnc_addActionToObject;

        //Vehicle Menu
            _Vehiclemenu = {};
                _Menu4 = ["VehicleMenu","Vehicles",BUDGET,_Vehiclemenu,_condition] call ace_interact_menu_fnc_createAction;
                 [_x, 1, ["ACE_SelfActions", "BuildMenu"], _Menu4] call ace_interact_menu_fnc_addActionToObject;
            //Light Vehicles
                _FOBlightvehicles = {};
                        _Menu8 = ["FOBLightVehicles","Light",BUDGET,_FOBlightvehicles,_condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu"], _Menu8] call ace_interact_menu_fnc_addActionToObject;
                //Humvees
                    _FOBlightvehiclesHMV = {
                     [player, LightVehicles] remoteExec ["OnPresetChangeRequest", 2];
                     };
                         _Menu28 = ["FOBLightHMV", "Humvees", BUDGET, _FOBlightvehiclesHMV, _condition] call ace_interact_menu_fnc_createAction;
                         [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBLightVehicles"], _Menu28] call ace_interact_menu_fnc_addActionToObject;
                //MRAP's
                    _FOBlightvehiclesMRAP = {
                     [player, MRAPs] remoteExec ["OnPresetChangeRequest", 2];
                     };
                         _Menu29 = ["FOBLightMRAP", "MRAPs", BUDGET, _FOBlightvehiclesMRAP, _condition] call ace_interact_menu_fnc_createAction;
                         [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBLightVehicles"], _Menu29] call ace_interact_menu_fnc_addActionToObject;
                //Trucks
                    _FOBlightvehiclesTruck = {
                    [player, Trucks] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu30 = ["FOBLightTruck", "Trucks", BUDGET, _FOBlightvehiclesTruck, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBLightVehicles"], _Menu30] call ace_interact_menu_fnc_addActionToObject;

            //Heavt Vehicles
                _FOBheavyvehicles = {};
                        _Menu9 = ["FOBHeavyVehicles","Heavy vehicles",BUDGET,_FOBheavyvehicles,_condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu"], _Menu9] call ace_interact_menu_fnc_addActionToObject;
                //APC
                    _FOBheavyvehickesAPC = {
                    [player, APC] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu31 = ["FOBHeavyAPC", "APCs", BUDGET, _FOBheavyvehickesAPC, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBHeavyVehicles"], _Menu31] call ace_interact_menu_fnc_addActionToObject;
                //IFV
                    _FOBheavyvehickesIFV = {
                    [player, IFVs] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu32 = ["FOBHeavyIFV", "IFVs", BUDGET, _FOBheavyvehickesIFV, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBHeavyVehicles"], _Menu32] call ace_interact_menu_fnc_addActionToObject;
                //TANK
                    _FOBheavyvehickesTank = {
                    [player, Tanks] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu33 = ["FOBHeavyTank", "Tanks", BUDGET, _FOBheavyvehickesTank, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBHeavyVehicles"], _Menu33] call ace_interact_menu_fnc_addActionToObject;

            //Air Vehicles
                _FOBairvehicles = {};
                        _Menu10 = ["FOBAirVehicles","Air Vehicles",BUDGET,_FOBairvehicles,_condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu"], _Menu10] call ace_interact_menu_fnc_addActionToObject;
                //Fixed Wing
                    _FOBairvehiclesPlanes = {
                    [player, Planes] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu34 = ["FOBAirPlane", "Fixed-Wing", BUDGET, _FOBairvehiclesPlanes, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBAirVehicles"], _Menu34] call ace_interact_menu_fnc_addActionToObject;
                //Rotary
                    _FOBairvehiclesRotary = {
                    [player, TransportRotary] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu35 = ["FOBAirRotary", "Rotary Unarmed", BUDGET, _FOBairvehiclesRotary, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBAirVehicles"], _Menu35] call ace_interact_menu_fnc_addActionToObject;
                //Rotary CAS
                    _FOBairvehiclesRotaryCAS = {
                    [player, CASRotary] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu39 = ["FOBAirCAS", "Rotary-Winged CAS", BUDGET, _FOBairvehiclesRotaryCAS, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBAirVehicles"], _Menu39] call ace_interact_menu_fnc_addActionToObject;

            //Other Vehicles
                _FOBothervehicles = {};
                        _Menu11 = ["FOBOtherVehicles","Other Vehicles",BUDGET,_FOBothervehicles,_condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu"], _Menu11] call ace_interact_menu_fnc_addActionToObject;
                //Arty
                    _FOBothervehiclesARTY = {
                    [player, Arty] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu36 = ["FOBOtherArty", "Arty", BUDGET, _FOBothervehiclesARTY, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBOtherVehicles"], _Menu36] call ace_interact_menu_fnc_addActionToObject;
                //Medical
                    _FOBothervehiclesMedical = {
                    [player, MedicalVehicle] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu37 = ["FOBOtherMedical", "Medical", BUDGET, _FOBothervehiclesMedical, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBOtherVehicles"], _Menu37] call ace_interact_menu_fnc_addActionToObject;
                //Logistics
                    _FOBothervehiclesLogistics = {
                    [player, Logistics] remoteExec ["OnPresetChangeRequest", 2];
                    };
                        _Menu38 = ["FOBOtherLogistics", "Logistics", BUDGET, _FOBothervehiclesLogistics, _condition] call ace_interact_menu_fnc_createAction;
                        [_x, 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBOtherVehicles"], _Menu38] call ace_interact_menu_fnc_addActionToObject;

} forEach allPlayers;

