/*
	Filename: fn_getDifficulty.sqf
	Author: Spikey & Kellojo
	Description: gets the difficulty of a vehicle/man
*/

private ["_difficulty"];

_mode = _this select 0;
if (isNil "_mode") exitWith {};

//Man Difficulty
if (_mode == 0) then {
	_cveh = _this select 1;
	if (isNil "_cveh") exitWith {};
	_mag = currentMagazine _cveh;
	_ammo = (configfile >> "CfgMagazines" >> _mag >> "ammo") call BIS_fnc_getCfgData;

	_hit = (configfile >> "CfgAmmo" >> _ammo >> "hit") call BIS_fnc_getCfgData;
	_typicalSpeed = (configfile >> "CfgAmmo" >> _ammo >> "typicalSpeed") call BIS_fnc_getCfgData;
	_deflecting = (configfile >> "CfgAmmo" >> _ammo >> "deflecting") call BIS_fnc_getCfgData;

	_difficulty = [(ln((_typicalSpeed / 100) + (_hit * 100) - (_deflecting * 1.5)) / 6),2] call BIS_fnc_cutDecimals;
};


//Vehicle Difficulty
//Params:
//	_this : mode,classname
if (_mode == 1) then {
	_cveh = _this select 1;
	if (isNil "_cveh" || _cveh == "") exitWith {};
	_armor = (configfile >> "CfgVehicles" >> _cveh >> "armor") call BIS_fnc_getCfgData;
	_dispName = (configfile >> "CfgVehicles" >> _cveh >> "displayName") call BIS_fnc_getCfgData;
	_veh = _cveh createVehicleLocal [0,0,0];
	
	_midRange = 0;
	_hit = 0;
	_typicalSpeed = 0;
	_deflecting = 0;
	
	if !(_veh weaponsTurret [0] isEqualTo []) then {
		_turret = (_veh weaponsTurret [0]) select 0;
		if !(isNil "_turret" || _turret == "") then {
			_midRange = (configfile >> "CfgWeapons" >> _turret >> "midRange") call BIS_fnc_getCfgData;
			_mag = (configfile >> "CfgWeapons" >> _turret >> "magazines") call BIS_fnc_getCfgData select 0;
			_ammo = (configfile >> "CfgMagazines" >> _mag >> "ammo") call BIS_fnc_getCfgData;
			
			if !(isNil "_ammo") then {
				_hit = (configfile >> "CfgAmmo" >> _ammo >> "hit") call BIS_fnc_getCfgData;
				_typicalSpeed = (configfile >> "CfgAmmo" >> _ammo >> "typicalSpeed") call BIS_fnc_getCfgData;
				_deflecting = (configfile >> "CfgAmmo" >> _ammo >> "deflecting") call BIS_fnc_getCfgData;
			};
		};
	};
	
	_hit = if (isNil "_hit") then {1} else {_hit};
	_armor = if (isNil "_armor") then {100} else {_armor};
	_midRange = if (isNil "_midRange") then {100} else {_midRange};
	_typicalSpeed = if (isNil "_typicalSpeed") then {1} else {_typicalSpeed};
	_deflecting = if (isNil "_deflecting") then {1} else {_deflecting};
	
	deleteVehicle _veh;
	//_txt = format ["%1,%2,%3,%4,%5,%6,%7",_dispName,_cveh,_armor,_midRange,_typicalSpeed,_hit,_deflecting];
	//diag_log _txt;
	//hint _txt;
	_difficulty = [((ln(_armor * 10 + _midRange / 5 + _typicalSpeed + _hit * 100) * 100) / 100),2]call BIS_fnc_cutDecimals;
};


//Round Difficulty
if (_mode == 2) then {
	_round = defense_wave;
	_playerCount = count (allPlayers - entities "HeadlessClient_F");
	_fac = ln(_round + 1);

	_difficulty = [(((ln(_round * 2) + ln(_fac) * _playerCount) * 1000) / 100),2]call BIS_fnc_cutDecimals;
	if (_round == 1) then {
		_difficulty = 10;
	};
};

_difficulty

