/*
	Filename: fn_group.sqf
	Author: Kellojo
	Description: Misc functions related to groups
*/


_mode = _this select 0;
if (isNil "_mode") exitWith {};


//return all units that are alive in a given array of groups
if (_mode == 0) exitWith {
	_cntr = 0;
	_groups = _this select 1;
	
	{
		_group = _x;
		{
			if (alive _x) then {
				_cntr = _cntr + 1;
			};
		}	forEach units _group;
	} forEach _groups;
	_cntr
};


//set fleeing to 0 and add killed event hndlers to units
//used to spawn waves...
if (_mode == 1) exitWith {
	_groups = _this select 1;
	{
		_group = _x;
		_group allowFleeing 0;
		{
			_x addMPEventHandler ["MPKilled", {[_this] call fn_onAIKilled;}];
			_x disableAI "SUPPRESSION";
			_x allowDammage true;
		} forEach units _group;
	} forEach _groups;
};


//create and save group
if (_mode == 2) exitWith {
	_grp = createGroup east;
	defense_att_Groups pushBack _grp;
	_grp
};


//set group waypoints (to the bluefor base) for every group
if (_mode == 3) exitWith {
	_groups = _this select 1;
	
	{
		_wp = _x addWaypoint [getMarkerPos "bluefor_base_AI_wp", 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "FULL";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointCompletionRadius 15;
		_wp = _x addWaypoint [getMarkerPos "bluefor_base_AI_wp", 1];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "FULL";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointCompletionRadius 15;
		//_wp setWaypointFormation "STAG COLUMN";
		_x setCurrentWaypoint _wp;
	} forEach _groups;
};


//delete group units
if (_mode == 4) exitWith {
	_groups = _this select 1;
	
	{
		_group = _x;
		{
			deleteVehicle _x;
		} forEach units _group;
	} forEach _groups;
};


//delete groups and reset var
if (_mode == 5) exitWith {
	_groups = _this select 1;
	[4,_groups] call fn_group;
	
	{
		deleteGroup _x;
	} forEach _groups;
	defense_att_Groups = [];
	publicvariable "defense_att_Groups";
};

