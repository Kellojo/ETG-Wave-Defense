/*
	Filename: fn_keyhandler.sqf
	Author: Kellojo
	Description: main function for the "keydown" event
*/

_key = _this select 1;
_ctrl = _this select 3;
_shift = _this select 2;
_alt = _this select 4;
_handled = false;

_interactionKey = if (count (actionKeys "User1") != 0) then {actionKeys "User1" select 0} else {35};
switch (_key) do {	
	//Mechanic perk
	case _interactionKey: {
		if (defense_perk_mechanic && (getDammage cursorTarget) < 1 && (player distance cursorTarget < 5)) then {
			cursorTarget setDammage 0;
			hintsilent "<t size='1.2' color='#97FA21'>Repaird vehicle.</t>";
			defense_perk_mechanic = false;
		};
		_handled = true;
	};  
	
	case 210: {
		if(_shift) then {
			switch (player getVariable["Earplugs",0]) do {
				case 0: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Earplugs:</t> 90%</t>"; 1 fadeSound 0.1; player setVariable ["Earplugs", 10]; };
				case 10: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Earplugs:</t> 60%</t>"; 1 fadeSound 0.4; player setVariable ["Earplugs", 40]; };
				case 40: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Earplugs:</t> 30%</t>"; 1 fadeSound 0.7; player setVariable ["Earplugs", 70]; };
				case 70: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Earplugs:</t> removed</t>"; 1 fadeSound 1; player setVariable ["Earplugs", 0]; };
		    };
			_handled = true;
		} else {
			switch (player getVariable["Viewdistance", 400]) do {
				case 400: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 600m</t>"; setViewDistance 600; player setVariable ["Viewdistance", 600]; };
				case 600: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 1000m</t>"; setViewDistance 1000; player setVariable ["Viewdistance", 1000]; };
				case 1000: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 1500m</t>"; setViewDistance 1500; player setVariable ["Viewdistance", 1500]; };
				case 1500: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 2000m</t>"; setViewDistance 2000; player setVariable ["Viewdistance", 2000]; };
				case 2000: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 4000m</t>"; setViewDistance 4000; player setVariable ["Viewdistance", 4000]; };
				case 4000: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 7500m</t>"; setViewDistance 7500; player setVariable ["Viewdistance", 7500]; };
				case 7500: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> Default</t>"; setViewDistance -1; player setVariable ["Viewdistance", -1]; };
				case -1: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 400m</t>"; setViewDistance 400; player setVariable ["Viewdistance", 400]; };
		    };
			_handled = true;
		};
	};
	
   case 211: {
		switch (player getVariable["Viewdistance", 400]) do {
			case 7500: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 4000m</t>"; setViewDistance 4000; player setVariable ["Viewdistance", 4000]; };
			case 4000: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 2000m</t>"; setViewDistance 2000; player setVariable ["Viewdistance", 2000]; };
			case 2000: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 1500m</t>"; setViewDistance 1500; player setVariable ["Viewdistance", 1500]; };
			case 1500: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 1000m</t>"; setViewDistance 1000; player setVariable ["Viewdistance", 1000]; };
			case 1000: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 600m</t>"; setViewDistance 600; player setVariable ["Viewdistance", 600]; };
			case 600: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 400m</t>"; setViewDistance 400; player setVariable ["Viewdistance", 400]; };
			case 400: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> Default</t>"; setViewDistance -1; player setVariable ["Viewdistance", -1]; };
			case -1: {hintSilent parseText "<t size='1.2' ><t color='#97FA21'>Viewdistance:</t> 7500m</t>"; setViewDistance 7500; player setVariable ["Viewdistance", 7500]; };
		};
		_handled = true;
   };	
};

_handled;