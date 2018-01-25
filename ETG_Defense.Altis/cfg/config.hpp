
class Main {
	default_gear[] = {{"hgun_PDW2000_F","muzzle_snds_L","","optic_Holosight",{"30Rnd_9x21_Mag",30},{},""},{},{},{"U_B_CombatUniform_mcam",{{"30Rnd_9x21_Mag",30,2}}},{"V_HarnessOGL_brn",{{"FirstAidKit",4},{"30Rnd_9x21_Mag",30,4},{"MiniGrenade",1,1},{"SmokeShellBlue",1,1},{"SmokeShellYellow",1,1},{"SmokeShellGreen",1,1}}},{},"","",{"Binocular","","","",{},{},""},{"ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""}};
	lookForVars[] = {"Upgrades","Support","Perks"};
};

class Enemies {

	units[] = {"O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F","O_G_officer_F","O_Soldier_F","O_officer_F","O_Soldier_lite_F","O_Soldier_GL_F","O_Soldier_AR_F","O_Soldier_SL_F","O_Soldier_TL_F","O_soldier_M_F","O_Soldier_LAT_F","O_medic_F","O_soldier_repair_F","O_soldier_exp_F","O_helipilot_F","O_Soldier_A_F","O_Soldier_AT_F","O_Soldier_AA_F","O_engineer_F","O_soldier_PG_F","O_spotter_F","O_sniper_F","O_recon_F","O_recon_M_F","O_recon_LAT_F","O_recon_medic_F","O_recon_exp_F","O_recon_JTAC_F","O_recon_TL_F","O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AAA_F","O_support_GMG_F","O_support_Mort_F","O_support_AMG_F","O_Soldier_AAA_F","O_Soldier_AAT_F","O_soldierU_F"};
	
	light_vehicles[] = {"I_Truck_02_transport_F","O_LSV_02_unarmed_F","I_Truck_02_covered_F","O_Truck_03_covered_F","I_G_Offroad_01_F","B_Truck_01_Transport_F"};
	medium_vehicles[] = {"I_MRAP_03_hmg_F","I_MRAP_03_F","O_LSV_02_armed_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_MRAP_02_F","I_G_Offroad_01_armed_F"};
	heavy_vehicles[] = {"I_MRAP_03_gmg_F","I_MBT_03_cannon_F","B_APC_Tracked_01_rcws_F","I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F","B_APC_Tracked_01_CRV_F","O_APC_Tracked_02_AA_F","B_APC_Wheeled_01_cannon_F","O_MBT_02_cannon_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","B_APC_Tracked_01_AA_F","B_MBT_01_TUSK_F","B_MBT_01_cannon_F"};
	
	air_vehicles[] = {"I_Heli_light_03_F","I_Plane_Fighter_03_AA_F","O_Plane_CAS_02_F","O_Heli_Attack_02_F","B_Heli_Attack_01_F","B_Heli_Light_01_armed_F","B_Plane_CAS_01_F"};
	water_vehicles[] = {""};
};

class VehicleScrapper {
	lVehicles = 25;
	mVehicles = 45;
	hVehicles = 60;
	
	aVehicles = 50;
	bVehicles = 25;
};

class Upgrades {
	dialog = "Upgrades_Terminal";
	
	class Arsenal_U {
		title = "STR_UpgradeTitles_Arsenalu";
		description = "STR_up_ArsenalU";
		price = 50;
		varname = "defense_upgrade_arsenal_u";
		function = "fn_arsenal";
		condition = "!defense_upgrade_arsenal_u";
		onServer = true;
	};
	
	class Arsenal_1 {
		title = "STR_UpgradeTitles_Arsenal1";
		description = "STR_up_Arsenal1";
		price = 100;
		varname = "defense_upgrade_arsenal_1";
		function = "fn_arsenal";
		condition = "defense_upgrade_arsenal_u && !defense_upgrade_arsenal_1";
		onServer = true;
	};
	
	class Arsenal_2 {
		title = "STR_UpgradeTitles_Arsenal2";
		description = "STR_up_Arsenal2";
		price = 150;
		varname = "defense_upgrade_arsenal_2";
		function = "fn_arsenal";
		condition = "defense_upgrade_arsenal_1 && !defense_upgrade_arsenal_2";
		onServer = true;
	};
	
	class Arsenal_3 {
		title = "STR_UpgradeTitles_Arsenal3";
		description = "STR_up_Arsenal3";
		price = 200;
		varname = "defense_upgrade_arsenal_3";
		function = "fn_arsenal";
		condition = "defense_upgrade_arsenal_2 && !defense_upgrade_arsenal_3";
		onServer = true;
	};
	
	class Arsenal_4 {
		title = "STR_UpgradeTitles_Arsenal4";
		description = "STR_up_Arsenal4";
		price = 250;
		varname = "defense_upgrade_arsenal_4";
		function = "fn_arsenal";
		condition = "defense_upgrade_arsenal_3 && !defense_upgrade_arsenal_4";
		onServer = true;
	};
	
	class Arsenal_5 {
		title = "STR_UpgradeTitles_ArsenalSniper";
		description = "STR_up_Arsenal5";
		price = 450;
		varname = "defense_upgrade_arsenal_5";
		function = "fn_arsenal";
		condition = "defense_upgrade_arsenal_4 && !defense_upgrade_arsenal_5 && defense_wave >= 15";
		onServer = true;
	};
	
	class Arsenal_6 {
		title = "STR_UpgradeTitles_ArsenalMG";
		description = "STR_up_Arsenal6";
		price = 450;
		varname = "defense_upgrade_arsenal_6";
		function = "fn_arsenal";
		condition = "defense_upgrade_arsenal_4 && !defense_upgrade_arsenal_6 && defense_wave >= 15";
		onServer = true;
	};
	
	class Arsenal_7 {
		title = "STR_UpgradeTitles_ArsenalSO";
		description = "STR_up_Arsenal7";
		price = 450;
		varname = "defense_upgrade_arsenal_7";
		function = "fn_arsenal";
		condition = "defense_upgrade_arsenal_4 && !defense_upgrade_arsenal_7";
		onServer = true;
	};
	
	class Wall_V1 {
		title = "STR_UpgradeTitles_Wallv1";
		description = "STR_up_WallV1";
		price = 100;
		varname = "defense_upgrade_wall_v1";
		function = "fn_wall";
		condition = "!defense_upgrade_wall_v1";
		onServer = true;
	};
	
	class Wall_V2 {
		title = "STR_UpgradeTitles_Wallv2";
		description = "STR_up_WallV2";
		price = 150;
		varname = "defense_upgrade_wall_v2";
		function = "fn_wall";
		condition = "defense_upgrade_wall_v1 && !defense_upgrade_wall_v2";
		onServer = true;
	};
	
	class Wall_V3 {
		title = "STR_UpgradeTitles_Wallv3";
		description = "STR_up_WallV3";
		price = 300;
		varname = "defense_upgrade_wall_v3";
		function = "fn_wall";
		condition = "!defense_upgrade_wall_v3";
		onServer = true;
	};
	
	class Wall_V4 {
		title = "STR_UpgradeTitles_Wallv4";
		description = "STR_up_WallV4";
		price = 200;
		varname = "defense_upgrade_wall_v4";
		function = "fn_wall";
		condition = "!defense_upgrade_wall_v4 && defense_upgrade_wall_v3";
		onServer = true;
	};
	
	class Wall_V5 {
		title = "STR_UpgradeTitles_Wallv5";
		description = "STR_up_WallV5";
		price = 200;
		varname = "defense_upgrade_wall_v5";
		function = "fn_wall";
		condition = "!defense_upgrade_wall_v5 && defense_upgrade_wall_v3";
		onServer = true;
	};
	
	class Air_U {
		title = "STR_UpgradeTitles_AirU";
		description = "STR_up_AirU";
		price = 100;
		varname = "defense_upgrade_air";
		function = "fn_air";
		condition = "!defense_upgrade_air";
		onServer = true;
	};
	
	class Perk_u {
		title = "STR_UpgradeTitles_PerkU";
		description = "STR_up_PerkU";
		price = 25;
		varname = "defense_upgrade_perk";
		function = "fn_perks";
		condition = "!defense_upgrade_perk";
		onServer = true;
	};
	
	class turret_1 {
		title = "STR_UpgradeTitles_Turret1";
		description = "STR_up_Turret1";
		price = 450;
		varname = "defense_upgrade_turret_1";
		function = "fn_wall";
		condition = "!defense_upgrade_turret_1";
		onServer = true;
	};
	
	class turret_2 {
		title = "STR_UpgradeTitles_Turret2";
		description = "STR_up_Turret2";
		price = 450;
		varname = "defense_upgrade_turret_2";
		function = "fn_wall";
		condition = "!defense_upgrade_turret_2";
		onServer = true;
	};
	
	class turret_3 {
		title = "STR_UpgradeTitles_Turret3";
		description = "STR_up_Turret3";
		price = 450;
		varname = "defense_upgrade_turret_3";
		function = "fn_wall";
		condition = "!defense_upgrade_turret_3";
		onServer = true;
	};
	
	class RaR_T {
		title = "STR_UpgradeTitles_TM";
		description = "STR_up_RaRTurret";
		price = 50;
		varname = "";
		function = "fn_rearmTurrets";
		condition = "defense_upgrade_turret_1 || defense_upgrade_turret_2 || defense_upgrade_turret_3";
		onServer = true;
	};
};

class Support {
	dialog = "Support_Terminal";
	
	class Supply {
		title = "STR_UpgradeTitles_SupplyD";
		description = "STR_up_Supply";
		price = 60;
		varname = "";
		function = "fn_air";
		condition = "true";
		onServer = false;
	};
	
	class Supply_stomper {
		title = "STR_UpgradeTitles_StomperD";
		description = "STR_up_SupStomper";
		price = 250;
		varname = "";
		function = "fn_air";
		condition = "true";
		onServer = false;
	};
	
	class UAV {
		title = "STR_UpgradeTitles_UAV";
		description = "STR_up_UAV";
		price = 20;
		varname = "";
		function = "fn_uav";
		condition = "true";
		onServer = false;
	};
	
	class UAV_Strike {
		title = "STR_UpgradeTitles_Falcon";
		description = "STR_up_UAVStrike";
		price = 800;
		varname = "";
		function = "fn_air";
		condition = "defense_uav == objNull || !alive defense_uav";
		onServer = false;
	};
	
	class Mortar {
		title = "STR_UpgradeTitles_MS";
		description = "STR_up_Mortar";
		price = 120;
		varname = "";
		function = "fn_air";
		condition = "true";
		onServer = false;
	};
	
	class Artillery {
		title = "STR_UpgradeTitles_AS";
		description = "STR_up_Artillery";
		price = 50;
		varname = "";
		function = "fn_air";
		condition = "true";
		onServer = false;
	};
	
	class CAS {
		title = "STR_UpgradeTitles_CAS";
		description = "STR_up_CAS";
		price = 30;
		varname = "";
		function = "fn_air";
		condition = "true";
		onServer = false;
	};
};
	
class Perks {
	dialog = "Perks_Terminal";
	
	class Perk_GearSafe {
		title = "STR_UpgradeTitles_GS";
		description = "STR_up_PerkGear";
		price = 25;
		varname = "defense_perk_gearsafe";
		function = "fn_perks";
		condition = "!defense_perk_gearsafe";
		onServer = false;
	};
	
	class Perk_PassiveHeal {
		title = "STR_UpgradeTitles_PH";
		description = "STR_up_PerkPHeal";
		price = 25;
		varname = "defense_perk_heal";
		function = "fn_perks";
		condition = "!defense_perk_heal";
		onServer = false;
	};
	
	class Perk_Mechanic {
		title = "STR_UpgradeTitles_Mechanic";
		description = "STR_up_PerkMechanic";
		price = 25;
		varname = "defense_perk_mechanic";
		function = "fn_perks";
		condition = "!defense_perk_mechanic";
		onServer = false;
	};
	
	class Perk_Fatigue {
		title = "STR_UpgradeTitles_Fatigue";
		description = "STR_up_PerkFatigue";
		price = 10;
		varname = "defense_perk_fatigue";
		function = "fn_perks";
		condition = "!defense_perk_fatigue";
		onServer = false;
	};
};


///#########################################################################\\\
///Do not change Values below here unless you really know what you are doing\\\
///#########################################################################\\\

class Difficulty {

	class Man {
		chance = 10000;
	};
	
	class LightVeh {
		chance = 100;
	};
	
	class MedVeh {
		chance = 50;
	};
	
	class HeavyVeh {
		chance = 35;
	};
	
	class Boat {
		chance = 100;
	};
	
	class Air {
		chance = 30;
	};
};
