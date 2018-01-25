/*
	Filename: fn_VehicleScrapper.sqf
	Author: Kellojo
	Description: handles the vehicle scrapper
*/

_vehs = nearestObjects [player, ["Car","Tank","Air"], 10];

{
	_class = typeOf _x;
	_reward = [_class] call {
		_class = _this select 0;
		
		_lV = (missionConfigFile >> "Enemies" >> "light_vehicles") call BIS_fnc_getCfgData;
		_mV = (missionConfigFile >> "Enemies" >> "medium_vehicles") call BIS_fnc_getCfgData;
		_hV = (missionConfigFile >> "Enemies" >> "heavy_vehicles") call BIS_fnc_getCfgData;
		
		_aV = (missionConfigFile >> "Enemies" >> "air_vehicles") call BIS_fnc_getCfgData;
		_bV = (missionConfigFile >> "Enemies" >> "water_vehicles") call BIS_fnc_getCfgData;
		
		if (_class in _lv) exitWith {(missionConfigFile >> "VehicleScrapper" >> "lVehicles") call BIS_fnc_getCfgData};
		if (_class in _mV) exitWith {(missionConfigFile >> "VehicleScrapper" >> "mVehicles") call BIS_fnc_getCfgData};
		if (_class in _hV) exitWith {(missionConfigFile >> "VehicleScrapper" >> "hVehicles") call BIS_fnc_getCfgData};
		
		if (_class in _aV) exitWith {(missionConfigFile >> "VehicleScrapper" >> "aVehicles") call BIS_fnc_getCfgData};
		if (_class in _bV) exitWith {(missionConfigFile >> "VehicleScrapper" >> "bVehicles") call BIS_fnc_getCfgData};
		
		if (_class != "") exitWith {15};
	};
	_disp = getText (configfile >> "CfgVehicles" >>_class >> "displayName");
	hint parseText format ["<t color='#97FA21'><t size='2.2'>Sold: %2<br/></t></t>Congratulations!<br/>You have revieved %1 funds as a reward.",_reward,_disp];
	[1,_reward] remoteExec ["fn_addMoney", 2, false];
	deletevehicle _x;
} forEach _vehs;
