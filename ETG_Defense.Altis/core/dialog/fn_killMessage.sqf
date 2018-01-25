/*
	Filename: fn_KillMessage.sqf
	Author: Kellojo
	Description: main function for the kill message
*/

_killMessage = _this select 0;
if !(isNil "_killMessage" || _killMessage == "") then {
	[
		parseText _killMessage, 
		[0.613437 * safezoneW + safezoneX,
		0.643 * safezoneH + safezoneY,
		0.221719 * safezoneW,
		0.132 * safezoneH],
		nil, 
		5,
		0.8,
		0
	] spawn BIS_fnc_textTiles;
};