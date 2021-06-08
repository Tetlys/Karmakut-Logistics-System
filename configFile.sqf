
/*
 * Set the cargo size of any object. Has global effect.
 * Adds the load action menu if necessary.
 * Negative size makes unloadable.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Cargo size <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, 3] call ace_cargo_fnc_setSize

  * Set the cargo space of any object. Has global effect.
 * Adds the cargo action menu if necessary.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Cargo space <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, 20] call ace_cargo_fnc_setSpace
  */
repair_buildings = [];


medical_vehicles = [
    "vtx_HH60",
    "B_T_Truck_01_medical_F",
    "B_Truck_01_medical_F",
    "C_Van_02_medevac_F",
    "CUP_B_BMP2_AMB_CDF",
    "CUP_B_BMP2_AMB_CZ_Des",
    "CUP_B_BMP2_AMB_CZ",
    "CUP_B_FV432_GB_Ambulance",
    "CUP_B_HMMWV_Ambulance_ACR",
    "CUP_B_HMMWV_Ambulance_USA",
    "CUP_B_HMMWV_Ambulance_USMC",
    "CUP_B_LR_Ambulance_CZ_D",
    "CUP_B_LR_Ambulance_CZ_W",
    "CUP_B_LR_Ambulance_GB_D",
    "CUP_B_LR_Ambulance_GB_W",
    "CUP_B_S1203_Ambulance_CDF",
    "CUP_B_UH1Y_MEV_USMC",
    "CUP_B_UH60M_Unarmed_FFV_MEV_US",
    "CUP_O_BMP2_AMB_CHDKZ",
    "CUP_O_BMP2_AMB_sla",
    "CUP_O_LR_Ambulance_TKA",
    "CUP_O_M113_Med_TKA",
    "gm_gc_airforce_mi2sr",
    "gm_gc_army_ural375d_medic_win",
    "gm_gc_army_ural375d_medic",
    "gm_ge_airforce_do28d2_medevac",
    "gm_ge_army_u1300l_medic_win_rc",
    "gm_ge_army_u1300l_medic",
    "I_E_Truck_02_Medical_F",
    "I_E_Van_02_medevac_F",
    "O_T_Truck_03_medical_ghex_F",
    "O_Truck_03_medical_F",
    "RHS_UH60M_MEV_d",
    "RHS_UH60M_MEV",
    "RHS_UH60M_MEV2_d",
    "RHS_UH60M_MEV2",
    "rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy",
    "rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy",
    "rhsusf_m113_usarmy_medical",
    "rhsusf_m113d_usarmy_medical",
    "rhsusf_M1230a1_usarmy_d",
    "rhsusf_M1230a1_usarmy_wd",
    "UK3CB_BAF_LandRover_Amb_FFR_Green_A_MTP",
    "UK3CB_BAF_LandRover_Amb_FFR_Sand_A_DDPM",
    "uns_ch47a_medevac",
    "uns_H13_medevac_CAV",
    "uns_M577_amb",
    "uns_uh1D_med"
];

// Building classnames which also function as ACE medical facilities.
medical_facilities = [
    "Land_Medevac_house_V1_F",
    "Land_Medevac_HQ_V1_F",
    "Land_MedicalTent_01_white_generic_outer_F", // make this entry match the Field Hospital classname specified by `karma_deployableFieldHospitals_shared_fieldHospitalClassname`
    "LAND_uns_army_med",
    "LAND_uns_tent3mash",
    "uns_mash_main",
    "uns_mash",
    "US_Tent_2",
    "US_Tent_MASH"
];

// Classnames of ACE3 crates (which have to be in the unit preset as well).
ace_crates = [
    "ACE_Box_82mm_Mo_HE",
    "ACE_Box_82mm_Mo_Illum",
    "ACE_Box_82mm_Mo_Smoke",
    "ACE_medicalSupplyCrate_advanced"
];
// sets which objects can be carried
ace_canCarry = [
  "Land_MetalBarrel_F",
  "CargoNet_01_barrels_F"
];
// analog to the above but dragging
ace_canDrag = [
  "Land_MetalBarrel_F",
  "CargoNet_01_barrels_F"
];



//which type of barrel to spawn
Small_Barrel = "Land_MetalBarrel_F";
Bigger_Barrel = "CargoNet_01_barrels_F";

// max number of barrels factory will spawn
Resource_Cap_Factory = 5;

// chance that factory will spawn smaller barrel
Small_Barrel_Chance = 50;

//buildings in which supplies will spawn
Factory_Buildings = ["Land_i_Shed_Ind_F"];


[playerSide west,  "Land_MetalBarrel_F"] call ace_dragging_fnc_canDrop_carry;
[playerSide west, "CargoNet_01_barrels_F"] call ace_dragging_fnc_canDrop_carry;

