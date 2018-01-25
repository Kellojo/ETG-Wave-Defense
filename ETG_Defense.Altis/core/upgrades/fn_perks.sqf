/*
	Filename: fn_perks.sqf
	Author: Kellojo
	Description: executes code for the given perk
*/

_mode = _this select 0;
if (isNil "_mode") exitWith {};

//unlock
if (_mode == "Perk_u") then {
	defense_perkTerminal hideObjectGlobal false;
	[defense_perkTerminal,localize "STR_Action_PerkTerminal",{[0,"Perks",false] call fn_UpgradeTerminal;}] remoteExec ["fn_addAction", 0, true];
	
	_txt = parseText "<t color='#97FA21'><t size='2.2'>Bought: Perk Terminal<br/></t></t>Congratulations!<br/>You can now access the perk terminal.";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//gear safe
if (_mode == "Perk_GearSafe") then {
	defense_perk_gearsafe = true;
	defense_perk_gearsafe_counter = 2;
	hint parseText "<t color='#97FA21'><t size='2.2'>Bought: Perk Gear Safe<br/></t></t>Congratulations!<br/>Your gear will now be safed after death.";
};

//passive heal
if (_mode == "Perk_PassiveHeal") then {
	defense_perk_heal = true;
	[] spawn {
		while {defense_perk_heal} do {
			_dmg = getDammage player;
			if !(_dmg == 0) then {
				player setDammage (_dmg - 0.05);
			};
			uisleep 2.5;
		};
	};
	
	hint parseText "<t color='#97FA21'><t size='2.2'>Bought: Passive Heal<br/></t></t>Congratulations!<br/>You are going to heal passively (5% every 5s).";
};

//mechanic
if (_mode == "Perk_Mechanic") then {
	defense_perk_mechanic = true;
	
	hint parseText "<t color='#97FA21'><t size='2.2'>Bought: Mechanic<br/></t></t>Congratulations!<br/>You can now repair one vehicle (Hotkey: 'H').";
};

//fatigue
if (_mode == "Perk_Fatigue") then {
	defense_perk_fatigue = true;

	hint parseText "<t color='#97FA21'><t size='2.2'>Bought: Fatigue<br/></t></t>Congratulations!<br/>You can run without fatigue for four minutes.";
	[] spawn {
		player enableFatigue false;
		uisleep 240;
		defense_perk_fatigue = false;
		player enableFatigue true;
	};
};