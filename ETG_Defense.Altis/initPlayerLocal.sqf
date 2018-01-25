//actions
UpgradeTerminal AddAction [localize "STR_Action_UpgradeTerminal", {[0, "Upgrades", false] call fn_UpgradeTerminal;}];
VehicleScrapper AddAction [localize "STR_Action_VehicleScrapper", {[0] call fn_VehicleScrapper;}];
defense_highscore AddAction [localize "STR_Action_Highscoore", {[0] call fn_highscore;}];


//vars
defense_kills = 0;
defense_assists = 0;


//event handler
player addEventHandler ["Respawn",{[_this select 0,_this select 1] spawn fn_revive}];


//HUD
[0] remoteExec ["fn_jip", 2, false];


//Key down
waituntil {!(IsNull (findDisplay 46))};
_keyDown = findDisplay 46 displayAddEventHandler ["KeyDown", {_this call fn_keyhandler;}];


//perk vars = false
_entries = "true" configClasses (missionConfigFile >> "Perks");
{
	_var = (_x >> "varname")  call BIS_fnc_getCfgData;
	if (_var != "") then {
		[] call compile (_var + " = false;");
	};
} forEach _entries;

//3D Marker
addMissionEventHandler ["Draw3D", {
	drawIcon3D ["", [0.59,0.98,0.13,1], position UpgradeTerminal, 0, 0, 0, localize "STR_UpgradeTerminal", 1, 0.05, "PuristaMedium"];
	drawIcon3D ["", [0.59,0.98,0.13,1], position VehicleScrapper, 0, 0, 0, localize "STR_VehicleScrapper", 1, 0.05, "PuristaMedium"];
	if (defense_upgrade_arsenal_u) then {drawIcon3D ["", [0.59,0.98,0.13,1], position defense_arsenal_ammobox, 0, 0, 0, localize "STR_Arsenal", 1, 0.05, "PuristaMedium"];};
	if (defense_upgrade_air) then {drawIcon3D ["", [0.59,0.98,0.13,1], position defense_airsupport, 0, 0, 0, localize "STR_AirSupportTerminal", 1, 0.05, "PuristaMedium"];};
	if (defense_upgrade_perk) then {drawIcon3D ["", [0.59,0.98,0.13,1], position defense_perkTerminal, 0, 0, 0, localize "STR_PerkTerminal", 1, 0.05, "PuristaMedium"];};
}];


//player gear & HUD
[] spawn fn_MainHUD;
[] spawn fn_spawnGear;