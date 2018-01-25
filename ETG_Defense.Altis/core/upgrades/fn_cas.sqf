/*
	Filename: fn_cas.sqf
	Author: Kellojo
	Description: main function for the cas
*/

[_this select 0] spawn {
	_pos = _this select 0; 
	_dir = 231;
	_class = "B_Plane_CAS_01_F";
	_type = 2;
	_dummy = "LaserTargetCBase" createVehicle _pos; 
	_dummy enableSimulation false; 
	_dummy hideObject true; 
	_dummy setVariable ["vehicle",_class]; 
	_dummy setVariable ["type",_type]; 
	_dummy setDir _dir; 
	[_dummy,nil,true] call BIS_fnc_moduleCAS; 
	[_dummy] spawn { 
		sleep 10; 
		deleteVehicle (_this select 0); 
	};
};
