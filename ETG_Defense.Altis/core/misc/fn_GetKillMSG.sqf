/*
	Filename: fn_GetKillMSG.sqf
	Author: Kellojo
	Description: gets the text for the kill message
*/
private ["_enemy_count","_title","_txt"];
_arr = _this select 0;
_target = _arr select 0;
_killer = _arr select 1;
if (player != _killer && (isPlayer _killer) || _killer == objNull) exitWith {};
_assist = if !(isPlayer _killer) then {true} else {false};

//Get reward
_profit = 0;
_rBonus = 0;
_title = "ENEMY KILLED";
_rangebonus = "";
_enemy_count = [0, defense_att_Groups] call fn_group;
_left = format ["%1/%2",defense_att_main_group_scale - _enemy_count, defense_att_main_group_scale];

if (vehicle _target == _target) then {
	_profit = 5;
	
	if !(secondaryWeapon _target == "") then {
		_profit = 7;
		_title = "At/AA KILLED";
	};
	_pweap = primaryWeapon _target;
	if (_pweap isKindOf "GM6_base_F" || _pweap isKindOf "DMR_05_base_F" || _pweap isKindOf "DMR_01_base_F") then {
		_profit = 10;
		_title = "SNIPER KILLED";
	};
	if (player distance _target > 100) then {
		_rBonus =  round(( round (player distance _target)) / 100);
		_rangebonus = format ["%2M RANGEBONUS %1<br/>", _rBonus,round (player distance _target)];
	};

} else {
	if (typeOf vehicle _target in ["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F"]) then {
		_profit = 12;
		_title = "VEHICLE DESTROYED";
	};
	if (typeOf vehicle _target in ["O_MBT_02_cannon_F"]) then {
		_profit = 20;
		_title = "TANK DESTROYED";
	};
	if (typeOf vehicle _target in ["O_Heli_Light_02_v2_F","O_Heli_Light_02_F","O_Heli_Attack_02_black_F"]) then {
		_profit = 25;
		_title = "HELICOPTER DESTROYED";
	};
	if (typeOf vehicle _target in ["O_Boat_Armed_01_hmg_F","O_Lifeboat","O_Boat_Transport_01_F"]) then {
		_profit = 15;
		_title = "BOAT DESTROYED";
	};
};

_wText = [currentweapon _killer] call {
	_weapon = _this select 0;
	if (_weapon isKindOf ["Pistol", configFile >> "CfgWeapons"]) exitWith {["Pistol kill  4<br/>", 4]};
	if (_weapon isKindOf ["Launcher", configFile >> "CfgWeapons"]) exitWith {["Launcher kill  2<br/>", 2]};
	if (_weapon isKindOf ["Rifle_Long_Base_F", configFile >> "CfgWeapons"]) exitWith {["DMR/Sniper kill  2<br/>", 2]};
	if (_weapon isKindOf ["Rifle_Short_Base_F", configFile >> "CfgWeapons"]) exitWith {["SMG kill  3<br/>", 3]};
	if (_weapon isKindOf ["Rifle", configFile >> "CfgWeapons"]) exitWith {["Rifle kill  1<br/>", 1]};
	["Rifle kill  1<br/>", 1];
};


if (_assist) then {
	_profit = round (_profit / 2);
	if (typeOf _killer in ["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F"]) then {_txt = "TURRET KILL ASSIST";};
	if (isNull _killer) then {_txt = "AIR STRIKE ASSIST";};
	if (isNil "_txt") then {_txt = "KILL ASSIST";};
	_title = _txt;
	_rBonus = 0;
	_rangebonus = "";
	_wText = ["", 0];
	defense_assists = defense_assists + 1;
} else {
	defense_kills = defense_kills + 1;
};



_reward = _profit + _rBonus + (_wText select 1);
_str = format [
	"<t font='PuristaLight'align='right' shadow ='false'>
		<t size ='1.25' color='#ffff00'>%1  %2</t><br/>
		" + _rangebonus + (_wText select 0) + "
		Ai killed: %3<br/>
		<t color='#97FA21'>+%4</t>
	</t>",_title,_profit,_left,_reward
];


//Workaround stuff
//Complete wave when there are no enemies left
if (([0, defense_att_Groups] call fn_group) == 0) then {
	defense_wave_complete = true;
	publicVariable "defense_wave_complete";
};

[_str,_reward];

