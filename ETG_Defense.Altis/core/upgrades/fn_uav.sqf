/*
	Filename: fn_uav.sqf
	Author: Kellojo
	Description: handles the uav markers
*/

defense_uav_active = true;
[] spawn {
	sleep 120;
	defense_uav_active = false;
	{
		deleteMarker _x;
	} forEach defense_uav_markers;
};

defense_uav_markers = [];

while {defense_uav_active} do {
	if (count defense_uav_markers != 0) then {
		{
			deleteMarker _x;
		} forEach defense_uav_markers;
	};
	{
		if (side _x == opfor) then {
			_marker = createMarker [str _x, position _x];
			_marker setMarkerText "";
			_marker setMarkerColor "ColorOPFOR";
			_marker setMarkerType "selector_selectedEnemy";
			defense_uav_markers pushback _marker;
		};	
	} forEach allUnits;
	uisleep 5;
};
