/* #Wasijy
$[
	1.063,
	["Defense_hud",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"back_main",[1,"",["0.933125 * safezoneW + safezoneX","0.841 * safezoneH + safezoneY","0.061875 * safezoneW","0.121 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"",[1,"",["0.933125 * safezoneW + safezoneX","0.841 * safezoneH + safezoneY","0.061875 * safezoneW","0.121 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
/*
class ETG_Main_HUD
{
	idd = 3000;
	fadeout=0.5;
	fadein=0.5;
	duration = 999999999;
	onLoad = "uiNamespace setVariable ['ETG_Main_HUD', _this select 0];";

	class controlsBackground 
	{
		class back_main: IGUIBack
		{
			idc = -1;
			x = 0.933125 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.121 * safezoneH;
		};
	};
	class controls
	{
		class back_main: RscStructuredText
		{
			idc = 3000;
			x = 0.933125 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.121 * safezoneH;
		};
	};
};
*/

class ETG_Main_HUD
{
	idd = 3000;
	fadeout=0.5;
	fadein=0.5;
	duration = 999999999;
	onLoad = "uiNamespace setVariable ['ETG_Main_HUD', _this select 0];";

	class controlsBackground 
	{
		
	};
	
	class controls
	{
		class pb_tickets: RscProgressBar
		{
			idc = 1600;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class pb_alive: RscProgressBar
		{
			idc = 1601;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class pb_health: RscProgressBar
		{
			idc = 1602;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class stxt_misc: RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class txt_tickets: RscStructuredText
		{
			idc = 1000;
			text = "abc";
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txt_health: RscStructuredText
		{
			idc = 1001;
			text = "<br/>hello";
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txt_alive: RscStructuredText
		{
			idc = 1002;
			text = "abc";
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};