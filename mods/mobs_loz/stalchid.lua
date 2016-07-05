
-- Dirt Monster by PilzAdam

mobs:register_mob("mobs_loz:stalchid", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	damage = 2,
	hp_min = 3,
	hp_max = 27,
	armor = 100,
	collisionbox = {-0.2, -0.7, -0.2, 0.2, 0.7, 0.2},
	visual = "mesh",
	mesh = "mobs_stalchid.b3d",
	textures = {
		{"mobs_stalchid.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 0.8,
	run_velocity = 1.4,
	jump = true,
	drops = {
		{name = "hyruletools:heart",
		chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 24,
		speed_run = 35,
		stand_start = 29,
		stand_end = 40,
		walk_start = 4,
		walk_end = 26,
		run_start = 4,
		run_end = 26,
		punch_start = 40,
		punch_end = 55,
	},
})

mobs:register_spawn("mobs_loz:stalchid", {"default:dirt_with_grass", "default:dirt_with_dry_grass", "default:dirt_with_grass2", "default:dirt_with_grass3"}, 7, 0, 7000, 2, 31000)

mobs:register_egg("mobs_loz:stalchid", "Stalchid", "quartz.png", 1)