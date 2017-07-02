mobs:register_mob("mobs_loz:tektite", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 2,
	hp_min = 28,
	hp_max = 37,
	armor = 150,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.7, 0.2},
	--visual_size = {x=1.5, y=1.5},
	visual = "mesh",
	mesh = "tektite.b3d",
	textures = {
		{"mobs_tektite.png"},
	},
	makes_footstep_sound = false,
	view_range = 5,
	walk_velocity = 1.5,
	run_velocity = 2,
	jump = false,
	drops = {
		{name = "hyruletools:green_rupee",
		chance = 5, min = 1, max = 3},
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
		speed_normal = 12,
		speed_run = 15,
		stand_start = 20,
		stand_end = 30,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 1,
		punch_end = 20,
	},
})

mobs:register_egg("mobs_loz:tektite", "Blue Tektite", "wool_cyan.png", 1)

mobs:register_mob("mobs_loz:tektite2", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 28,
	hp_max = 37,
	armor = 150,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.7, 0.2},
	--visual_size = {x=1.5, y=1.5},
	visual = "mesh",
	mesh = "tektite.b3d",
	textures = {
		{"mobs_tektite2.png"},
	},
	makes_footstep_sound = false,
	view_range = 5,
	walk_velocity = 1.5,
	run_velocity = 2,
	jump = false,
	drops = {
		{name = "hyruletools:red_rupee",
		chance = 5, min = 1, max = 3},
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
		speed_normal = 12,
		speed_run = 15,
		stand_start = 20,
		stand_end = 30,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 1,
		punch_end = 20,
	},
})

mobs:register_egg("mobs_loz:tektite2", "Red Tektite", "wool_orange.png", 1)