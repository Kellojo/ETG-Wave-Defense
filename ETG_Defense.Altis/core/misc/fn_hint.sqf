/*
	Filename: fn_hint.sqf
	Author: Kellojo
	Description: hints given text on client
*/

_txt = _this select 0;
if (isNil "_txt") exitWith {};

hint _txt;