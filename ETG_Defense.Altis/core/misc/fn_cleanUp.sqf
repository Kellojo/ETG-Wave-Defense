/*
	Filename: fn_cleanUp.sqf
	Author: Kellojo
	Description: cleans up the corpses and wrecks etc...
*/


_mode = _this select 0;
if (isNil "_mode") exitWith {};

if (_mode == 1) then {
	while {true} do {
		{
			[2, _x, false] call fn_cleanUp;
		} forEach allDead;
		
		{
			[2, _x, true] call fn_cleanUp;
		} forEach ETG_cleanUPVehs;
		
		{
			_group = _x;
			{
				if (((getMarkerPos "bluefor_base_AI_wp") distance2D _x) > 600) then {
					deleteVehicle _x;
				};
			} forEach units _group;
		} forEach defense_att_Groups;
		
		sleep 20;
	};
};


//checks if vehicles should be deleted and deletes it
if (_mode == 2) then {
	_entity = _this select 1;
	_isVeh = _this select 2;
	if (isNil "_entity" || _entity == objNull) exitWith {};
	_time = _entity getVariable "aliveSince";
	
	_delAfter = if (_isVeh) then {560} else {500};
	
	if (isNil "_time") then {
		_entity setVariable ["aliveSince", time];
	} else {
		_isTurret = typeOf _entity in ["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F"];
		_isDeletable = time - _time > _delAfter && !_isVeh && !_isTurret;
		_isEmptyVeh = _isVeh && count (crew _entity) == 0 && damage _entity > 0 && time - _time > _delAfter && !_isTurret;
		if (_isDeletable || _isEmptyVeh) then {
			
			/* Delete object and groundweaponholders */
			_gwhs = nearestObjects [_entity, ["groundweaponholder"], 10];
			if (count _gwhs > 0) then {
				{
					deleteVehicle _x;
				} forEach _gwhs;
			};
			deleteVehicle _entity;
		};
	};
};
