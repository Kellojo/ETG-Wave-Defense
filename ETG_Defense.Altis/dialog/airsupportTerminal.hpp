/* #Pygure
$[
	1.063,
	["upgrade_terminal",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"back_main",[1,"",["0.29375 * safezoneW + safezoneX","0.291 * safezoneH + safezoneY","0.4125 * safezoneW","0.484 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"txt_head",[1,"Upgrade Terminal",["0.29375 * safezoneW + safezoneX","0.269 * safezoneH + safezoneY","0.4125 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"lb_upgrades",[1,"",["0.304062 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.12375 * safezoneW","0.418 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"txt_upgrade_head",[1,"Available Upgrades:",["0.304062 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.12375 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2400,"btn_close",[1,"Close",["0.438125 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.257813 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2402,"btn_buy",[1,"Buy Upgrade",["0.438125 * safezoneW + safezoneX","0.698 * safezoneH + safezoneY","0.257813 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"stxt_info",[1,"",["0.438126 * safezoneW + safezoneX","0.401 * safezoneH + safezoneY","0.257813 * safezoneW","0.286 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"txt_info_head",[1,"Information:",["0.438125 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.257813 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"",[1,"",["0.438124 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.257813 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class Support_Terminal
{
	idd = 2000;
	fadeout=0.5;
	fadein=0.5;
	onLoad = "uiNamespace setVariable ['Support_Terminal', _this select 0];";

	class controlsBackground 
	{
		class back_main: IGUIBack
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.484 * safezoneH;
		};
		class txt_head: RscText
		{
			idc = -1;
			colorBackground[] = {0.59,0.98,0.13,0.6};
			text = "Air Support Terminal"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txt_upgrade_head: RscText
		{
			idc = -1;
			colorBackground[] = {0.59,0.98,0.13,0.6};
			text = "Available Air Support:"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txt_info_head: RscText
		{
			idc = -1;
			colorBackground[] = {0.59,0.98,0.13,0.6};
			text = "Information:"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
		};

	};
	class controls
	{
		class lb_upgrades: RscListbox
		{
			idc = 2001;
			onLBSelChanged = "[1,'Support',lbData [2001, lbCurSel 2001],false] call fn_UpgradeTerminal";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.418 * safezoneH;
		};
		class btn_close: RscButtonMenu
		{
			idc = -1;
			action = "closeDialog 0;";
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			text = "Close"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_buy: RscButtonMenu
		{
			idc = -1;
			action = "[lbData [2001, lbCurSel 2001],'Support'] call fn_useUpgrade;";
			text = "Call in Air Support"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class map: RscMapControl
		{
			idc = 2003;
			x = 0.438126 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class stxt_info: RscStructuredText
		{
			idc = 2002;
			x = 0.438124 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};



