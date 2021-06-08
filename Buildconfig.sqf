#include "GetBudget.sqf"

_Budget = profileNamespace getVariable "Budget";

/*
 * Author: Kingsley
 * Registers the given objects in the given side's player interaction menu.
 * Players on that side must have the pickaxe item in their inventory to access the menu.
 * Classnames must be in the format [<classname>, <cost>]
 * MUST BE CALLED ON SERVER!
 *
 * Arguments:
 * 0: Side <SIDE>
 * 1: Budget <NUMBER>
 * 2: Object Classnames <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [west, _Budget, [["Land_BagFence_Long_F", 5], ["Land_BagBunker_Small_F", 50]]] call acex_fortify_fnc_registerObjects
 *
 * Public: Yes
 */

// Types of preset config, cars, planes, boats etc.

_type1 = {
 ["Land_BagFence_Long_F", 5]
};

_type2 = {
 ["Land_BagFence_Long_F", 5]
};


//General Build Menu (selects the preset to use)

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class BuildMenu{
                displayName = "Build Menu";
                class _Type1 {
                    displayName = "Preset Type 1";
                    statement = "[ _Type1 ] call acex_fortify_fnc_registerObjects";
                };
                class _Type2 {
                    displayName = "Preset Type 2";
                    statement = "[ _type2 ] call acex_fortify_fnc_registerObjects";
                };
            };
        };
    };
};


