/*
	Filename: fn_useUpgrade.sqf
	Author: Kellojo
	Description: executes code for the given upgrade
*/

_upgrade = _this select 0;
_type = _this select 1;

_varname = (missionConfigFile >> _type >> _upgrade >> "varname")  call BIS_fnc_getCfgData;
_function = (missionConfigFile >> _type >> _upgrade >> "function")  call BIS_fnc_getCfgData;
_onServer = (missionConfigFile >> _type >> _upgrade >> "onServer")  call BIS_fnc_getCfgData;


_price = if(count (allPlayers - entities "HeadlessClient_F") > 1) then {
	((missionConfigFile >> _type >> _upgrade >> "price")  call BIS_fnc_getCfgData) * ln count (allPlayers - entities "HeadlessClient_F")
} else {
	(missionConfigFile >> _type >> _upgrade >> "price")  call BIS_fnc_getCfgData
};
_price = floor _price;

//Filter bad data
if (isNil "_varname" || isNil "_function" || isNil "_price" || isNil "_onServer") exitWith {};
//_canBuy = if (_varname == "") then {true;} else {!([] call compile format['%1',_return select 0])};

//Buy stuff
if (defense_money >= _price) then {
	//set var, remove money,exec script
	if (_varname != "") then {
		[] call compile (_varname + " = true;");
		[] call compile format['publicVariable "%1"',_varname];
	}; 
	if (_onServer == "true") then {
		[_upgrade] remoteExec [ _function, 2, false];
	} else {
		[_upgrade] spawn ([] call compile format['%1', _function]);
	};
	[0, _price] remoteExec ["fn_addMoney", 2, false];
	
	//refresh lb
	lbClear 2001;
	[0,_this select 1,true] remoteExec ["fn_UpgradeTerminal", 0, false];
	[_type] spawn {
		sleep 0.1;
		[1, _this select 0,lbData [2001, lbCurSel 2001],false] remoteExec ["fn_UpgradeTerminal", 0, false];
	};
} else {
	hint "You do not have enough money.";
};

