OnCOPTransitConverted = {
	params ["_building", "_converter"];

	[_building] remoteExec ["OnCOPTransitConvert", -2];
};