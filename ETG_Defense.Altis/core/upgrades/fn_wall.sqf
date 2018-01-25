/*
	Filename: fn_wall.sqf
	Author: Kellojo
	Description: handles the wall upgrade
*/

_upgrade = _this select 0;

//Thin wall upgrade
if (_upgrade == "Wall_V1") then {
	{_x hideObjectGlobal false;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_Wall_Tin_4"], 200];
	defense_upgrade_wall_v1 = true;
	_txt = parseText localize "STR_NOTF_Wallv1";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//Barrier Upgrade
if (_upgrade == "Wall_V2") then {
	{_x hideObjectGlobal false;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_HBarrierWall6_F"], 200];
	{_x hideObjectGlobal true;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_Wall_Tin_4"], 200];
	{_x hideObjectGlobal false;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_HBarrierWall4_F"], 200];
	{_x hideObjectGlobal false;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_HBarrierWall_corner_F"], 200];
	defense_upgrade_wall_v2 = true;
	_txt = parseText localize "STR_NOTF_Wallv2";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//roof Upgrade
if (_upgrade == "Wall_V3") then {
	{_x hideObjectGlobal false;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_BagFence_Long_F"], 200];
	defense_upgrade_wall_v3 = true;
	_txt = parseText localize "STR_NOTF_Wallv3";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//lighthouse Upgrade
if (_upgrade == "Wall_V4") then {
	{_x hideObjectGlobal false;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_BagFence_Round_F"], 200];
	defense_upgrade_wall_v4 = true;
	_txt = parseText localize "STR_NOTF_Wallv4";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//tower Upgrade
if (_upgrade == "Wall_V5") then {
	{_x hideObjectGlobal false;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_Cargo_Patrol_V1_F"], 200];
	defense_upgrade_wall_v5 = true;
	_txt = parseText localize "STR_NOTF_Wallv5";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//turret 1 Upgrade
if (_upgrade == "turret_1") then {
	{
		_x hideObjectGlobal false;
		_x setVehicleAmmo 1;
		_x allowDamage true;
		_x enableSimulation true;
	} forEach [Turret_V1_1,Turret_V1_2];
	defense_upgrade_turret_1 = true;
	_txt = parseText localize "STR_NOTF_Wallv6";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//turret 2 Upgrade
if (_upgrade == "turret_2") then {
	{
		_x hideObjectGlobal false;
		_x setVehicleAmmo 1;
		_x allowDamage true;
		_x enableSimulation true;
	} forEach [Turret_V2_1,Turret_V2_2];
	defense_upgrade_turret_2 = true;
	_txt = parseText localize "STR_NOTF_Wallv7";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//turret 3 Upgrade
if (_upgrade == "turret_3") then {
	{
		_x hideObjectGlobal false;
		_x setVehicleAmmo 1;
		_x allowDamage true;
		_x enableSimulation true;
	} forEach [Turret_V3_1,Turret_V3_2];
	defense_upgrade_turret_3 = true;
	_txt = parseText localize "STR_NOTF_Wallv8";
	[_txt] remoteExec ["fn_hint", 0, false];
};
