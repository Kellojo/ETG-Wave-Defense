/*
	Filename: fn_arsenal.sqf
	Author: Kellojo
	Description: handles the arsenal upgrades and tiers
*/

_mode = _this select 0;

//1 upgrade: buy
if (_mode == "Arsenal_U") exitWith {
	_arsenal = ["AmmoboxInit",[defense_arsenal_ammobox,true]] call BIS_fnc_arsenal;
	_txt = parseText localize "STR_NOTF_ArsenalU";
	[_txt] remoteExec ["fn_hint", 0, false];
	[defense_arsenal_ammobox,localize "STR_Action_AddItems",{["add"] call fn_arsenal}] remoteExec ["fn_addAction", 0, true];
	[defense_arsenal_ammobox,localize "STR_Action_SetLoadout",{defense_player_spawngear = getUnitLoadout player;hint parseText localize "STR_NOTF_ArsenalSetSGear";}] remoteExec ["fn_addAction", 0, true];
	[defense_arsenal_ammobox,localize "STR_Action_LoadLoadout",{[] call fn_spawnGear;}] remoteExec ["fn_addAction", 0, true];
	
	//Clear arsenal
	[defense_arsenal_ammobox,true,true] call BIS_fnc_removeVirtualWeaponCargo;
	[defense_arsenal_ammobox,true,true] call BIS_fnc_removeVirtualMagazineCargo;
	[defense_arsenal_ammobox,true,true] call BIS_fnc_removeVirtualItemCargo;
	[defense_arsenal_ammobox,true,true] call BIS_fnc_removeVirtualBackpackCargo;
};

//Add item from crate to Arsenal
if (_mode == "add") exitWith {
	_bpacks = getBackpackCargo defense_arsenal_ammobox;
	_weapons = getWeaponCargo defense_arsenal_ammobox;
	_items = getItemCargo defense_arsenal_ammobox;
	_mags = getMagazineCargo defense_arsenal_ammobox;
	
	//Remove weapons from the ammobox
	clearItemCargoGlobal defense_arsenal_ammobox;
	clearMagazineCargoGlobal defense_arsenal_ammobox;
	clearWeaponCargoGlobal defense_arsenal_ammobox;
	clearBackpackCargoGlobal defense_arsenal_ammobox;
	
	//Add newly found items...
	[defense_arsenal_ammobox,_weapons select 0,(true)] call BIS_fnc_addVirtualWeaponCargo;
	[defense_arsenal_ammobox,_items select 0,(true)] call BIS_fnc_addVirtualItemCargo;
	[defense_arsenal_ammobox,_mags select 0,(true)] call BIS_fnc_addVirtualMagazineCargo;
	[defense_arsenal_ammobox,_bpacks select 0,(true)] call BIS_fnc_addVirtualBackpackCargo;
	
	hint parseText localize "STR_NOTF_ArsenalManualAdd";
};

//Tier 1
if (_mode == "Arsenal_1") exitWith {
	[defense_arsenal_ammobox,["hgun_ACPC2_snds_F","hgun_P07_snds_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_PDW2000_F","hgun_PDW2000_snds_F","hgun_PDW2000_Holo_F","hgun_PDW2000_Holo_snds_F","SMG_01_F","SMG_01_Holo_F","SMG_01_Holo_pointer_snds_F","SMG_02_F","SMG_02_ACO_F","launch_RPG7_F"],(true)] call BIS_fnc_addVirtualWeaponCargo;
	[defense_arsenal_ammobox,["muzzle_snds_L","optic_Aco","optic_ACO_grn","optic_Holosight","muzzle_snds_acp","optic_Yorris","optic_MRD","FirstAidKit","Binocular","ItemMap","ItemRadio","ItemGPS","ItemCompass","ItemWatch","MineDetector","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_C_Poloshirt_blue","U_I_CombatUniform_shortsleeve","U_I_pilotCoveralls","U_MillerBody","U_KerryBody","U_IG_Guerilla2_3","U_BG_Guerilla2_3","V_Rangemaster_belt","V_BandollierB_khk","V_HarnessO_brn","V_RebreatherB","V_Press_F","H_Booniehat_indp","","","",""],(true)] call BIS_fnc_addVirtualItemCargo;
	[defense_arsenal_ammobox,["16Rnd_9x21_Mag","30Rnd_9x21_Mag","6Rnd_45ACP_Cylinder","11Rnd_45ACP_Mag","30Rnd_9x21_Mag","16Rnd_9x21_Mag","9Rnd_45ACP_Mag","16Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_tracer_green","30Rnd_9x21_Mag","RPG7_F"],(true)] call BIS_fnc_addVirtualMagazineCargo;
	[defense_arsenal_ammobox,["B_AssaultPack_cBr","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_ocamo","B_AssaultPack_khk","B_AssaultPack_mcamo","B_AssaultPack_Blk","B_AssaultPack_dgtl","B_AssaultPack_Kerry"],(true)] call BIS_fnc_addVirtualBackpackCargo;
	
	_txt = parseText localize "STR_NOTF_Arsenal1";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//Tier 2
if (_mode == "Arsenal_2") exitWith {
	[defense_arsenal_ammobox,["arifle_SDAR_F","arifle_TRG21_F","arifle_TRG21_GL_F","arifle_TRG20_F","launch_NLAW_F","launch_RPG32_F","arifle_AKS_F","SMG_05_F"],(true)] call BIS_fnc_addVirtualWeaponCargo;
	[defense_arsenal_ammobox,["H_Shemag_olive_hs","H_Shemag_khk","H_ShemagOpen_khk","H_BandMask_reaper","H_PilotHelmetFighter_B","V_TacVest_brn","V_Chestrig_rgr","U_OG_Guerrilla_6_1","U_BG_Guerrilla_6_1","U_B_survival_uniform","U_OG_Guerilla2_3","U_OG_Guerilla2_1","NVGoggles","B_UavTerminal","muzzle_snds_M","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","optic_MRCO"],(true)] call BIS_fnc_addVirtualItemCargo;
	[defense_arsenal_ammobox,["NLAW_F","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","20Rnd_556x45_UW_mag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","1Rnd_HE_Grenade_shell","RPG32_F","RPG32_HE_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_545x39_Mag_Tracer_Green_F","10Rnd_50BW_Mag_F","30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","100Rnd_580x42_Mag_F","100Rnd_580x42_Mag_Tracer_F"],(true)] call BIS_fnc_addVirtualMagazineCargo;
	[defense_arsenal_ammobox,["B_FieldPack_cbr","B_FieldPack_ocamo","B_FieldPack_khk","B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_oucamo","B_TacticalPack_rgr","B_TacticalPack_ocamo","B_TacticalPack_mcamo","B_TacticalPack_blk","B_TacticalPack_oli"],(true)] call BIS_fnc_addVirtualBackpackCargo;
	
	_txt = parseText localize "STR_NOTF_Arsenal2";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//Tier 3
if (_mode == "Arsenal_3") exitWith {
	[defense_arsenal_ammobox,["arifle_MXC_Black_F","arifle_Mk20_GL_plain_F","arifle_Mk20_F","arifle_AKM_F","arifle_CTAR_blk_ACO_F","arifle_CTAR_blk_F","arifle_CTAR_GL_blk_F","arifle_CTAR_GL_ghex_F","arifle_CTAR_GL_hex_F","arifle_CTAR_hex_F","arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_SPAR_01_blk_F"],(true)] call BIS_fnc_addVirtualWeaponCargo;
	[defense_arsenal_ammobox,["V_PlateCarrier1_blk","V_PlateCarrierGL_rgr","V_PlateCarrier3_rgr","V_PlateCarrier2_rgr","V_PlateCarrier1_rgr","U_B_GhillieSuit"],(true)] call BIS_fnc_addVirtualItemCargo;
	[defense_arsenal_ammobox,["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","3Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer"],(true)] call BIS_fnc_addVirtualMagazineCargo;
	[defense_arsenal_ammobox,["B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg"],(true)] call BIS_fnc_addVirtualBackpackCargo;

	_txt = parseText localize "STR_NOTF_Arsenal3";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//Tier 4
if (_mode == "Arsenal_4") exitWith {
	[defense_arsenal_ammobox,["arifle_MX_Black_F","arifle_MXM_F","arifle_MX_SW_F","arifle_Katiba_C_ACO_pointer_F","arifle_Katiba_F","launch_B_Titan_short_F","srifle_DMR_01_F","launch_B_Titan_F"],(true)] call BIS_fnc_addVirtualWeaponCargo;
	[defense_arsenal_ammobox,["V_PlateCarrierIAGL_oli"],(true)] call BIS_fnc_addVirtualItemCargo;
	[defense_arsenal_ammobox,["Titan_AA","Titan_AT","Titan_AP","100Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"],(true)] call BIS_fnc_addVirtualMagazineCargo;
	[defense_arsenal_ammobox,["B_Carryall_cbr","B_Carryall_ocamo","B_Carryall_khk","B_Carryall_oli","B_Carryall_oucamo","B_Carryall_mcamo","B_UAV_01_backpack_F"],(true)] call BIS_fnc_addVirtualBackpackCargo;

	_txt = parseText localize "STR_NOTF_Arsenal4";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//Sniper
if (_mode == "Arsenal_5") exitWith {
	[defense_arsenal_ammobox,["srifle_EBR_F","srifle_GM6_F","srifle_LRR_F","7Rnd_408_Mag","srifle_DMR_02_F","srifle_DMR_03_F","srifle_DMR_03_spotter_F","srifle_DMR_04_F","srifle_DMR_05_hex_F","srifle_DMR_06_camo_F"],(true)] call BIS_fnc_addVirtualWeaponCargo;
	[defense_arsenal_ammobox,["U_B_FullGhillie_ard","U_B_FullGhillie_sard","U_B_FullGhillie_lsh","V_PlateCarrierGL_mtp","V_PlateCarrierGL_blk","V_PlateCarrierSpec_blk","MineDetector","optic_SOS","optic_DMS","optic_LRPS","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan"],(true)] call BIS_fnc_addVirtualItemCargo;
	[defense_arsenal_ammobox,["20Rnd_762x51_Mag","5Rnd_127x108_Mag","5Rnd_127x108_APDS_Mag","10Rnd_338_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","10Rnd_127x54_Mag","10Rnd_93x64_DMR_05_Mag","20Rnd_762x51_Mag"],(true)] call BIS_fnc_addVirtualMagazineCargo;

	_txt = parseText localize "STR_NOTF_Arsenal5";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//MG
if (_mode == "Arsenal_6") exitWith {
	[defense_arsenal_ammobox,["	MMG_02_camo_F","MMG_02_sand_RCO_LP_F","LMG_Zafir_F","LMG_Mk200_F","LMG_03_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F"],(true)] call BIS_fnc_addVirtualWeaponCargo;
	[defense_arsenal_ammobox,["130Rnd_338_Mag","150Rnd_93x64_Mag","150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer","200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","200Rnd_556x45_Box_F","200Rnd_556x45_Box_Red_F","200Rnd_556x45_Box_Tracer_F","200Rnd_556x45_Box_Tracer_Red_F","150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Mag_Tracer_F"],(true)] call BIS_fnc_addVirtualMagazineCargo;

	_txt = parseText localize "STR_NOTF_Arsenal6";
	[_txt] remoteExec ["fn_hint", 0, false];
};

//Spec ops
if (_mode == "Arsenal_7") exitWith {
	[defense_arsenal_ammobox,["arifle_AK12_F","arifle_AK12_GL_F","arifle_ARX_blk_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F","arifle_SPAR_03_blk_F"],(true)] call BIS_fnc_addVirtualWeaponCargo;
	[defense_arsenal_ammobox,["200Rnd_556x45_Box_F","200Rnd_556x45_Box_Red_F","200Rnd_556x45_Box_Tracer_F","200Rnd_556x45_Box_Tracer_Red_F","150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Mag_Tracer_F"],(true)] call BIS_fnc_addVirtualMagazineCargo;
	[defense_arsenal_ammobox,["muzzle_snds_H_MG","muzzle_snds_H_SW","muzzle_snds_B","muzzle_snds_M","muzzle_snds_L","muzzle_snds_H","","optic_tws_mg","optic_tws","optic_Nightstalker","optic_NVS","APERSMine_Range_Mag","APERSBoundingMine_Range_Mag","APERSTripMine_Wire_Mag","ClaymoreDirectionalMine_Remote_Mag","IEDLandBig_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandSmall_Remote_Mag""IEDUrbanSmall_Remote_Mag","SLAMDirectionalMine_Wire_Mag","ATMine_Range_Mag","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag"],(true)] call BIS_fnc_addVirtualItemCargo;
	[defense_arsenal_ammobox,["B_HMG_01_support_F","B_HMG_01_support_high_F","B_HMG_01_high_weapon_F","B_GMG_01_high_weapon_F","B_Mortar_01_support_F","B_Mortar_01_weapon_F"],(true)] call BIS_fnc_addVirtualBackpackCargo;

	_txt = parseText localize "STR_NOTF_Arsenal7";
	[_txt] remoteExec ["fn_hint", 0, false];
};
