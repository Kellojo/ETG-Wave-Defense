/*
	Filename:		fn_respawn.sqf
	Author:			Kellojo
	Description:	Handles the respawn (Gear management...)
*/
private ["_new","_corpse","_loadout"];

_new = _this select 0;
_corpse = _this select 1;
_loadout = getUnitLoadout player;
if (count player_loadout == 0) then {
	player_loadout = _loadout;
};
if (defense_respawn_counter == 0) then {
	defense_respawn_counter = 2;
};

//poor workarounds
defense_tickets = defense_tickets - 1;
defense_respawn_counter = defense_respawn_counter - 1;
publicvariable "defense_tickets";

//Set player gear
if (defense_perk_gearsafe) then {
	deletevehicle _corpse;
	player setUnitLoadout player_loadout;
	defense_perk_gearsafe_counter = defense_perk_gearsafe_counter - 1;
} else {
	//if (defense_respawn_counter == 0) then {
		[] call fn_spawnGear;
	//};
};

//Perk reset
if (defense_perk_gearsafe_counter == 0) then {
	defense_perk_gearsafe = false;
	player_loadout = [];
};

defense_perk_heal = false;
defense_perk_mechanic = false;
defense_perk_fatigue = false;
