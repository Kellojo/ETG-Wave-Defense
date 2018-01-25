/*
	Filename: fn_AddAction.sqf
	Author: Kellojo
	Description: adds actions on client
*/

_veh = _this select 0;
_txt = _this select 1;
_script = _this select 2;
if (isNil "_veh"|| isNil "_txt"|| isNil "_script") exitWith {};

_veh addAction [_txt,_script];