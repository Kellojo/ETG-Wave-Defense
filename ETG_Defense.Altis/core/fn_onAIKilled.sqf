/*
	Filename: fn_onAIKilled.sqf
	Author: Kellojo
	Description: main function for the kill reward
*/

private ["_target","_killer","_ret"];
_target = _this select 0;
_killer = _this select 1;

//display kill msg
_ret = [_target,_killer] call fn_GetKillMSG;

[_ret select 0] call fn_KillMessage;
[1,_ret select 1] remoteExec ["fn_addMoney", 2, false];

