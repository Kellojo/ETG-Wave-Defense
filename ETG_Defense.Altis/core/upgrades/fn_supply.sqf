/*
	Filename: fn_supply.sqf
	Author: Kellojo
	Description: main function for the supply drops
*/

_pos = _this select 0;
_mode = _this select 1;
if (isNil "_pos" || isNil "_mode") exitWith {};

_i = 0;
_items = [];
_max = floor(random 60);
_loot = ["hgun_ACPC2_snds_F","hgun_P07_snds_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","hgun_PDW2000_F","hgun_PDW2000_snds_F","hgun_PDW2000_Holo_F","hgun_PDW2000_Holo_snds_F","SMG_01_F","SMG_01_Holo_F","SMG_01_Holo_pointer_snds_F","SMG_02_F","SMG_02_ACO_F","launch_RPG7_F","muzzle_snds_L","optic_Aco","optic_ACO_grn","optic_Holosight","muzzle_snds_acp","optic_Yorris","optic_MRD","FirstAidKit","Binocular","ItemMap","ItemRadio","ItemGPS","ItemCompass","ItemWatch","MineDetector","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_C_Poloshirt_blue","U_I_CombatUniform_shortsleeve","U_I_pilotCoveralls","U_MillerBody","U_KerryBody","U_IG_Guerilla2_3","U_BG_Guerilla2_3","V_Rangemaster_belt","V_BandollierB_khk","V_HarnessO_brn","V_RebreatherB","V_Press_F","H_Booniehat_indp","16Rnd_9x21_Mag","30Rnd_9x21_Mag","6Rnd_45ACP_Cylinder","11Rnd_45ACP_Mag","30Rnd_9x21_Mag","16Rnd_9x21_Mag","9Rnd_45ACP_Mag","16Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_tracer_green","30Rnd_9x21_Mag","RPG7_F","B_AssaultPack_cBr","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_ocamo","B_AssaultPack_khk","B_AssaultPack_mcamo","B_AssaultPack_Blk","B_AssaultPack_dgtl","B_AssaultPack_Kerry","arifle_SDAR_F","arifle_TRG21_F","arifle_TRG21_GL_F","arifle_TRG20_F","launch_NLAW_F","launch_RPG32_F","arifle_AKS_F","SMG_05_F","H_Shemag_olive_hs","H_Shemag_khk","H_ShemagOpen_khk","H_BandMask_reaper","H_PilotHelmetFighter_B","V_TacVest_brn","V_Chestrig_rgr","U_OG_Guerrilla_6_1","U_BG_Guerrilla_6_1","U_B_survival_uniform","U_OG_Guerilla2_3","U_OG_Guerilla2_1","NVGoggles","B_UavTerminal","muzzle_snds_M","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","optic_MRCO","NLAW_F","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","20Rnd_556x45_UW_mag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","1Rnd_HE_Grenade_shell","RPG32_F","RPG32_HE_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_545x39_Mag_Tracer_Green_F","10Rnd_50BW_Mag_F","30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","100Rnd_580x42_Mag_F","100Rnd_580x42_Mag_Tracer_F","B_FieldPack_cbr","B_FieldPack_ocamo","B_FieldPack_khk","B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_oucamo","B_TacticalPack_rgr","B_TacticalPack_ocamo","B_TacticalPack_mcamo","B_TacticalPack_blk","B_TacticalPack_oli","arifle_MXC_Black_F","arifle_Mk20_GL_plain_F","arifle_Mk20_F","arifle_AKM_F","arifle_CTAR_blk_ACO_F","arifle_CTAR_blk_F","arifle_CTAR_GL_blk_F","arifle_CTAR_GL_ghex_F","arifle_CTAR_GL_hex_F","arifle_CTAR_hex_F","arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_SPAR_01_blk_F","V_PlateCarrier1_blk","V_PlateCarrierGL_rgr","V_PlateCarrier3_rgr","V_PlateCarrier2_rgr","V_PlateCarrier1_rgr","U_B_GhillieSuit","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","3Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer","B_Kitbag_cbr","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","arifle_MX_Black_F","arifle_MXM_F","arifle_MX_SW_F","arifle_Katiba_C_ACO_pointer_F","arifle_Katiba_F","launch_B_Titan_short_F","srifle_DMR_01_F","launch_B_Titan_F","V_PlateCarrierIAGL_oli","Titan_AA","Titan_AT","Titan_AP","100Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer","B_Carryall_cbr","B_Carryall_ocamo","B_Carryall_khk","B_Carryall_oli","B_Carryall_oucamo","B_Carryall_mcamo","B_UAV_01_backpack_F","srifle_EBR_F","srifle_GM6_F","srifle_LRR_F","7Rnd_408_Mag","srifle_DMR_02_F","srifle_DMR_03_F","srifle_DMR_03_spotter_F","srifle_DMR_04_F","srifle_DMR_05_hex_F","srifle_DMR_06_camo_F","U_B_FullGhillie_ard","U_B_FullGhillie_sard","U_B_FullGhillie_lsh","V_PlateCarrierGL_mtp","V_PlateCarrierGL_blk","V_PlateCarrierSpec_blk","MineDetector","optic_SOS","optic_DMS","optic_LRPS","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan","20Rnd_762x51_Mag","5Rnd_127x108_Mag","5Rnd_127x108_APDS_Mag","10Rnd_338_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","10Rnd_127x54_Mag","10Rnd_93x64_DMR_05_Mag","20Rnd_762x51_Mag","MMG_02_camo_F","MMG_02_sand_RCO_LP_F","LMG_Zafir_F","LMG_Mk200_F","LMG_03_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F","130Rnd_338_Mag","150Rnd_93x64_Mag","150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer","200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","200Rnd_556x45_Box_F","200Rnd_556x45_Box_Red_F","200Rnd_556x45_Box_Tracer_F","200Rnd_556x45_Box_Tracer_Red_F","150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Mag_Tracer_F","arifle_AK12_F","arifle_AK12_GL_F","arifle_ARX_blk_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F","arifle_SPAR_03_blk_F","200Rnd_556x45_Box_F","200Rnd_556x45_Box_Red_F","200Rnd_556x45_Box_Tracer_F","200Rnd_556x45_Box_Tracer_Red_F","150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Mag_Tracer_F","muzzle_snds_H_MG","muzzle_snds_H_SW","muzzle_snds_B","muzzle_snds_M","muzzle_snds_L","muzzle_snds_H","optic_tws_mg","optic_tws","optic_Nightstalker","optic_NVS","APERSMine_Range_Mag","APERSBoundingMine_Range_Mag","APERSTripMine_Wire_Mag","ClaymoreDirectionalMine_Remote_Mag","IEDLandBig_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanSmall_Remote_Mag","SLAMDirectionalMine_Wire_Mag","ATMine_Range_Mag","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","B_HMG_01_support_F","B_HMG_01_support_high_F","B_HMG_01_high_weapon_F","B_GMG_01_high_weapon_F","B_Mortar_01_support_F","B_Mortar_01_weapon_F"];
while {_i < _max} do {
	_items pushBack (_loot call BIS_fnc_selectRandom);
	_i = _i + 1;
};

//Spawn drop
_veh = createVehicle ["B_Heli_Transport_03_unarmed_F", [30165.6,26660.3,220.471], [], 0, "FLY"];
createVehicleCrew _veh;
_grp = group driver _veh;
_wp = _grp addWaypoint [_pos, 0];
_grp addWaypoint [[0,0,0], 1];
_veh flyInHeight 350;
defense_supplyDrop_arrived = false;
_wp setWaypointStatements ["true", "defense_supplyDrop_arrived = true;"];

// drop cargo
waituntil {defense_supplyDrop_arrived};
_box = [_mode] call {
	_mode = _this select 0;
	if (_mode == "Supply") exitWith {"Box_NATO_AmmoVeh_F" createvehicle [0,0,0];};
	if (_mode == "Supply_stomper") exitWith {([getPos player, 0, "B_UGV_01_rcws_F", WEST] call BIS_fnc_spawnVehicle) select 0;};
};

_box allowDamage false;
_chute = "B_parachute_02_F" createvehicle position _box;
_chute setPos (_veh modelToWorld [-10,0,-5]);
_box attachTo [_chute,[0,0,0]];
_box setDamage 0;
sleep 5;
_box allowDamage true;
waituntil {(getPosATL _box select 2) < 5};

if (_mode == "Supply") then {
	//spawn loot
	{
		if ((_x splitString "_" select 0) == "B") then {
			_box addBackpackCargoGlobal [_x, 2];
		} else {
			if (!((_x) isKindOf ["Rifle", configFile >> "CfgWeapons"]) && isClass (configFile >> "CfgWeapons" >> _x)) then {
				_box addItemCargoGlobal [_x, round random 4];
			};
		};
		
		if (isClass (configFile >> "CfgWeapons" >> _x) && (_x isKindOf ["Rifle", configFile >> "CfgWeapons"])) then {
			_box addWeaponCargo [_x, 1];
			_mag = getArray(configFile >> "CfgWeapons" >> _x >> "magazines") call BIS_fnc_selectRandom;
			_box addMagazineCargoGlobal [_mag,round random 8];
		};
	} forEach _items;
};

//delete cargo
detach _box;
sleep 40;
deletevehicle _veh;
