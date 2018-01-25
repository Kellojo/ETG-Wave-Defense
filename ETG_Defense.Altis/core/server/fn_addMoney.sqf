/*
	Filename: fn_addMoney.sqf
	Author: Kellojo
	Description: adds money
*/
_mode = _this select 0;
_reward = _this select 1;
if (isNil "_reward" || isNil "_mode") exitWith {};


//remove money
if (_mode == 0) then {
	defense_money = defense_money - _reward;
	publicVariable "defense_money";
};

//add money
if (_mode == 1) then {
	defense_money = defense_money + _reward;
	publicVariable "defense_money";
};