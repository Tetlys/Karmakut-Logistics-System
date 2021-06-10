

// Who can use build menu
_condition = {
    getPlayerUID _Player in BUILD_PERMS
};

//Master Menu
_buildMenu = {};
    _Menu1 = ["BuildMenu", "Build Menu", "", _buildMenu, _condition] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _Menu1] call ace_interact_menu_fnc_addActionToClass;
        //COP Menu
            _COPMenu = {};
                _Menu2 = ["COPMenu","COP Menu","",_COPMenu,_condition] call ace_interact_menu_fnc_createAction;
                [player, 1, ["ACE_SelfActions", "BuildMenu", "COPMenu"], _Menu2] call ace_interact_menu_fnc_addActionToClass;
            //Sandbag Small
                _COPsandbagwall = {
                [west, BUDGET, Sandbags] call acex_fortify_fnc_registerObjects;
                };
                    _Menu12 = ["COPSandBagWall", "Sandbag Walls", "", _COPsandbagwall, _condition] call ace_interact_menu_fnc_createAction;
                    [player, 1, ["ACE_SelfActions", "BuildMenu", "COPMenu"], _Menu12] call ace_interact_menu_fnc_addActionToClass;
            //Sandbag Tall
                _COPsandbagwalltall = {
                [west, BUDGET, [SandbagWallsTall]] call acex_fortify_fnc_registerObjects;
                };
                    _Menu13 = ["COPSandbagwallstall", "Sandbag Walls (Tall)", "", _COPsandbagwalltall, _condition] call ace_interact_menu_fnc_createAction;
                    [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "COPMenu"], _Menu13] call ace_interact_menu_fnc_addActionToClass;
            //Static Weapons
                _COPstaticweapons = {
                [west, BUDGET, [StaticWeapons]] call acex_fortify_fnc_registerObjects;
                };
                    _Menu14 = ["COPStaticWeapons", "Static Weapons", "", _COPstaticweapons, _condition] call ace_interact_menu_fnc_createAction;
                    [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "COPMenu"], _Menu14] call ace_interact_menu_fnc_addActionToClass;
            //Buildings
                _COPsandbagbunkers = {
                [west, BUDGET, [SandbagBunkers]] call acex_fortify_fnc_registerObjects;
                };
                    _Menu15 = ["COPSandbagbunkers", "Sandbag Bunkers", "", _COPsandbagbunkers, _condition] call ace_interact_menu_fnc_createAction;
                    [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "COPMenu"], _Menu15] call ace_interact_menu_fnc_addActionToClass;

        //FOB Menu
            _FOBMenu = {};
                _Menu3 = ["FOBMenu","FOB Menu","",_FOBMenu,_condition] call ace_interact_menu_fnc_createAction;
                [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu"], _action] call ace_interact_menu_fnc_addActionToClass;
            //FOB Buildings
                _FOBBuildings  = {};
                        _Menu5 = ["FOBBuildings","Buildings","",FOBBuildings,_condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Walls
                    _FOBBuildingsWalls = {
                    [west, BUDGET, [HbarrierWall]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu16 = ["FOBBUildingsWalls", "Walls", "", _FOBBuildingsWalls, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBBuildings"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Blocks
                    _FOBBuildingsBlocks = {
                    [west, BUDGET, [HBarrierBlocks]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu17 = ["FOBBuildingsBlocks", "Blocks", "", _FOBBuildingsBlocks, _condition] call ace_interact_menu_fnc_createAction;
                        [[(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBBuildings"]], _action] call ace_interact_menu_fnc_addActionToClass;
                //Buildings
                    _FOBBuildingsBuildings =  {
                    [west, BUDGET, [MilitaryBuildings]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu18 = ["FOBbuildingsbuildings", "Buildings", "", _FOBBuildingsBuildings, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBBuildings"]], _action] call ace_interact_menu_fnc_addActionToClass;
                //Bunkers
                    _FOBBuildingsBunkers = {
                    [west, BUDGET, [Bunkers]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu19 = ["FOBBuildingsBunkers", "Bunkers", "", _FOBBuildingsBunkers, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBBuildings"]], _action] call ace_interact_menu_fnc_addActionToClass;

            //FOB Logistics
                _FOBLogistics = {};
                        _Menu6 = ["FOBLogistis","Logistics","",_FOBLogistics,_condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Resupply
                    _FOBLogisticsRepair = {
                    [west, BUDGET, [RepairPoints]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu20 = ["FOBLogisticsRepair", "RRR", "", _FOBLogisticsRepair, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBLogistics"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Resources
                    _FOBLogisticsSwap = {
                     [west, BUDGET, [ResourceExchange]] call acex_fortify_fnc_registerObjects;
                     };
                         _Menu21 = ["FOBLogisticsSwap", "Resources", "", _FOBLogisticsSwap, _condition] call ace_interact_menu_fnc_createAction;
                         [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBLogistics"], _action] call ace_interact_menu_fnc_addActionToClass;
                //NewFOB/COP
                    _FOBLogisticsFOB = {
                     [west, BUDGET, [BuildPoint]] call acex_fortify_fnc_registerObjects;
                     };
                         _Menu22 = ["FOBLogisticsFOB", "Build FOB/COP", "", _FOBLogisticsFOB, _condition] call ace_interact_menu_fnc_createAction;
                         [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBLogistics"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Mdical Buildings
                    _FOBLogisticsMedical = {
                    [west, BUDGET, [MedicalBuildings]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu23 = ["FobLogisticsMedical", "Medical", "", _FOBLogisticsMedical, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBLogistics"], _action] call ace_interact_menu_fnc_addActionToClass;

            //FOB Misc
                _FOBmisc = {};
                        _Menu7 = ["FOBmisc","Misc","",_FOBmisc,_condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Walls
                    _FOBmiscWalls = {
                     [west, BUDGET, [WallsAndGates]] call acex_fortify_fnc_registerObjects;
                     };
                         _Menu24 = ["FOBMiscWalls", "Walls", "", _FOBmiscWalls, _condition] call ace_interact_menu_fnc_createAction;
                         [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBMisc"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Camo Nets
                    _FOBmiscnets = {
                     [west, BUDGET, [CamoNets]] call acex_fortify_fnc_registerObjects;
                     };
                         _Menu25 = ["FOOBMiscNets", "Camo Nets", "",  _FOBmiscnets, _condition] call ace_interact_menu_fnc_createAction;
                         [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBMisc"], _action] call ace_interact_menu_fnc_addActionToClass;
                //ground Lights
                    _FOBmiscLights = {
                    [west, BUDGET, [Lights]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu26 = ["FOBMiscLights", "Lights", "", _FOBmiscLights, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBMisc"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Tower Lights
                    _FOBmiscLamps = {
                     [west, BUDGET, [AirportLamps]] call acex_fortify_fnc_registerObjects;
                     };
                         _Menu27 = ["FOBMiscLamps", "Tower Lights", "", _FOBmiscLamps, _condition] call ace_interact_menu_fnc_createAction;
                         [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "FOBMenu", "FOBMisc"], _action] call ace_interact_menu_fnc_addActionToClass;

        //Vehicle Menu
            _Vehiclemenu = {};
                _Menu4 = ["VehicleMenu","Vehicles","",_Vehiclemenu,_condition] call ace_interact_menu_fnc_createAction;
                 [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu"], _action] call ace_interact_menu_fnc_addActionToClass;
            //Light Vehicles
                _FOBlightvehicles = {};
                        _Menu8 = ["FOBLightVehicles","Light","",_FOBlightvehicles,_condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Humvees
                    _FOBlightvehiclesHMV = {
                     [west, BUDGET, [LightVehicles] call acex_fortify_fnc_registerObjects;
                     };
                         _Menu28 = ["FOBLightHMV", "Humvees", "", _FOBlightvehiclesHMV, _condition] call ace_interact_menu_fnc_createAction;
                         [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBLightVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;
                //MRAP's
                    _FOBlightvehiclesMRAP = {
                     [west, BUDGET, [MRAPs]] call acex_fortify_fnc_registerObjects;
                     };
                         _Menu29 = ["FOBLightMRAP", "MRAPs", "", _FOBlightvehiclesMRAP, _condition] call ace_interact_menu_fnc_createAction;
                         [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBLightVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Trucks
                    _FOBlightvehiclesTruck = {
                    [west, BUDGET, [Trucks]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu30 = ["FOBLightTruck", "Trucks", "", _FOBlightvehiclesTruck, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBLightVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;

            //Heavt Vehicles
                _FOBheavyvehicles = {};
                        _Menu9 = ["FOBHeavyVehicles","Heavy vehicles","",_FOBheavyvehicles,_condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu"], _action] call ace_interact_menu_fnc_addActionToClass;
                //APC
                    _FOBheavyvehickesAPC = {
                    [west, BUDGET, [APC]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu31 = ["FOBHeavyAPC", "APCs", "", _FOBheavyvehickesAPC, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBHeavyVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;
                //IFV
                    _FOBheavyvehickesIFV = {
                    [west, BUDGET, [IFVs]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu32 = ["FOBHeavyIFV", "IFVs", "", _FOBheavyvehickesIFV, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBHeavyVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;
                //TANK
                    _FOBheavyvehickesTank = {
                    [west, BUDGET, [Tanks]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu33 = ["FOBHeavyTank", "Tanks", "", _FOBheavyvehickesTank, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBHeavyVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;

            //Air Vehicles
                _FOBairvehicles = {};
                        _Menu10 = ["FOBAirVehicles","Air Vehicles","",FOBairvehicles,_condition] call ace_interact_menu_fnc_createAction;
                        [[(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Fixed Wing
                    _FOBairvehiclesPlanes = {
                    [west, BUDGET, [Planes]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu34 = ["FOBAirPlane", "Build Menu", "", _FOBairvehiclesPlanes, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBAirVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Rotary
                    _FOBairvehiclesRotary = {
                    [west, BUDGET, [TransportRotary]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu35 = ["FOBAirRotary", "Build Menu", "", _FOBairvehiclesRotary, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBAirVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Rotary CAS
                    _FOBairvehiclesRotaryCAS = {
                    [west, BUDGET, [CASRotary]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu39 = ["FOBAirCAS", "Build Menu", "", _FOBairvehiclesRotaryCAS, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBAirVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;

            //Other Vehicles
                _FOBothervehicles = {};
                        _Menu11 = ["FOBOtherVehicles","Other Vehicles","",_FOBothervehicles,_condition] call ace_interact_menu_fnc_createAction;
                        [[(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Arty
                    _FOBothervehiclesARTY = {
                    [west, BUDGET, [Arty]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu36 = ["FOBOtherArty", "Arty", "", _buildMenu, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBOtherVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Medical
                    _FOBothervehiclesMedical = {
                    [west, BUDGET, [MedicalVehicle]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu37 = ["FOBOtherMedical", "Medical", "", _buildMenu, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBOtherVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;
                //Logistics
                    _FOBothervehiclesLogistics = {
                    [west, BUDGET, [Logistics]] call acex_fortify_fnc_registerObjects;
                    };
                        _Menu38 = ["FOBOtherLogistics", "Logistics", "", _buildMenu, _condition] call ace_interact_menu_fnc_createAction;
                        [(typeOf _unit), 1, ["ACE_SelfActions", "BuildMenu", "VehicleMenu", "FOBOtherVehicles"], _action] call ace_interact_menu_fnc_addActionToClass;



