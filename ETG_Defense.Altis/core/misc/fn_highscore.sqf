/*
	Filename: fn_highscore.sqf
	Author: Kellojo
	Description: handles the highscore terminal
*/

_mode = _this select 0;

if (_mode == 0) exitWith {

	if ((profilenamespace getVariable ["ETG_Defense_Mission_Highscore", [0]] select 0) != 0) then {
		_stats = profilenamespace getVariable ["ETG_Defense_Mission_Highscore", [0]];
		hint parseText format ["
		<t color='#97FA21'><t size='2.2'>Round Stats:<br/></t></t><t align='left'><br/>
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
		</t>",_stats select 0,_stats select 1,_stats select 2,_stats select 3,_stats select 4,_stats select 5,_stats select 6,_stats select 7,_stats select 8,_stats select 9,_stats select 10,_stats select 11,_stats select 12,_stats select 13,_stats select 14,_stats select 15,_stats select 16,_stats select 17,_stats select 18,_stats select 19,_stats select 20];
	};
};

