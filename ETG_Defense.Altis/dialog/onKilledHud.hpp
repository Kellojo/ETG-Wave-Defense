/* #Tukyqa
$[
	1.063,
	["killed",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"txt_killed_head",[1,"Enemy killed:",["0.70625 * safezoneW + safezoneX","0.643 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"",[1,"",["0.70625 * safezoneW + safezoneX","0.665 * safezoneH + safezoneY","0.0876563 * safezoneW","0.11 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/


class ETG_AI_Killed
{
	idd = 1000;
	fadeout=0.5;
	fadein=0.5;
	duration = 5;
	onLoad = "uiNamespace setVariable ['ETG_AI_Killed', _this select 0];";

	class controlsBackground 
	{
		class txt_killed_head: RscText
		{
			idc = 1003;
			colorText[] = {0.59,0.98,0.13,1};
			text = "Enemy killed:"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls
	{
		class stxt_kill: RscStructuredText
		{
			idc = 1001;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.11 * safezoneH;
		};

	};
};

