/*
	Filename: fn_sector.sqf
	Author: Kellojo
	Description: handles the sector
*/


while {true} do {
	if (defense_base_under_attack && defense_tickets > 0) then {
		_txt = parseText format [localize "STR_Tickets",defense_tickets];
		[_txt] remoteExec ["fn_hint", 0, false];
		defense_tickets = defense_tickets - 1;
		publicVariable "defense_tickets";
	};
	
	if (defense_tickets <= 0 && !defense_end) then {
		defense_end = true;
		[] remoteExec ["fn_end", 0, false];
	};
	uisleep 1;
};