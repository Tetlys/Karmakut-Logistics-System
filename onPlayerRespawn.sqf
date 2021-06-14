waitUntil {time > 0};
[] call compileFinal preprocessFileLineNumbers "scripts\build\InteractionMenu.sqf";


player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";