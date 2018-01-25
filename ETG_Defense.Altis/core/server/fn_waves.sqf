/*
	Filename: fn_waves.sqf
	Author: Kellojo
	Description: main function for the wave mechanic
*/
private ["_mode","_veh","_breaktime"];
_mode = _this select 0;
_breaktime = (missionConfigFile >> "Main" >> "PauseTime")  call BIS_fnc_getCfgData;

//setup
if (_mode == 0) exitWith {
	defense_att_main_group = createGroup east;
	publicvariable "defense_att_main_group";
};


//spawn enemies
if (_mode == 1) exitWith {
	
	//get units
	_count = 0;
	_units = [];
	_vehs = [];
	_cur_vehs = [];
	_pos = [getMarkerPos "bluefor_base_AI_wp", 200, 350, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	defense_wave_complete = false;
	sleep 15;
	hint parseText format ["<t color='#97FA21'><t size='2.2'>Wave %1 is starting<br/></t></t>",defense_wave];
	
	//Get units
	//_multiplyer = round ((count playableUnits) / 2);
	while {_count <= defense_wave * 2} do {
		_units pushback (defense_att_units call BIS_fnc_selectRandom);
		
		//Add light vehicles (10% chance)
		if (round random 1000 < (10 * defense_wave)) then {
			_vehs pushback (defense_att_light call BIS_fnc_selectRandom);
		};
		
		//Add heavy vehicles (2% chance)
		if (round random 1000 < (1 * defense_wave) && defense_wave >= 10) then {
			_vehs pushback (defense_att_heavy call BIS_fnc_selectRandom);
		};
		
		//Add air vehicles (2% chance)
		if (round random 1000 < (1 * defense_wave) && defense_wave >= 10) then {
			_vehs pushback (defense_att_air call BIS_fnc_selectRandom);
		};
		/*Add water vehicles (2% chance)
		if (round random 1000 < (10 * defense_wave) && defense_wave >= 5) then {
			_vehs pushback (defense_att_water call BIS_fnc_selectRandom);
		};
		*/
		_count = _count + 1;
	};
	
	//Spawn units
	{
		//Man 
		if (_x isKindOf "Man") then {
			_x createUnit [_pos,defense_att_main_group];
			_x allowFleeing = 0.1;
		};
		
	} forEach _units;
	//Spawn vehicles
	{
		//Air
		if (_x in defense_att_air) then {
			_spos = [getMarkerPos "bluefor_base_AI_wp", 600, 1500, 0, 2, 20, 0] call BIS_fnc_findSafePos;
			_veh = _x createVehicle _spos;
		};
		//Boats
		if (_x in defense_att_water) then {
			_spos = [getMarkerPos "boat_spawn", 300, 500, 3, 2, 20, 0] call BIS_fnc_findSafePos;
			_veh = _x createVehicle _spos;
		};
		//Tank/car/Man
		if (_x in defense_att_heavy || _x in defense_att_light) then {
			_spos = _pos findEmptyPosition [1,100,_x];
			_veh = _x createVehicle _spos;
			[_veh] spawn {
				sleep 500;
				deleteVehicle (_this select 0);
			};
		};

		createVehicleCrew _veh;
		ETG_cleanUPVehs pushback _veh;
		{[(_x select 0)] join defense_att_main_group;} forEach fullCrew _veh;
		_cur_vehs pushback _veh;
		_veh setVectorUp surfaceNormal position _veh;
		_veh setDamage 0;
		_veh = objNull;
	} forEach _vehs;
	
	//Add waypoints
	publicvariable "defense_att_main_group";
	_wp = defense_att_main_group addWaypoint [getMarkerPos "bluefor_base_AI_wp", 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointSpeed "FULL";
	_wp = defense_att_main_group addWaypoint [getMarkerPos "bluefor_base_AI_wp", 1];

	{_x setDamage 0} forEach _cur_vehs;
	defense_att_main_group_scale = count (units defense_att_main_group);
	publicvariable "defense_att_main_group_scale";
	{
		_x addMPEventHandler ["MPKilled", {[_this] call fn_onAIKilled;}];
		//_x disableAI "FSM";
	} forEach (units defense_att_main_group);
	
	sleep _breaktime;
	//spawn next wave
	[] spawn {
		waitUntil {
			_enemy_count = 0;
			{if (alive _x) then {_enemy_count = _enemy_count + 1;};} forEach units defense_att_main_group;
			defense_wave_complete || count units defense_att_main_group == 0 || _enemy_count == 0
		};
		hint parseText format ["<t color='#97FA21'><t size='2.2'>Wave %1 is over<br/></t></t>Congratulations!<br/>You have revieved %2 as a reward.<br/>Wave %3 is going to start soon.<br/>",defense_wave,"",defense_wave + 1];
		defense_wave = defense_wave + 1;
		publicvariable "defense_wave";
		[1,round random 20] remoteExec ["fn_addMoney", 2, false];
		[1] call fn_waves;
	};
};



