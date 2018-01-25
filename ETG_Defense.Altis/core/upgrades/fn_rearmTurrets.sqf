/*
	Filename: fn_rearmTurrets.sqf
	Author: Kellojo
	Description: rearms and repairs the turrets
*/
private ["_allowed"];
_allowed = [];
if (!defense_upgrade_turret_1 && !defense_upgrade_turret_2 && !defense_upgrade_turret_3) exitWith {};
if (defense_upgrade_turret_1) then {
	_allowed pushback "B_HMG_01_high_F";
};

if (defense_upgrade_turret_2) then {
	_allowed pushback "B_static_AA_F";
};

if (defense_upgrade_turret_3) then {
	_allowed pushback "B_static_AT_F";
};

_turrets = [];
{
	_class = typeOf _x;
	if (_class in _allowed) then {
		//_pos = getPosATL _x;
		_obj = _x getVariable ["attObj", Objnull];
		_dir = getDir _x;
		deletevehicle gunner _x;
		deletevehicle _x;
		
		_turr = _class createVehicle [0,0,1.5];
		
		_offset = switch (_class) do {
			case "B_HMG_01_high_F": {[0,0,1.7]};
			default {[0,0,1]};
		};
		
		_turr setVariable ["attObj", _obj, true];
		_turr attachTo [_obj, _offset];
		_turr setDir _dir;
		_turr setVectorUp surfaceNormal position _turr;
		createVehicleCrew _turr;
		_turrets pushback _turr;
	
		gunner _turr allowDamage false;
		gunner _turr enableSimulation false;
		gunner _turr hideObjectGlobal true;
		gunner _turr disableAI "PATH";
		gunner _turr disableAI "MOVE";
		gunner _turr disableAI "FSM";
		gunner _turr disableAI "AIMINGERROR";
		gunner _turr disableAI "SUPPRESSION";
		gunner _turr setskill ["aimingAccuracy",1];
		gunner _turr setskill ["aimingSpeed",1];
		gunner _turr setskill ["spotTime",1];
		gunner _turr setskill ["spotDistance",1];
		_turr setVehicleAmmo 1;
		_turr setDamage 0;
	};
} forEach defense_turrets;
defense_turrets = _turrets;
_txt = parseText "<t color='#97FA21'><t size='2.2'>Turret Maintenance<br/></t></t>Successfully rearmed and repaird your turrets.";
[_txt] remoteExec ["fn_hint", 0, false];