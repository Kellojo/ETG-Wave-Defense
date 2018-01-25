


_mode = _this select 0;



//get weapon array
if (_mode == 0) exitWith {
	_cfgweapons = configFile >> "CfgWeapons";
	_weapons = [];	
	for "_i" from 0 to (count _cfgWeapons)-1 do
	{
		_cur_wep = _cfgweapons select _i;
		
		if(isClass _cur_wep) then {
			_classname = configName _cur_wep;
			_wep_type = (_cur_wep >> "type") call BIS_fnc_getCfgData;;
			_scope = (_cur_wep >> "scope") call BIS_fnc_getCfgData;;
			_picture = (_cur_wep >> "picture") call BIS_fnc_getCfgData;;
			_mags = (_cur_wep >> "magazines") call BIS_fnc_getCfgData;;
			if(_scope >= 2 && _wep_type in [1,2,4,4096] && _picture != "" && !(_classname in _weapons) && _classname != "NVGoggles") then {
				diag_log format["Class: %1 - Type: %2 - Scope: %3 - WEP: %5",_classname,_wep_type,_scope,_picture,_cur_wep];
				_weapons set[count _weapons, _classname];
				_weapons pushBack [_classname,_mags];
			};
		};
	};
	_weapons;
};

//get vest array
if (_mode == 1) exitWith {
	_cfgweapons = configFile >> "CfgWeapons";
	_vests = [];	
	for "_i" from 0 to (count _cfgWeapons)-1 do {
		_cur_wep = _cfgweapons select _i;
		
		if(isClass _cur_wep) then {
			_classname = configName _cur_wep;
			_wep_type = (_cur_wep >> "type") call BIS_fnc_getCfgData;;
			_scope = (_cur_wep >> "scope") call BIS_fnc_getCfgData;;
			_picture = (_cur_wep >> "picture") call BIS_fnc_getCfgData;;
			_mags = (_cur_wep >> "magazines") call BIS_fnc_getCfgData;;
			if(_classname find "V_" == 0) then {
				_vests pushBack _classname;
			};
		};
	};
	_vests;
};


//random loadout
if (_mode == 5) exitWith {
	_unit = _this select 1;
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	
	_weapons = [] call allWeapons;
	_vests = [] call allVests;

	[7,_vests] call RandomVest;
	while {primaryWeapon _unit == ""} do {
	[6,_weapons] call RandomWeapon;
	};
};

//random weapon
if (_mode == 6) exitWith {
	_weapons = _this select 1;
	_unit = _this select 2;
	_weapon = _weapons call BIS_fnc_selectRandom;
	
	if (count _weapon == 2) then {
		_w = _weapon select 0;
		_mag = (_weapon select 1) call BIS_fnc_selectRandom;
		_unit addWeapon _w;
		_unit addMagazines [_mag, round(random 5) + 5];
	};
};

//random vest
if (_mode == 7) exitWith {
	_vests = _this select 1;
	_unit = _this select 2;
	_vest = _vests call BIS_fnc_selectRandom;
	_unit addVest _vest;
};

