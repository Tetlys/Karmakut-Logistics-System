params [
    ["_player", player, [objNull]]
];

if !(isPlayer _player) exitWith {["No player given"] call BIS_fnc_error; false};
//open factory
_player addAction [
("<t color=""#ff9600"">" + "build menu" + "</t>"),
 {
 if (!R3F_LOG_mutex_local_lock && (_player distance (nearestObject [getPos _player, FOB]) < 300) && _player in BUILD_PERMS) then {
  [nearestObject [getPos _player, FOB]] call R3F_LOG_FNCT_factory_open_factory;
 } else {hint "not available"};
 },
  nil, 5, false, true, "",""];

_player addAction [
("<t color=""#ff9600"">" + "REDEPLOY" + "</t>"),
 {
 if (FOBs > 0) then {
  [nearestObject [getPos _player, FOB]] call R3F_LOG_FNCT_factory_open_factory;
 } else {hint "not available"};
 },
  nil, 5, false, true, "",""];
