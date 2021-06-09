//General Build Menu (selects the preset to use)

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class BuildMenu{
                displayName = "Build Menu";
                condition = "getPlayerUID _Player in BUILD_PERMS";
                    class CopMenu{
                        displayName = "COP Building";
                            class COPsandbagwalltall {
                                displayName = "Tall Sandbags";
                                statement = "[west, BUDGET, [_SandbagWallsTall] call acex_fortify_fnc_registerObjects";
                            };
                            class COPstaticweapons {
                                displayName = "Static Weapons";
                                statement = "[west, BUDGET, [_StaticWeapons] call acex_fortify_fnc_registerObjects";
                            };
                            class COPsandbagwall {
                                displayName = "Sandbags";
                                statement = "[west, BUDGET, [_Sandbags] call acex_fortify_fnc_registerObjects";
                            };
                            class COPsandbagbunkers {
                                displayName = "Buildings";
                                statement = "[west, BUDGET, [_SandbagBunkers] call acex_fortify_fnc_registerObjects";
                            };
                    };
                    class FOBmenu {
                        displayName = "FOB Building";
                            class FOBBuildings {
                                displayName = "Buildings";
                                    class FOBBuildingsWalls {
                                        displayName = "Walls";
                                        statement = "[west, BUDGET, [_HbarrierWall] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBBuildingsBlocks {
                                        displayName = "Blocks";
                                        statement = "[west, BUDGET, [_HBarrierBlocks] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBBuildingsBuildings {
                                        displayName = "Buildings";
                                        statement = "[west, BUDGET, [_MilitaryBuildings] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBBuildingsBunkers {
                                        displayName = "Bunkers";
                                        statement = "[west, BUDGET, [_Bunkers] call acex_fortify_fnc_registerObjects";
                                    };
                            };
                            class FOBLogistics {
                                displayName = "Logistics";
                                    class FOBLogisticsRepair {
                                        displayName = "Resupply";
                                        statement = "[west, BUDGET, [_RepairPoints] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBLogisticsSwap {
                                        displayName = "Resources";
                                        statement = "[west, BUDGET, [_ResourceExchange] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBLogisticsFOB {
                                        displayName = "New FOB/COP";
                                        statement = "[west, BUDGET, [_BuildPoint] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBLogisticsMedical {
                                        displayName = "Medical Buildings";
                                        statement = "[west, BUDGET, [_MedicalBuildings] call acex_fortify_fnc_registerObjects";
                                    };
                            };
                            class FOBmisc {
                                displayName = "Misc";
                                    class FOBmiscWalls {
                                        displayName = "Walls";
                                        statement = "[west, BUDGET, [_WallsAndGates] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBmiscnets {
                                        displayName = "Camo Nets";
                                        statement = "[west, BUDGET, [_CamoNets] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBmiscLights {
                                        displayName = "Lights";
                                        statement = "[west, BUDGET, [_Lights] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBmiscLamps {
                                        displayName = "Tower Lights";
                                        statement = "[west, BUDGET, [_AirportLamps] call acex_fortify_fnc_registerObjects";
                                    };
                            };
                    };
                    class Vehiclemenu{
                        displayName = "Vehicle Menu";
                            class FOBlightvehicles {
                                displayName = "Light Vehicles";
                                    class FOBlightvehiclesMRAP {
                                        displayName = "MRAPs";
                                        statement = "[west, BUDGET, [_MRAPs] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBlightvehiclesHMV {
                                        displayName = "HMMVVs";
                                        statement = "[west, BUDGET, [_LightVehicles] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBlightvehiclesTruck {
                                        displayName = "Trucks";
                                        statement = "[west, BUDGET, [_Trucks] call acex_fortify_fnc_registerObjects";
                                    };
                            };
                            class FOBheavyvehickes {
                                displayName = "Heavy Vehicles";
                                    class FOBheavyvehickesAPC {
                                        displayName = "APC";
                                        statement = "[west, BUDGET, [_APC] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBheavyvehickesIFV {
                                        displayName = "IFV";
                                        statement = "[west, BUDGET, [_IFVs] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBheavyvehickesTank {
                                        displayName = "TANK";
                                        statement = "[west, BUDGET, [_Tanks] call acex_fortify_fnc_registerObjects";
                                    };
                            };
                            class FOBairvehicles {
                                displayName = "Air Vehicles";
                                    class FOBairvehiclesPlanes {
                                        displayName = "Fixed Wing";
                                        statement = "[west, BUDGET, [_Planes] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBairvehiclesRotary {
                                        displayName = "Rotary";
                                        statement = "[west, BUDGET, [_TransportRotary] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBairvehiclesRotaryCAS {
                                        displayName = "Rotary CAS";
                                        statement = "[west, BUDGET, [_CASRotary] call acex_fortify_fnc_registerObjects";
                                    };
                            };
                            class FOBothervehicles {
                                displayName = "Other Vehicles";
                                    class FOBothervehiclesARTY {
                                        displayName = "Arty";
                                        statement = "[west, BUDGET, [_Arty] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBothervehiclesMedical {
                                        displayName = "Medical";
                                        statement = "[west, BUDGET, [_MedicalVehicle] call acex_fortify_fnc_registerObjects";
                                    };
                                    class FOBothervehiclesLogistics {
                                        displayName = "Logstics";
                                        statement = "[west, BUDGET, [_Logistics] call acex_fortify_fnc_registerObjects";
                                    };
                            };
                    };
            };
        };
    };
};


