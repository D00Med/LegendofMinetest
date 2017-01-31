
mobs:register_mob("mobs_loz:poe", {
	type = "monster",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 12,
	hp_max = 22,
	armor = 110,
	collisionbox = {-0.3, 0, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "poe.b3d",
	textures = {
		{"mobs_poe.png"},
		{"mobs_poe2.png"},
		{"mobs_poe3.png"},
	},
	visual_size = {x=1.2, y=1.2},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 2,
	fall_speed = 0,
	fly = true,
	fly_in = "air",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 1,
	view_range = 10,
	drops = {
		{name = "mobs_loz:soul",
		chance = 2, min = 1, max = 1},
		{name = "hyruletools:lantern",
		chance = 5, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		minetest.env:add_entity(pos, "experience:orb")
	end,
	animation = {
	speed_normal = 12,
	speed_run = 12,
	walk_start = 1,
	walk_end = 20,
	punch_start = 20,
	punch_end = 40,
	},
})

mobs:register_egg("mobs_loz:poe", "Poe", "mobs_poe_soul.png", 1)

minetest.register_craftitem("mobs_loz:soul", {
	description = "Poe soul",
	inventory_image = "mobs_poe_soul.png"
})

minetest.register_craft({
	output = 'bucket:bucket_empty',
	recipe = {
		{'', '', ''},
		{'mobs_loz:soul', '', 'mobs_loz:soul'},
		{'', 'mobs_loz:soul', ''},
	}
})