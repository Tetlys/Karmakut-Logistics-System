//Change the FOB mobile crate into a fixed fob


if (_FOBTransit) then {

		this addAction [ "Convert FOB" , {

		profileNamespace setVariable [str (this getpos) ,  0 ]; // Sets new Variable
		
		deleteVehicle this

		 _FOB createVehicle (this getpos)

		};
	];
};


if (_FOB && [profileNamespace getVariable str (this getpos)] == 0 ) then {

		this addAction [ "Convert FOB" , {

		profileNamespace setVariable [str (this getpos) ,  nil ]; // Sets new Variable
		
		deleteVehicle this

		_FOBTransit createVehicle (this getpos)

		};
	];
};
