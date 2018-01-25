/*
	Filename: fn_jip.sqf
	Author: Kellojo
	Description: main function for jip clients
*/
_mode = _this select 0;
if (isNil "_mode") exitWith {};

//send vars
if (_mode == 0) then {
	publicvariable "defense_wave";
	publicvariable "defense_money";
	publicvariable "defense_tickets";
	publicvariable "defense_startingTickets";
	publicvariable "defense_att_main_group_scale";
	publicvariable "defense_att_Groups";

	publicvariable "defense_uav";

	publicvariable "defense_upgrade_arsenal_u";
	publicvariable "defense_upgrade_arsenal_1";
	publicvariable "defense_upgrade_arsenal_2";
	publicvariable "defense_upgrade_arsenal_3";
	publicvariable "defense_upgrade_arsenal_4";
	publicvariable "defense_upgrade_arsenal_5";
	publicvariable "defense_upgrade_arsenal_6";
	publicvariable "defense_upgrade_arsenal_7";
	publicvariable "defense_upgrade_air";
	publicvariable "defense_upgrade_wall_v1";
	publicvariable "defense_upgrade_wall_v2";
	publicvariable "defense_upgrade_wall_v3";
	publicvariable "defense_upgrade_wall_v4";
	publicvariable "defense_upgrade_wall_v5";

	publicvariable "defense_upgrade_turret_1";
	publicvariable "defense_upgrade_turret_2";
	publicvariable "defense_upgrade_turret_3";
	publicvariable "defense_upgrade_perk";
};




