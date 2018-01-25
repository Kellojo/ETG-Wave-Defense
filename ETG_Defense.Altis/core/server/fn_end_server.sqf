/*
	Filename: fn_end_server.sqf
	Author: Kellojo
	Description: handles the end (server side)
*/

if !(defense_end_server) then {
	defense_end_server = true;
	"Lost" call BIS_fnc_endMissionServer;
};