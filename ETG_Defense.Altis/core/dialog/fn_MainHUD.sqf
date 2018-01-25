/*
	Filename: fn_MainHUD.sqf
	Author: Kellojo
	Description: main function for HUD
*/

11 cutRsc ["ETG_Main_HUD","PLAIN"];
disableSerialization;
_disp = uiNamespace getVariable "ETG_Main_HUD";

_stxt = _disp displayCtrl 1100;
_pbTickets = _disp displayCtrl 1600;
_pbAlive = _disp displayCtrl 1601;
_pbHealth = _disp displayCtrl 1602;

_txtpbTickets = _disp displayCtrl 1000;
_txtpbAlive = _disp displayCtrl 1002;
_txtpbHealth = _disp displayCtrl 1001;

while {true} do {
	_50 = ".50:<t align='right'>ok</t>";
	_aa = "AA:<t align='right'>ok</t><br/>";
	_at = "AT:<t align='right'>ok</t><br/>";
	
	_alive = [0,defense_att_Groups] call fn_group;
	_pbAliveProg = 	if (defense_att_main_group_scale > 0) then {_alive / defense_att_main_group_scale} else {1};
	
	_pbAlive progressSetPosition _pbAliveProg;
	_pbTickets progressSetPosition (defense_tickets / defense_startingTickets);
	_pbHealth progressSetPosition 1 - (damage player);
	
	_txtpbTickets ctrlSetStructuredText parseText format["<t align='center'>Tickets %1</t>",defense_tickets];
	_txtpbAlive ctrlSetStructuredText parseText format["<t align='center'>Alive %1</t>",_alive];
	_txtpbHealth ctrlSetStructuredText parseText format["<t align='center'>Health %1</t>",floor ((1 - (damage player)) * 100)];
	
	_base = format ["<br/><br/><br/>Wave:<t align='right'>%1</t><br/>Money:<t align='right' color='#49A35B'>%2</t><br/>Kills:<t align='right'>%3</t><br/>",defense_wave,defense_money,defense_kills];
	_stxt ctrlSetStructuredText parseText _base;
	uisleep 0.2;
};
