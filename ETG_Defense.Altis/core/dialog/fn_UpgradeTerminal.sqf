/*
	Filename: fn_Upgradeterminal.sqf
	Author: Kellojo
	Description: handles the upgrade terminal
*/

_mode = _this select 0;
_diag = _this select 1;
_mp = _this select 2;
disableSerialization;

//setup
if (_mode == 0) exitWith {
	if (isNull findDisplay 2000 && !_mp) then {
		_dialog = (missionConfigFile >> _diag >> "dialog") call BIS_fnc_getCfgData;
		createdialog _dialog;
	};

	_entries = "true" configClasses (missionConfigFile >> _diag);
	{
		_title = (_x >> "title") call BIS_fnc_getCfgData;
		_data = configName _x;
		_condition = (_x >> "condition") call BIS_fnc_getCfgData;
		
		if ([] call compile _condition) then {
			_cur = lbAdd [2001, localize _title];
			lbSetData [2001, _cur, _data];
		};
	} forEach _entries;
};


//lb sel change
if (_mode == 1) exitWith {	
	if (isNull findDisplay 2000) exitWith {};
	_text = findDisplay 2000 displayCtrl 2002;
	_upgrade = _this select 2;
	
	_description = (missionConfigFile >> _diag >> _upgrade >> "description") call BIS_fnc_getCfgData;
	
	_price = if(count (allPlayers - entities "HeadlessClient_F") > 1) then {
		((missionConfigFile >> _diag >> _upgrade >> "price")  call BIS_fnc_getCfgData) * ln count (allPlayers - entities "HeadlessClient_F")
	} else {
		(missionConfigFile >> _diag >> _upgrade >> "price")  call BIS_fnc_getCfgData
	};

	if (isNil "_upgrade") then {
		_description = "";
		_price = "";
	};
	_text ctrlSetStructuredText parseText format [localize _description,floor _price];
};