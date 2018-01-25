/* #Rugawu
$[
	1.063,
	["end_stats",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"back_main",[1,"",["0.809375 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.185625 * safezoneW","0.55 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"stxt_info",[1,"",["0.819688 * safezoneW + safezoneX","0.269 * safezoneH + safezoneY","0.165 * safezoneW","0.506 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"txt_head",[1,"",["0.809375 * safezoneW + safezoneX","0.225 * safezoneH + safezoneY","0.185625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/


class ETG_End_Stats
{
	idd = 4000;
	fadeout=0.5;
	fadein=0.5;
	duration = 99999999;
	onLoad = "uiNamespace setVariable ['ETG_End_Stats', _this select 0];";

	class controlsBackground 
	{
		class back_main: IGUIBack
		{
			idc = -1;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.55 * safezoneH;
		};
	};
	class controls
	{
		class stxt_info: RscStructuredText
		{
			idc = 4001;
			x = 0.819688 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.506 * safezoneH;
		};
		class txt_head: RscText
		{
			idc = 4002;
			text = "Round Stats:";
			colorBackground[] = {0.59,0.98,0.13,0.6};
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

