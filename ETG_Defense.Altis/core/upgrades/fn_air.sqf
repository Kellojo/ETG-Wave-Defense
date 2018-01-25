/*
	Filename: fn_air.sqf
	Author: Kellojo
	Description: handles the air support
*/
_mode = _this select 0;

//Unlocked
if (_mode == "Air_U") exitWith {
	{
		_x hideObjectGlobal false;
	} forEach [defense_airsupport_2,defense_airsupport_3,defense_airsupport_1,defense_airsupport];
	_txt = parseText localize "STR_NOTF_AirU";
	[_txt] remoteExec ["fn_hint", 0, false];
	[defense_airsupport_2,localize "STR_Action_RadarStation",{[0,"Support",false] call fn_UpgradeTerminal;}] remoteExec ["fn_addAction", 0, true];
};


if (_mode == "CAS") exitWith {
	[] spawn { 
		100 cutText [localize "STR_NOTF_AirMark","PLAIN DOWN",5]; 
		waitForCAS = true; 
		["CAS_pos_selection","onMapSingleClick","[_pos] spawn fn_cas;waitForCAS = false;"] call BIS_fnc_addStackedEventHandler; 
		waitUntil{!waitForCAS}; 
		["CAS_pos_selection","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler; 
	};
};

if (_mode == "Mortar") exitWith {
	[] spawn { 
		100 cutText [localize "STR_NOTF_AirMark","PLAIN DOWN",5]; 
		waitForMortar = true; 
		["Mortar_pos_selection","onMapSingleClick",{
			100 cutText [localize "STR_NOTF_AirStrikeIncoming","PLAIN DOWN",5]; 
			[_pos] spawn {
					sleep 15;
					"R_80mm_HE" createvehicle ([_this select 0, 1, 25, 3, 0, 20, 0] call BIS_fnc_findSafePos);
					sleep random 4;
					"R_80mm_HE" createvehicle ([_this select 0, 1, 25, 3, 0, 20, 0] call BIS_fnc_findSafePos);
					sleep random 4;
					"R_80mm_HE" createvehicle ([_this select 0, 1, 25, 3, 0, 20, 0] call BIS_fnc_findSafePos);
				};
				waitForMortar = false;
		}] call BIS_fnc_addStackedEventHandler; 
		waitUntil{!waitForMortar}; 
		["Mortar_pos_selection","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler; 
		100 cutText ["Mortar Strike incoming.","PLAIN DOWN",5]; 
	};
};

if (_mode == "Artillery") exitWith {
	[] spawn { 
		100 cutText [localize "STR_NOTF_AirMark","PLAIN DOWN",5]; 
		waitForArtillery = true; 
		["Artillery_pos_selection","onMapSingleClick",{
			100 cutText [localize "STR_NOTF_AirStrikeIncoming","PLAIN DOWN",5]; 
			[_pos] spawn {
				sleep 15;
				"Bomb_03_F" createvehicle ([_this select 0, 1, 35, 3, 0, 20, 0] call BIS_fnc_findSafePos);
				sleep random 5;
				"Bomb_03_F" createvehicle ([_this select 0, 1, 35, 3, 0, 20, 0] call BIS_fnc_findSafePos);
				sleep random 5;
				"Bomb_03_F" createvehicle ([_this select 0, 1, 35, 3, 0, 20, 0] call BIS_fnc_findSafePos);
				sleep random 5;
				"Bomb_03_F" createvehicle ([_this select 0, 1, 35, 3, 0, 20, 0] call BIS_fnc_findSafePos);
			};
			waitForArtillery = false;
		}] call BIS_fnc_addStackedEventHandler; 
		waitUntil{!waitForArtillery}; 
		["Artillery_pos_selection","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler; 
		100 cutText ["Artillery incoming.","PLAIN DOWN",5]; 
	};
};

if (_mode == "Supply") exitWith {
		100 cutText [localize "STR_NOTF_AirMark","PLAIN DOWN",5]; 
		waitForSupply = true; 
		["Supply_pos_selection","onMapSingleClick",{
			[_pos, "Supply"] spawn fn_supply;
			waitForSupply = false;
		}] call BIS_fnc_addStackedEventHandler; 
		
		waitUntil{!waitForSupply}; 
		["Supply_pos_selection","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler; 
		100 cutText [localize "STR_NOTF_AirSupplyIncoming","PLAIN DOWN",5]; 
		_txt = parseText localize "STR_NOTF_AirSupply";
		[_txt] remoteExec ["fn_hint", 0, false];
};

if (_mode == "UAV_Strike") exitWith {
	defense_uav = ([getMarkerPos "UAV_marker", 0, "B_T_UAV_03_F", WEST] call BIS_fnc_spawnVehicle) select 0;
	publicvariable "defense_uav";
	_txt = parseText localize "STR_NOTF_AirUAVSTrike";
	[_txt] remoteExec ["fn_hint", 0, false];
};

if (_mode == "Supply_stomper") exitWith {
	100 cutText [localize "STR_NOTF_AirMark","PLAIN DOWN",5]; 
	waitForSupply = true; 
	["Supply_pos_selection","onMapSingleClick",{
		[_pos, "Supply_stomper"] spawn fn_supply;
		waitForSupply = false;
	}] call BIS_fnc_addStackedEventHandler; 
	
	waitUntil{!waitForSupply}; 
	["Supply_pos_selection","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler; 
	100 cutText [localize "STR_NOTF_AirSupplyIncoming","PLAIN DOWN",5]; 
	_txt = parseText localize "STR_NOTF_AirSupplyStomper";
	[_txt] remoteExec ["fn_hint", 0, false];
};

