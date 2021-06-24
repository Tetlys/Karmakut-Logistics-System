OnFOBTransitConverted = {
	params ["_building", "_converter"];

	[_building] remoteExec ["OnFOBTransitConvert", -2];
};