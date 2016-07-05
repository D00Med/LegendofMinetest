
-- Ghost by BlockMen
if minetest.setting_getbool("loz_mode") then	
mobs:register_mob("ghost:ghost", {
	type = "monster",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 7,
	hp_max = 12,
	armor = 130,
	collisionbox = {-0.3, -0.5, -0.3, 0.3, 0.75, 0.3},
	visual = "mesh",
	mesh = "creatures_mob.x",
	textures = {
		{"creatures_ghost.png"},
	},
	blood_texture = "tnt_smoke.png",
	visual_size = {x=1, y=1},
	makes_footstep_sound = false,
	sounds = {
		random = "creatures_ghost",
		damage = "creatures_ghost_hit",
		death = "creatures_ghost_death"
	},
	walk_velocity = 2,
	run_velocity = 2,
	fall_speed = 0,
	jump = true,
	fly = true,
	fly_in = "air",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 2,
	view_range = 14,
	drops = {
		{name = "ghost:soul",
		chance = 5, min = 1, max = 1},
	},
	animation = {
		speed_normal = 30,		speed_run = 30,
		walk_start = 168,		walk_end = 187,

	},
})

mobs:register_spawn("ghost:ghost", {"default:dirt_with_grass","default:dirt_with_grass3","default:dirt_with_grass2"}, 5, 0, 7000, 1, 31000)

mobs:register_egg("ghost:ghost", "Poe", "ghost_soul.png", 1)

minetest.register_craftitem("ghost:soul", {
	description = "Poe soul",
	inventory_image = "ghost_soul.png"
})

minetest.register_craft({
	output = 'bucket:bucket_empty',
	recipe = {
		{'', '', ''},
		{'ghost:soul', '', 'ghost:soul'},
		{'', 'ghost:soul', ''},
	}
})
end