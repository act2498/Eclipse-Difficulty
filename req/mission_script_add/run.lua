local diff_i = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local blockadeShield = (diff_i == 6 and "units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1") or "units/payday2/characters/ene_shield_1/ene_shield_1"
local hard_and_above = diff_i >= 4
local overkill_and_above = diff_i >= 5
local diff_scaling = 0.125 * diff_i
local enabled_chance_corner_wall = math.random() < diff_scaling
local enabled_chance_alleyway_wall = math.random() < diff_scaling
local enabled_chance_alleyway_dozer = math.random() < diff_scaling
local enabled_chance_alleyway_spook1 = math.random() < diff_scaling
local enabled_chance_alleyway_spook2 = math.random() < diff_scaling
local enabled_chance_parkinglot_spook1 = math.random() < diff_scaling
local enabled_chance_parkinglot_spook2 = math.random() < diff_scaling
local enabled_chance_sniper_armitage_underpass = math.random() < diff_scaling
local enabled_chance_sniper_armitage_rooftop = math.random() < diff_scaling

local optsShieldWall1 = {
    enemy = blockadeShield,
    on_executed = { { id = 400004, delay = 0 } },
    enabled = (hard_and_above and enabled_chance_corner_wall)
}
local optsShieldWall2 = {
    enemy = blockadeShield,
    on_executed = { { id = 400005, delay = 0 } },
    enabled = (hard_and_above and enabled_chance_corner_wall)
}
local optsShieldWall3 = {
    enemy = blockadeShield,
    on_executed = { { id = 400006, delay = 0 } },
    enabled = (hard_and_above and enabled_chance_corner_wall)
}
local optsShieldWall4 = {
    enemy = blockadeShield,
    on_executed = { { id = 400007, delay = 0 } },
    enabled = (hard_and_above and enabled_chance_corner_wall)
}
local optsLateShield1 = {
    enemy = blockadeShield,
    on_executed = { { id = 400010, delay = 0 } },
    enabled = (hard_and_above and enabled_chance_alleyway_wall)
}
local optsLateShield2 = {
    enemy = blockadeShield,
    on_executed = { { id = 400011, delay = 0 } },
    enabled = (hard_and_above and enabled_chance_alleyway_wall)
}
local optsLateDozer = {
    enemy = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
    enabled = (hard_and_above and enabled_chance_alleyway_dozer)
}
local optsSpoocAmbush1 = {
    enemy = "units/payday2/characters/ene_spook_1/ene_spook_1",
    on_executed = { { id = 400014, delay = 0 } },
    enabled = (overkill_and_above and enabled_chance_alleyway_spook1)
}
local optsSpoocAmbush2 = {
    enemy = "units/payday2/characters/ene_spook_1/ene_spook_1",
    on_executed = { { id = 400017, delay = 0 } },
    enabled = (overkill_and_above and enabled_chance_alleyway_spook2)
}
local optsSpoocAmbush3 = {
    enemy = "units/payday2/characters/ene_spook_1/ene_spook_1",
    on_executed = { { id = 400019, delay = 0 } },
    enabled = (overkill_and_above and enabled_chance_parkinglot_spook1)
}
local optsSpoocAmbush4 = {
    enemy = "units/payday2/characters/ene_spook_1/ene_spook_1",
    on_executed = { { id = 400021, delay = 0 } },
    enabled = (overkill_and_above and enabled_chance_parkinglot_spook2)
}
local optsMissingBeatCop = {
    enemy = "units/payday2/characters/ene_cop_4/ene_cop_4",
    spawn_action = "e_sp_car_exit_to_cbt_front_r",
    enabled = true
}
local optsArmitageSniper_01 = {
	enemy = "units/payday2/characters/ene_sniper_1/ene_sniper_1",
	on_executed = { { id = 400086, delay = 0 } },
    trigger_times = 1,
    enabled = (hard_and_above and enabled_chance_sniper_armitage_underpass)
}
local optsArmitageSniper_02 = {
	enemy = "units/payday2/characters/ene_sniper_1/ene_sniper_1",
	on_executed = { { id = 400088, delay = 0 } },
    trigger_times = 1,
    enabled = (hard_and_above and enabled_chance_sniper_armitage_rooftop)
}
local optsBesiegeDummy = {
    participate_to_group_ai = true,
    enabled = true,
    spawn_action = "e_sp_armored_truck_1st"
}

local optsAlleyAmbushTrigger = {
    on_executed = { { id = 400013, delay = 0 }, { id = 400016, delay = 0 } },
    width = 200,
    depth = 1000
}
local optsReachedSwatVansTrigger = {
    width = 3000,
    depth = 2250,
    height = 1000
}
local optsReachedFarSwatVansTrigger = {
    width = 2000,
    height = 2000
}

local optsShieldSO = {
    SO_access = "2048",
    scan = true,
    so_action = "AI_sniper",
    pose = "crouch",
    path_stance = "cbt",
}
local optsHideSpoocSO = {
    SO_access = "1024",
    scan = true,
    so_action = "e_so_idle_by_container",
    interrupt_dis = 10
}
local optsHideCarSpoocSO = {
    SO_access = "1024",
    scan = true,
    so_action = "e_so_hide_under_car_enter",
    interrupt_dis = 10
}
local optsSniperSO = {
    scan = true,
    so_action = "AI_sniper",
    pose = "stand"
}
local optsBesiegeStart = {
    AI_event = "police_called",
    on_executed = {
        { id = 100742, delay = 6.155 },
        { id = 400090, delay = 4.150 }
    }
}

return {
    elements = {
        -- 193+ alike shield wall on turning the corner on major ave.
        StreamHeist:gen_dummy(
            400000,
            "eclipse_shield_wall_1",
            Vector3(-6805, -2965, 50),
            Rotation(0, 0, 0),
            optsShieldWall1
        ),
        StreamHeist:gen_dummy(
            400001,
            "eclipse_shield_wall_2",
            Vector3(-6805, -3065, 50),
            Rotation(0, 0, 0),
            optsShieldWall2
        ),
        StreamHeist:gen_dummy(
            400002,
            "eclipse_shield_wall_3",
            Vector3(-6805, -3165, 50),
            Rotation(0, 0, 0),
            optsShieldWall3
        ),
        StreamHeist:gen_dummy(
            400003,
            "eclipse_shield_wall_4",
            Vector3(-6805, -3265, 50),
            Rotation(0, 0, 0),
            optsShieldWall4
        ),
        StreamHeist:gen_so(
            400004,
            "eclipse_shield_so_1",
            Vector3(-6805, -2365, 50),
            Rotation(0, 0, 0),
            optsShieldSO
        ),
        StreamHeist:gen_so(
            400005,
            "eclipse_shield_so_2",
            Vector3(-6925, -2365, 50),
            Rotation(0, 0, 0),
            optsShieldSO
        ),
        StreamHeist:gen_so(
            400006,
            "eclipse_shield_so_3",
            Vector3(-7045, -2365, 50),
            Rotation(0, 0, 0),
            optsShieldSO
        ),
        StreamHeist:gen_so(
            400007,
            "eclipse_shield_so_4",
            Vector3(-7165, -2365, 50),
            Rotation(0, 0, 0),
            optsShieldSO
        ),

        -- late armitage ave. alleyway exit shield & dozer ambush
        StreamHeist:gen_dummy(
            400008,
            "eclipse_late_shield_wall_1",
            Vector3(-15748, -9023, 1050),
            Rotation(90, -0, -0),
            optsLateShield1
        ),
        StreamHeist:gen_dummy(
            400009,
            "eclipse_late_shield_wall_2",
            Vector3(-15748, -9223, 1050),
            Rotation(90, -0, -0),
            optsLateShield2
        ),
        StreamHeist:gen_so(
            400010,
            "eclipse_late_shield_so_1",
            Vector3(-16125, -8015, 1050),
            Rotation(0, 0, 0),
            optsShieldSO
        ),
        StreamHeist:gen_so(
            400011,
            "eclipse_late_shield_so_2",
            Vector3(-16250, -8015, 1050),
            Rotation(0, 0, 0),
            optsShieldSO
        ),
        StreamHeist:gen_dummy(
            400012,
            "eclipse_late_dozer_1",
            Vector3(-17021, -7219, 1050),
            Rotation(-90, 0, -0),
            optsLateDozer
        ),

        -- cloaker ambush in the alleyway
        StreamHeist:gen_dummy(
            400013,
            "eclipse_spooc_ambush_1",
            Vector3(-4282, -6997, 50),
            Rotation(90, 0, 0),
            optsSpoocAmbush1
        ),
        StreamHeist:gen_so(
            400014,
            "eclipse_spooc_so_1",
            Vector3(-4751, -6694, 50),
            Rotation(90, 0, 0),
            optsHideSpoocSO
        ),
        StreamHeist:gen_areatrigger(
            400015,
            "eclipse_spooc_so_1",
            Vector3(-6124, -5019, 50),
            Rotation(0, 0, 0),
            optsAlleyAmbushTrigger
        ),
        StreamHeist:gen_dummy(
            400016,
            "eclipse_spooc_ambush_2",
            Vector3(-4575, -8133, 50),
            Rotation(0, 0, 0),
            optsSpoocAmbush2
        ),
        StreamHeist:gen_so(
            400017,
            "eclipse_spooc_so_2",
            Vector3(-4998, -7495, 50),
            Rotation(115, 0, 0),
            optsHideSpoocSO
        ),

        -- parking lot cloaker hide
        StreamHeist:gen_dummy(
            400018,
            "eclipse_spooc_lot_ambush_1",
            Vector3(-14270, -4973, 451),
            Rotation(0, 0, 0),
            optsSpoocAmbush3
        ),
        StreamHeist:gen_so(
            400019,
            "eclipse_spooc_lot_so_3",
            Vector3(-10946, -4296, 50),
            Rotation(-90, 0, 0),
            optsHideCarSpoocSO
        ),
        StreamHeist:gen_dummy(
            400020,
            "eclipse_spooc_lot_ambush_2",
            Vector3(-14170, -4973, 451),
            Rotation(0, 0, 0),
            optsSpoocAmbush4
        ),
        StreamHeist:gen_so(
            400021,
            "eclipse_spooc_lot_so_2",
            Vector3(-10994, -4836, 50),
            Rotation(-90, 0, 0),
            optsHideCarSpoocSO
        ),

        -- missing beat cop at the start
        StreamHeist:gen_dummy(
            400022,
            "eclipse_beat_cop_start",
            Vector3(14280, 9224, 39),
            Rotation(110, -0, -0),
            optsMissingBeatCop
        ),

        -- besiege cops
        -- major ave. main swat vans
        StreamHeist:gen_dummy(
            400023,
            "eclipse_besiege_swat_01",
            Vector3(-1797, -354, 50),
            Rotation(97, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400024,
            "eclipse_besiege_swat_02",
            Vector3(-1782, -441, 50),
            Rotation(97, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400025,
            "eclipse_besiege_swat_03",
            Vector3(-1827, -382, 50),
            Rotation(97, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400026,
            "eclipse_besiege_swat_04",
            Vector3(-1821, -427, 50),
            Rotation(97, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400027,
			"eclipse_swat_van_besiege_01",
			{ 400023, 400024, 400025, 400026 },
			10
		),
        StreamHeist:gen_dummy(
            400028,
            "eclipse_besiege_swat_05",
            Vector3(-2055, -2876, 50),
            Rotation(110, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400029,
            "eclipse_besiege_swat_06",
            Vector3(-2027, -2953, 50),
            Rotation(110, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400030,
            "eclipse_besiege_swat_07",
            Vector3(-2076, -2903, 50),
            Rotation(110, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400031,
            "eclipse_besiege_swat_08",
            Vector3(-2062, -2943, 50),
            Rotation(110, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400032,
			"eclipse_swat_van_besiege_02",
			{ 400028, 400029, 400030, 400031 },
			10
		),
        StreamHeist:gen_dummy(
            400033,
            "eclipse_besiege_swat_09",
            Vector3(-3406, 306, 50),
            Rotation(51, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400034,
            "eclipse_besiege_swat_10",
            Vector3(-3448, 254, 50),
            Rotation(51, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400035,
            "eclipse_besiege_swat_11",
            Vector3(-3440, 318, 50),
            Rotation(51, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400036,
            "eclipse_besiege_swat_12",
            Vector3(-3464, 288, 50),
            Rotation(51, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400037,
			"eclipse_swat_van_besiege_03",
			{ 400033, 400034, 400035, 400036 },
			10
		),
        StreamHeist:gen_dummy(
            400038,
            "eclipse_besiege_swat_13",
            Vector3(-1178, -2047, 50),
            Rotation(173, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400039,
            "eclipse_besiege_swat_14",
            Vector3(-1087, -2058, 50),
            Rotation(173, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400040,
            "eclipse_besiege_swat_15",
            Vector3(-1164, -2082, 50),
            Rotation(173, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400041,
            "eclipse_besiege_swat_16",
            Vector3(-1116, -2088, 50),
            Rotation(173, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400042,
			"eclipse_swat_van_besiege_04",
			{ 400038, 400039, 400040, 400041 },
			10
		),
        StreamHeist:gen_dummy(
            400044,
            "eclipse_besiege_swat_17",
            Vector3(-8317, -1038, 38),
            Rotation(115, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400045,
            "eclipse_besiege_swat_18",
            Vector3(-8281, -1112, 38),
            Rotation(115, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400046,
            "eclipse_besiege_swat_19",
            Vector3(-8344, -1070, 38),
            Rotation(115, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400047,
            "eclipse_besiege_swat_20",
            Vector3(-8326, -1108, 38),
            Rotation(115, -0, -0),
            optsBesiegeDummy
        ),
        -- major ave. crossroad swat vans
		StreamHeist:gen_spawngroup(
			400048,
			"eclipse_swat_van_besiege_05",
			{ 400044, 400045, 400046, 400047 },
			20
		),
        StreamHeist:gen_dummy(
            400049,
            "eclipse_besiege_swat_21",
            Vector3(-7315, -2660, 50),
            Rotation(-160, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400050,
            "eclipse_besiege_swat_22",
            Vector3(-7241, -2632, 50),
            Rotation(-160, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400051,
            "eclipse_besiege_swat_23",
            Vector3(-7282, -2690, 50),
            Rotation(-160, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400052,
            "eclipse_besiege_swat_24",
            Vector3(-7240, -2673, 50),
            Rotation(-160, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400053,
			"eclipse_swat_van_besiege_06",
			{ 400049, 400050, 400051, 400052 },
			20
		),
        -- easy st. swat vans
        StreamHeist:gen_dummy(
            400054,
            "eclipse_besiege_swat_25",
            Vector3(-8283, -8506, 38),
            Rotation(135, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400055,
            "eclipse_besiege_swat_26",
            Vector3(-8236, -8552, 38),
            Rotation(135, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400056,
            "eclipse_besiege_swat_27",
            Vector3(-8301, -8540, 38),
            Rotation(135, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400057,
            "eclipse_besiege_swat_28",
            Vector3(-8270, -8571, 38),
            Rotation(135, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400058,
			"eclipse_swat_van_besiege_07",
			{ 400054, 400055, 400056, 400057 },
			10
		),
        StreamHeist:gen_dummy(
            400059,
            "eclipse_besiege_swat_29",
            Vector3(-9177, -8072, 50),
            Rotation(-137, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400060,
            "eclipse_besiege_swat_30",
            Vector3(-9230, -8122, 50),
            Rotation(-137, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400061,
            "eclipse_besiege_swat_31",
            Vector3(-9195, -8135, 50),
            Rotation(-137, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400062,
            "eclipse_besiege_swat_32",
            Vector3(-9166, -8107, 50),
            Rotation(-137, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400063,
			"eclipse_swat_van_besiege_08",
			{ 400059, 400060, 400061, 400062 },
			10
		),
        StreamHeist:gen_dummy(
            400064,
            "eclipse_besiege_swat_33",
            Vector3(-8352, -11690, 38),
            Rotation(-163, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400065,
            "eclipse_besiege_swat_34",
            Vector3(-8274, -11667, 38),
            Rotation(-163, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400066,
            "eclipse_besiege_swat_35",
            Vector3(-8322, -11714, 38),
            Rotation(-163, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400067,
            "eclipse_besiege_swat_36",
            Vector3(-8279, -11703, 38),
            Rotation(-163, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400068,
			"eclipse_swat_van_besiege_09",
			{ 400064, 400065, 400066, 400067 },
			15
		),
        StreamHeist:gen_areatrigger(
            400043,
            "eclipse_reached_easy_st_vans_trigger",
            Vector3(-9034, -7941, 38),
            Rotation(0, 0, 0),
            optsReachedSwatVansTrigger
        ),
        -- inkwell blockade swat van spawns
        StreamHeist:gen_dummy(
            400069,
            "eclipse_besiege_swat_37",
            Vector3(-9310, -15467, 50),
            Rotation(180, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400070,
            "eclipse_besiege_swat_38",
            Vector3(-9286, -15461, 50),
            Rotation(-173, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400071,
            "eclipse_besiege_swat_39",
            Vector3(-9229, -15444, 50),
            Rotation(-135, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400072,
            "eclipse_besiege_swat_40",
            Vector3(-9216, -15418, 50),
            Rotation(-135, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400073,
			"eclipse_swat_van_besiege_10",
			{ 400069, 400070, 400071, 400072 },
			10
		),
        StreamHeist:gen_dummy(
            400074,
            "eclipse_besiege_swat_41",
            Vector3(-8493, -15553, 38),
            Rotation(167, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400075,
            "eclipse_besiege_swat_42",
            Vector3(-8469, -15558, 38),
            Rotation(167, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400076,
            "eclipse_besiege_swat_43",
            Vector3(-8431, -15572, 38),
            Rotation(180, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400077,
            "eclipse_besiege_swat_44",
            Vector3(-8400, -15572, 38),
            Rotation(180, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400078,
			"eclipse_swat_van_besiege_11",
			{ 400074, 400075, 400076, 400077 },
			10
		),
        -- one inkwell spawngroup just to diverisify the directions that cops come from
        StreamHeist:gen_dummy(
            400079,
            "eclipse_besiege_swat_45",
            Vector3(-11868, -11613, 49),
            Rotation(-90, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400080,
            "eclipse_besiege_swat_46",
            Vector3(-11852, -11752, 49),
            Rotation(-90, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400081,
            "eclipse_besiege_swat_47",
            Vector3(-11930, -11650, 49),
            Rotation(-90, -0, -0),
            optsBesiegeDummy
        ),
        StreamHeist:gen_dummy(
            400082,
            "eclipse_besiege_swat_48",
            Vector3(-11922, -11718, 49),
            Rotation(-90, -0, -0),
            optsBesiegeDummy
        ),
		StreamHeist:gen_spawngroup(
			400083,
			"eclipse_inkwell_besiege_01",
			{ 400079, 400080, 400081, 400082 },
			15
		),
        StreamHeist:gen_areatrigger(
            400084,
            "eclipse_reached_easy_st_far_vans_trigger",
            Vector3(-8552, -10462, 38),
            Rotation(0, 0, 0),
            optsReachedFarSwatVansTrigger
        ),

        -- more scripted sniper spots
        StreamHeist:gen_dummy(
            400085,
            "eclipse_armitage_ave_sniper_01",
            Vector3(-8377, -9876, 1569),
            Rotation(0, 0, 0),
            optsArmitageSniper_01
        ),
        StreamHeist:gen_so(
            400086,
            "eclipse_armitage_ave_sniper_SO_01",
            Vector3(-8461, -9021, 1573),
            Rotation(0, 0, -0),
            optsSniperSO
        ),
        StreamHeist:gen_dummy(
            400087,
            "eclipse_armitage_ave_sniper_02",
            Vector3(-15333, -11436, 2760),
            Rotation(0, 0, 0),
            optsArmitageSniper_02
        ),
        StreamHeist:gen_so(
            400088,
            "eclipse_armitage_ave_sniper_SO_02",
            Vector3(-15288, -10977, 2760),
            Rotation(0, 0, -0),
            optsSniperSO
        ),

        -- start assault later
        StreamHeist:gen_aiglobalevent(
            400089,
            "eclipse_start_besiege_event",
            optsBesiegeStart
        ),
        StreamHeist:gen_fakeassaultstate(
            400090,
            "eclipse_fakeassaultstate_001",
            true
        ),
    },
}