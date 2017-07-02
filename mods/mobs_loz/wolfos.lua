-- Wolfos by D00Med
-- edit of Dirt Monster by PilzAdam

minetest.register_craftitem("mobs_loz:wolfos_tear", {
	description = "Wolfos Tear",
	inventory_image = "mobs_wolfostear.png",
})

mobs:register_mob("mobs_loz:wolfos", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2.5,
	damage = 4,
	hp_min = 30,
	hp_max = 47,
	armor = 100,
	collisionbox = {-0.5, -0, -0.5, 0.5, 1, 0.5},
	--visual_size = {x=1.5, y=1.5},
	visual = "mesh",
	mesh = "wolfos.b3d",
	textures = {
		{"mobs_wolfos.png"},
	},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1.3,
	run_velocity = 3,
	drops = {
		{name = "hyruletools:green_rupee",
		chance = 5, min = 1, max = 3},
		{name = "mobs_loz:wolfos_tear",
		chance = 50, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 14,
		speed_run = 18,
		stand_start = 1,
		stand_end = 20,
		walk_start = 45,
		walk_end = 65,
		run_start = 45,
		run_end = 65,
		punch_start = 20,
		punch_end = 40,
	},
})

mobs:register_egg("mobs_loz:wolfos", "Wolfos", "wool_grey.png", 1)

mobs:register_mob("mobs_loz:wolfos2", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2.5,
	damage = 4,
	hp_min = 40,
	hp_max = 77,
	armor = 100,
	collisionbox = {-0.5, -0, -0.5, 0.5, 1, 0.5},
	--visual_size = {x=1.5, y=1.5},
	visual = "mesh",
	mesh = "wolfos.b3d",
	textures = {
		{"mobs_wolfos2.png"},
	},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1.3,
	run_velocity = 3,
	drops = {
		{name = "hyruletools:blue_rupee",
		chance = 5, min = 1, max = 3},
		{name = "mobs_loz:wolfos_tear",
		chance = 50, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 14,
		speed_run = 18,
		stand_start = 1,
		stand_end = 20,
		walk_start = 45,
		walk_end = 65,
		run_start = 45,
		run_end = 65,
		punch_start = 20,
		punch_end = 40,
	},
})

mobs:register_egg("mobs_loz:wolfos2", "White Wolfos", "wool_cyan.png", 1)