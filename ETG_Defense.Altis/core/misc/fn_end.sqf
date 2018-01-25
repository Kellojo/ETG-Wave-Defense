/*
	Filename: fn_end.sqf
	Author: Kellojo
	Description: handles the end & Highscoore management... (client side)
*/

player allowDamage false;
//Save Stats
_stats = [];
_stats pushback defense_wave;
_stats pushback defense_money;
_stats pushback defense_kills;
_stats pushback defense_assists;
_stats pushback time;
_stats pushback defense_upgrade_arsenal_u;
_stats pushback defense_upgrade_arsenal_1;
_stats pushback defense_upgrade_arsenal_2;
_stats pushback defense_upgrade_arsenal_3;
_stats pushback defense_upgrade_arsenal_4;
_stats pushback defense_upgrade_arsenal_5;
_stats pushback defense_upgrade_arsenal_6;
_stats pushback defense_upgrade_arsenal_7;
_stats pushback defense_upgrade_air;
_stats pushback defense_upgrade_wall_v1;
_stats pushback defense_upgrade_wall_v2;
_stats pushback defense_upgrade_wall_v3;
_stats pushback defense_upgrade_turret_1;
_stats pushback defense_upgrade_turret_2;
_stats pushback defense_upgrade_turret_3;
_stats pushback defense_upgrade_perk;

_camera = "camera" camCreate [position player select 0,position player select 1,3];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 0.700;
_camera camCommit 0;
showCinemaBorder false;	

_camera camSetTarget player;
_camera camSetRelPos [-2,0,5];
_camera camCommit 2;
sleep 2;

//Create round stats hud and fill it...
12 cutRsc ["ETG_End_Stats","PLAIN"];
disableSerialization;
_disp = uiNamespace getVariable "ETG_End_Stats";
_ctrl_1 = _disp displayCtrl 4001;

if ((profilenamespace getVariable ["ETG_Defense_Mission_Highscore", [0]] select 0) <= defense_wave) then {
	profilenamespace setVariable ["ETG_Defense_Mission_Highscore", _stats];
	saveProfileNamespace;
	
	_ctrl_1 ctrlSetStructuredText parseText format [
	"<t color='#97FA21'><t size='2.2'>Round Stats:<br/></t></t><t align='left'><br/>
	<t color='#97FA21'><t size='1'>Waves survived:</t></t> %1<br/>
	<t color='#97FA21'><t size='1'>Money:</t></t> %2<br/>
	<t color='#97FA21'><t size='1'>Kills:</t></t> %3<br/>
	<t color='#97FA21'><t size='1'>Assists:</t></t> %4<br/>
	<t color='#97FA21'><t size='1'>Time survived:</t></t> %5<br/>
	<t color='#97FA21'><t size='1'>Arsenal Unlock:</t></t> %6<br/>
	<t color='#97FA21'><t size='1'>Arsenal Tier 1:</t></t> %7<br/>
	<t color='#97FA21'><t size='1'>Arsenal Tier 2:</t></t> %8<br/>
	<t color='#97FA21'><t size='1'>Arsenal Tier 3:</t></t> %9<br/>
	<t color='#97FA21'><t size='1'>Arsenal Tier 4:</t></t> %10<br/>
	<t color='#97FA21'><t size='1'>Arsenal (Sniper):</t></t> %11<br/>
	<t color='#97FA21'><t size='1'>Arsenal (MG):</t></t> %12<br/>
	<t color='#97FA21'><t size='1'>Arsenal (Spec Ops):</t></t> %13<br/>
	<t color='#97FA21'><t size='1'>Radar Upgrade:</t></t> %14<br/>
	<t color='#97FA21'><t size='1'>Wall v1 Upgrade:</t></t> %15<br/>
	<t color='#97FA21'><t size='1'>Wall v2 Upgrade:</t></t> %16<br/>
	<t color='#97FA21'><t size='1'>Roof Upgrade:</t></t> %17<br/>
	<t color='#97FA21'><t size='1'>Turrets .50 Upgrade:</t></t> %18<br/>
	<t color='#97FA21'><t size='1'>Turrets AT Upgrade:</t></t> %19<br/>
	<t color='#97FA21'><t size='1'>Turrets AA Upgrade:</t></t> %20<br/>
	<t color='#97FA21'><t size='1'>Perk Terminal:</t></t> %21<br/>
	</t>",defense_wave,defense_money,defense_kills,defense_assists,time,defense_upgrade_arsenal_u,defense_upgrade_arsenal_1,defense_upgrade_arsenal_2,defense_upgrade_arsenal_3,defense_upgrade_arsenal_4,defense_upgrade_arsenal_5,defense_upgrade_arsenal_6,defense_upgrade_arsenal_7,defense_upgrade_air,defense_upgrade_wall_v1,defense_upgrade_wall_v2,defense_upgrade_wall_v3,defense_upgrade_turret_1,defense_upgrade_turret_2,defense_upgrade_turret_3,defense_upgrade_perk];
} else {
	_ctrl_1 ctrlSetStructuredText parseText format [
	"<t color='#97FA21'><t size='2.2'>New Highscore:<br/></t></t><t align='left'><br/>
	<t color='#97FA21'><t size='1'>Waves survived:</t></t> %1<br/>
	<t color='#97FA21'><t size='1'>Money:</t></t> %2<br/>
	<t color='#97FA21'><t size='1'>Kills:</t></t> %3<br/>
	<t color='#97FA21'><t size='1'>Assists:</t></t> %4<br/>
	<t color='#97FA21'><t size='1'>Time survived:</t></t> %5<br/>
	<t color='#97FA21'><t size='1'>Arsenal Unlock:</t></t> %6<br/>
	<t color='#97FA21'><t size='1'>Arsenal Tier 1:</t></t> %7<br/>
	<t color='#97FA21'><t size='1'>Arsenal Tier 2:</t></t> %8<br/>
	<t color='#97FA21'><t size='1'>Arsenal Tier 3:</t></t> %9<br/>
	<t color='#97FA21'><t size='1'>Arsenal Tier 4:</t></t> %10<br/>
	<t color='#97FA21'><t size='1'>Arsenal (Sniper):</t></t> %11<br/>
	<t color='#97FA21'><t size='1'>Arsenal (MG):</t></t> %12<br/>
	<t color='#97FA21'><t size='1'>Arsenal (Spec Ops):</t></t> %13<br/>
	<t color='#97FA21'><t size='1'>Radar Upgrade:</t></t> %14<br/>
	<t color='#97FA21'><t size='1'>Wall v1 Upgrade:</t></t> %15<br/>
	<t color='#97FA21'><t size='1'>Wall v2 Upgrade:</t></t> %16<br/>
	<t color='#97FA21'><t size='1'>Roof Upgrade:</t></t> %17<br/>
	<t color='#97FA21'><t size='1'>Turrets .50 Upgrade:</t></t> %18<br/>
	<t color='#97FA21'><t size='1'>Turrets AT Upgrade:</t></t> %19<br/>
	<t color='#97FA21'><t size='1'>Turrets AA Upgrade:</t></t> %20<br/>
	<t color='#97FA21'><t size='1'>Perk Terminal:</t></t> %21<br/>
	</t>",defense_wave,defense_money,defense_kills,defense_assists,time,defense_upgrade_arsenal_u,defense_upgrade_arsenal_1,defense_upgrade_arsenal_2,defense_upgrade_arsenal_3,defense_upgrade_arsenal_4,defense_upgrade_arsenal_5,defense_upgrade_arsenal_6,defense_upgrade_arsenal_7,defense_upgrade_air,defense_upgrade_wall_v1,defense_upgrade_wall_v2,defense_upgrade_wall_v3,defense_upgrade_turret_1,defense_upgrade_turret_2,defense_upgrade_turret_3,defense_upgrade_perk];
};

_camera camSetTarget player;
_camera camSetPos [28254.4,25726.2,15.3976];
_camera camCommit 10;
sleep 10;

_camera camSetTarget player;
_camera camSetPos [28488.2,25685.9,2.60886];
_camera camCommit 10;
sleep 10;

_camera camSetTarget player;
_camera camSetPos [28607.2,25769.8,13.6098];
_camera camCommit 10;
sleep 10;

[] remoteExec ["fn_end_server", 2, false];
