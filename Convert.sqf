//Change the FOB mobile crate into a fixed FOB


if (FOBTransit) then {

		this addAction [ "Convert FOB" , {

		profileNamespace setVariable [str (this getpos) ,  0 ]; // Sets new Variable
		
		deleteVehicle this;

		FOB createVehicle (this getpos);

		FOBs pushback (this getpos);

		}
	];
};


if (FOB && [profileNamespace getVariable str (this getpos)] == 0 ) then {

		this addAction [ "Convert FOB" , {

		profileNamespace setVariable [str (this getpos) ,  nil ]; // Sets new Variable
		
		deleteVehicle this;

		FOBTransit createVehicle (this getpos);

		FOBs = FOBs - (this getpos);

		}
	];
};


//Change the COP mobile crate into a fixed COP

if (COPTransit) then {

		this addAction [ "Convert COP" , {

		profileNamespace setVariable [str (this getpos) ,  0 ]; // Sets new Variable
		
		deleteVehicle this;

		COP createVehicle (this getpos);

		COPs pushback (this getpos);

		}
	];
};


if (COP && [profileNamespace getVariable str (this getpos)] == 0 ) then {

		this addAction [ "Convert COP" , {

		profileNamespace setVariable [str (this getpos) ,  nil ]; // Sets new Variable

		deleteVehicle this;

		COPTransit createVehicle (this getpos);

		COPs = COPs - (this getpos);

		}
	];
};
