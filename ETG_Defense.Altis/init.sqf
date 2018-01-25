//Server scripts
//fn_waves = compile preprocessFile "core\server\fn_waves.sqf";
fn_spawnWaves = compile preprocessFile "core\server\eds\fn_spawnWave.sqf";
fn_getDifficulty = compile preprocessFile "core\server\eds\fn_getDifficulty.sqf";
fn_addMoney = compile preprocessFile "core\server\fn_addMoney.sqf";
fn_sector = compile preprocessFile "core\server\fn_sector.sqf";
fn_end_server = compile preprocessFile "core\server\fn_end_server.sqf";

//core scripts
fn_onAIKilled = compile preprocessFile "core\fn_onAIKilled.sqf";
fn_useUpgrade = compile preprocessFile "core\fn_useUpgrade.sqf";
fn_keyhandler = compile preprocessFile "core\fn_keyhandler.sqf";
fn_jip = compile preprocessFile "core\fn_jip.sqf";

//Misc scripts
fn_spawnGear = compile preprocessFile "core\misc\fn_spawnGear.sqf";
fn_VehicleScrapper = compile preprocessFile "core\misc\fn_VehicleScrapper.sqf";
fn_revive = compile preprocessFile "core\misc\fn_respawn.sqf";
fn_end = compile preprocessFile "core\misc\fn_end.sqf";
fn_hint = compile preprocessFile "core\misc\fn_hint.sqf";
fn_addAction = compile preprocessFile "core\misc\fn_addAction.sqf";
fn_highscore = compile preprocessFile "core\misc\fn_highscore.sqf";
fn_intro = compile preprocessFile "core\misc\fn_intro.sqf";
fn_GetKillMSG = compile preprocessFile "core\misc\fn_GetKillMSG.sqf";
fn_cleanUp = compile preprocessFile "core\misc\fn_cleanUp.sqf";
fn_group = compile preprocessFile "core\misc\fn_group.sqf";

//Dialog scripts
fn_MainHUD = compile preprocessFile "core\dialog\fn_MainHUD.sqf";
fn_KillMessage = compile preprocessFile "core\dialog\fn_KillMessage.sqf";
fn_UpgradeTerminal = compile preprocessFile "core\dialog\fn_UpgradeTerminal.sqf";

//Upgrade scripts
fn_arsenal = compile preprocessFile "core\upgrades\fn_arsenal.sqf";
fn_wall = compile preprocessFile "core\upgrades\fn_wall.sqf";
fn_air = compile preprocessFile "core\upgrades\fn_air.sqf";
fn_rearmTurrets = compile preprocessFile "core\upgrades\fn_rearmTurrets.sqf";
fn_cas = compile preprocessFile "core\upgrades\fn_cas.sqf";
fn_supply = compile preprocessFile "core\upgrades\fn_supply.sqf";
fn_uav = compile preprocessFile "core\upgrades\fn_uav.sqf";
fn_perks = compile preprocessFile "core\upgrades\fn_perks.sqf";

//Debug
defense_debug = 0;

//Setup
defense_wave = 1;
defense_enemies = 0;
defense_money = 0;
defense_tickets = ["Tickets", 2] call BIS_fnc_getParamValue;
defense_startingTickets = defense_tickets;
defense_respawn_counter = 0;
defense_perk_gearsafe_counter = 0;
player_loadout = [];

defense_end = false;
defense_insertion = false;
defense_end_server = false;
defense_wave_complete = false;
defense_base_under_attack = false;

defense_player_spawngear = (missionConfigFile >> "Main" >> "default_gear") call BIS_fnc_getCfgData;
defense_turrets = [Turret_V3_1,Turret_V3_2,Turret_V2_1,Turret_V2_2,Turret_V1_1,Turret_V1_2];
defense_uav = objNull;
ETG_cleanUPVehs = [];
defense_att_Groups = [];
defense_att_main_group_scale = 0;


//Setup Upgrade vars = false
_lfv = (missionConfigFile >> "Main" >> "lookForVars")  call BIS_fnc_getCfgData;
{
	_entries = "true" configClasses (missionConfigFile >> _x);
	{
		_var = (_x >> "varname")  call BIS_fnc_getCfgData;
		if (_var != "") then {
			[] call compile (_var + " = false;");
		};
	} forEach _entries;
} forEach _lfv;


//Hide objects
{_x hideObjectGlobal true;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_Wall_Tin_4"], 200];
{_x hideObjectGlobal true;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_BagFence_Long_F"], 200];
{_x hideObjectGlobal true;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_HBarrierWall6_F"], 200];
{_x hideObjectGlobal true;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_HBarrierWall4_F"], 200];
{_x hideObjectGlobal true;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_HBarrierWall_corner_F"], 200];
{_x hideObjectGlobal true;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_BagFence_Round_F"], 200];
{_x hideObjectGlobal true;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_Cargo_Patrol_V1_F"], 200];
defense_perkTerminal hideObjectGlobal true;

//barracks & lighthouse...
{_x allowDamage false;} forEach nearestObjects [getMarkerPos "bluefor_base_AI_wp", ["Land_i_Barracks_V1_F","Land_LightHouse_F"], 200];

//Start
[] call fn_intro;
if (isServer) then {
	[] spawn fn_sector;
	waituntil {defense_insertion};
	[0] call fn_spawnWaves;
	[1] spawn fn_spawnWaves;
	[1] call fn_cleanUp;
};
