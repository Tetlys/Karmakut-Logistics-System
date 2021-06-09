//List of FOBs
FOBs = [];

//List of COPs
COPs = [];

//Budget Variable
BUDGET = [];

_content = preprocessFile "BuildTrigger.sqf"; // File path for Start build system
_activated = profileNamespace getVariable "Activated"; // Calls for number of activated build stations (Max 1)


Arsenal_typename = "B_supplyCrate_F";


BUILD_PERMS = ["76561198402038100", //NOACE
               "76561198060416563", //COFFEE
               "76561198047333011", //TETLYS
               "76561198027253604", //FORTIS
               "76561198343484805", //Azraeel
               "76561198010961319", //Ryan
               "76561197994896067" // DOB
               ];


AIR_PERMS = [  "76561198402038100", //NOACE
               "76561198060416563", //COFFEE
               "76561198047333011", //TETLYS
               "76561198027253604", //FORTIS
               "76561198343484805", //Azraeel
               "76561198010961319", //Ryan
               "76561197994896067" // DOB
               ];
ARMOR_PERMS = [  "76561198402038100", //NOACE
                 "76561198060416563", //COFFEE
                 "76561198047333011", //TETLYS
                 "76561198027253604", //FORTIS
                 "76561198343484805", //Azraeel
                 "76561198010961319", //Ryan
                 "76561197994896067" // DOB
               ];
