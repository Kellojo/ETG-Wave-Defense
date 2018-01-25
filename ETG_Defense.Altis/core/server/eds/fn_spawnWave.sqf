/*
	Filename: fn_spawnWave.sqf
	Author: Kellojo & Spikey
	Description: main function for the wave mechanic
*/
private ["_mode","_veh","_waveDifficulty","_unit"];
_waveDifficulty = 0;
_unit = "";

_mode = _this select 0;


//setup
if (_mode == 0) exitWith {
	defense_att_Groups = [];
	defense_att_main_group_scale = 0;
	publicvariable "defense_att_Groups";
	publicvariable "defense_att_main_group_scale";
};


//spawn enemies
if (_mode == 1) exitWith {
	[parseText format [localize "STR_WaveStart",defense_wave]] call fn_hint;

	_lVeh = (missionConfigFile >> "Difficulty" >> "LightVeh" >> "chance") call BIS_fnc_getCfgData;
	_mVeh = (missionConfigFile >> "Difficulty" >> "MedVeh" >> "chance") call BIS_fnc_getCfgData;
	_hVeh = (missionConfigFile >> "Difficulty" >> "HeavyVeh" >> "chance") call BIS_fnc_getCfgData;
	_bVeh = (missionConfigFile >> "Difficulty" >> "Boat" >> "chance") call BIS_fnc_getCfgData;
	_aVeh = (missionConfigFile >> "Difficulty" >> "Air" >> "chance") call BIS_fnc_getCfgData;

	_lnWave = ln(defense_wave);
	_clVeh = _lnWave * _lVeh * defense_wave;
	_cmVeh = _lnWave * _mVeh * defense_wave;
	_chVeh = _lnWave * _hVeh * defense_wave;
	_cbVeh = _lnWave * _bVeh * defense_wave;
	_caVeh = _lnWave * _aVeh * defense_wave;

	_lightVehs = (missionConfigFile >> "Enemies" >> "light_vehicles") call BIS_fnc_getCfgData;
	_mediumVehs = (missionConfigFile >> "Enemies" >> "medium_vehicles") call BIS_fnc_getCfgData;
	_heavyVehs = (missionConfigFile >> "Enemies" >> "heavy_vehicles") call BIS_fnc_getCfgData;
	_airVehs = (missionConfigFile >> "Enemies" >> "air_vehicles") call BIS_fnc_getCfgData;
	_boatVehs = (missionConfigFile >> "Enemies" >> "water_vehicles") call BIS_fnc_getCfgData;

	_gVehs = [];
	_aVehs = [];
	_bVehs = [];

	_types = [
		[_caVeh,_airVehs,"_aVehs"],
		[_chVeh,_heavyVehs,"_gVehs"],
		[_cbVeh,_boatVehs,"_bVehs"],
		[_cmVeh,_mediumVehs,"_gVehs"],
		[_clVeh,_lightVehs,"_gVehs"]
	];

	{
		_cVeh = _x select 0;
		_avVehs = _x select 1;
		_var = _x select 2;

		while {_cVeh > 0} do {
			if (random 10000 < _cVeh) then {
				_veh = _avVehs call BIS_fnc_selectRandom;
				([] call compile _var) pushback _veh;
				if(defense_debug == 1) then {
					diag_log "Pushback Vehicle";
					diag_log str _veh;
				};
			};

			_cVeh = _cVeh - 10000;
		};
	} forEach _types;


	_waveDifficulty = [2] call fn_getDifficulty;

	{
		if (_waveDifficulty < 0) exitWith {};
		
		_grp = [2] call fn_group;
		_spos = [getMarkerPos "bluefor_base_AI_wp", 500, 1500, 0, 0, 20, 0] call BIS_fnc_findSafePos;
		_pos = [_spos select 0, _spos select 1 , 250];
		
		_veh = ([_pos, 180, _x, _grp] call bis_fnc_spawnvehicle) select 0;
		_veh engineON true;
		{[(_x select 0)] join _grp;} forEach fullCrew _veh;
		//_veh setVectorUp surfaceNormal position _veh;
		_veh setDamage 0;
		ETG_cleanUPVehs pushback _veh;
		_diff = [1,_x] call fn_getDifficulty;
		_waveDifficulty = _waveDifficulty - _diff;
	} forEach _aVehs;

	{
		if (_waveDifficulty < 0) exitWith {};
		
		_grp = [2] call fn_group;
		_spos = [getMarkerPos "bluefor_base_AI_wp", 300, 500, 0, 0, 20, 0] call BIS_fnc_findSafePos;
		
		_veh = ([_spos, 180, _x, _grp] call bis_fnc_spawnvehicle) select 0;
		{[(_x select 0)] join _grp;} forEach fullCrew _veh;
		_veh setVectorUp surfaceNormal position _veh;
		_veh setDamage 0;
		ETG_cleanUPVehs pushback _veh;
		
		_space = count fullcrew[_veh, "Cargo",true];
		While {_space > 0} do {
			if (_waveDifficulty < 0) exitWith {};
			
			_arr = (missionConfigFile >> "Enemies" >> "units") call BIS_fnc_getCfgData;
			_classname = _arr call BIS_fnc_selectRandom;
			_unit = _grp createUnit [_classname,[0,0,0], [], 0, "FORM"];
			_unit assignAsCargo _veh;
			_unit moveInCargo _veh;
			
			_diff = [0,_unit] call fn_getDifficulty;
			_waveDifficulty = _waveDifficulty - _diff;
			_space = _space - 1;
		};
		
		_diff = [1,_x] call fn_getDifficulty;
		_waveDifficulty = _waveDifficulty - _diff;
	} forEach _gVehs;

	//create groups of five and put them in seperate groups and positions
	_cntr = 0;
	_grp = [2] call fn_group;
	_spos = [getMarkerPos "bluefor_base_AI_wp", 250, 400, 0, 0, 20, 0] call BIS_fnc_findSafePos;
	while {_waveDifficulty > 0} do {
		if (_cntr >= 5) then {
			_spos = [getMarkerPos "bluefor_base_AI_wp", 250, 400, 0, 0, 20, 0] call BIS_fnc_findSafePos;
			_grp = [2] call fn_group;
			_cntr = 0;
		};
	
		if (_waveDifficulty < 0) exitWith {};	
		_arr = (missionConfigFile >> "Enemies" >> "units") call BIS_fnc_getCfgData;
		_classname = _arr call BIS_fnc_selectRandom;
		_unit = _grp createUnit [_classname, _spos, [], 0, "FORM"];
		
		_diff = [0,_unit] call fn_getDifficulty;
		_waveDifficulty = _waveDifficulty - _diff;
		_cntr = _cntr + 1;
	};



	defense_att_main_group_scale = [0, defense_att_Groups] call fn_group;
	defense_wave_complete = false;
	publicvariable "defense_att_main_group_scale";
	publicvariable "defense_att_Groups";

	[1,defense_att_Groups] call fn_group;
	[3,defense_att_Groups] call fn_group;
	

	//next wave
	[] spawn {
		waitUntil {defense_wave_complete || ([0, defense_att_Groups] call fn_group) <= 5};
		[defense_wave] spawn {
			if (defense_wave_complete) exitWith {};
			_wave = _this select 0;
			systemChat "The left over AI is going to be deleted in three minutes.";
			sleep 180;
			
			if (_wave == defense_wave) then {
				[4,defense_att_Groups] call fn_group;
			};
		};
		
		waitUntil {defense_wave_complete || ([0, defense_att_Groups] call fn_group) == 0};
		
		_reward = round random 20;
		[parseText format [localize "STR_WaveEnd",defense_wave,_reward,defense_wave + 1]] call fn_hint;
		defense_wave = defense_wave + 1;
		publicvariable "defense_wave";
		[1, _reward] remoteExec ["fn_addMoney", 2, false];
		sleep (["TimeBetweenWaves", 10] call BIS_fnc_getParamValue);
		[1] spawn fn_spawnWaves;
	};
};


