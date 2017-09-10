
mobs:register_mob("mobs_loz:zol", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	damage = 1,
	hp_min = 10,
	hp_max = 15,
	armor = 130,
	collisionbox = {-0.2, -0, -0.2, 0.2, 0.4, 0.2},
	visual_size = {x=1.5, y=1.5},
	visual = "mesh",
	mesh = "zol.b3d",
	textures = {
		{"mobs_zol.png"},
		{"mobs_zol2.png"},
	},
	blood_texture = "mobs_slime.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 0.5,
	run_velocity = 1,
	jumpheight = 5,
	on_die = function(self)
		local pos = self.object:getpos()
		local obj = minetest.add_entity({x=pos.x+1, y=pos.y+0.5, z=pos.z+1}, "mobs_loz:little_zol")
		local obj = minetest.add_entity({x=pos.x-1, y=pos.y+0.5, z=pos.z-1}, "mobs_loz:little_zol")
		local obj = minetest.add_entity({x=pos.x-1, y=pos.y+0.5, z=pos.z+1}, "mobs_loz:little_zol")
		local obj = minetest.add_entity({x=pos.x+1, y=pos.y+0.5, z=pos.z-1}, "mobs_loz:little_zol")
	end,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 10,
		stand_end = 20,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 1,
		punch_end = 20,
	},
})

mobs:register_mob("mobs_loz:little_zol", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	damage = 1,
	hp_min = 10,
	hp_max = 15,
	armor = 130,
	collisionbox = {-0.2, -0, -0.2, 0.2, 0.4, 0.2},
	visual_size = {x=0.8, y=0.8},
	visual = "mesh",
	mesh = "zol.b3d",
	textures = {
		{"mobs_zol.png"},
	},
	blood_texture = "mobs_slime.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 0.5,
	run_velocity = 1,
	jumpheight = 5,
	drops = {
		{name = "hyruletools:green_rupee",
		chance = 2, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,4) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 10,
		stand_end = 20,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 1,
		punch_end = 20,
	},
})

mobs:register_egg("mobs_loz:zol", "Zol", "mobs_zol.png", 1)