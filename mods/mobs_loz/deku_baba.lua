-- Deku_Baba by D00Med
-- edit of Dirt Monster by PilzAdam

mobs:register_mob("mobs_loz:deku_baba", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 2,
	hp_min = 3,
	hp_max = 27,
	armor = 100,
	collisionbox = {-0.3, -1, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "deku_baba.b3d",
	textures = {
		{"dekubaba.png"},
	},
	blood_texture = "default_dry_grass.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 5,
	walk_velocity = 0.01,
	run_velocity = 0.05,
	jump = false,
	drops = {
		{name = "hyruletools:heart",
		chance = 1, min = 3, max = 5},
		{name = "hyruletools:red_rupee",
		chance = 1, min = 1, max = 3},
	},
	water_damage = -1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 13,
		walk_start = 1,
		walk_end = 13,
		run_start = 1,
		run_end = 13,
		punch_start = 13,
		punch_end = 33,
	},
})

mobs:register_spawn("mobs_loz:deku_baba", {"default:dirt_with_grass", "ethereal:gray_dirt", "default:dirt_with_grass3", "default:dirt_with_grass2"}, 7, 0, 7000, 2, 31000)

mobs:register_egg("mobs_loz:deku_baba", "Deku_Baba", "default_dry_grass.png", 1)