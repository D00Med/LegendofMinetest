
mobs:register_mob("mobs_loz:stalchild", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 2,
	hp_min = 12,
	hp_max = 27,
	armor = 130,
	collisionbox = {-0.3, 0, -0.3, 0.3, 1.2, 0.3},
	visual = "mesh",
	mesh = "stalchild.b3d",
	textures = {
		{"mobs_stalchild.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	visual_scale = {x=0.8, y=0.8},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	do_custom = function(self)
		local pos = self.object:getpos()
		local light = minetest.get_node_light(pos)
		if light ~= nil then
		if light >= 14 then
			minetest.add_particlespawner({
			amount = 10,
			time = 0.5,
			minpos = {x=pos.x-0.2, y=pos.y-0.3, z=pos.z-0.2},
			maxpos = {x=pos.x+0.2, y=pos.y+0.5, z=pos.z+0.2},
			minvel = {x=-0.5, y=2, z=-0.5},
			maxvel = {x=0.5, y=4, z=0.5},
			minacc = {x=0, y=-7, z=0},
			maxacc = {x=0, y=-7, z=0},
			minexptime = 2,
			maxexptime = 3,
			minsize = 1,
			maxsize = 2,
			collisiondetection = true,
			texture = "default_dirt.png"
		})
		self.object:set_properties({physical = false})
		minetest.after(2, function()
			self.object:remove()
		end)
		end
		end
	end,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 1,
	fear_height = 3,
	animation = {
		speed_normal = 13,
		speed_run = 14,
		stand_start = 1,
		stand_end = 20,
		walk_start = 55,
		walk_end = 75,
		run_start = 55,
		run_end = 75,
		punch_start = 35,
		punch_end = 51,
	},
})

mobs:register_egg("mobs_loz:stalchild", "Stalchild", "quartz.png", 1)

mobs:register_mob("mobs_loz:stalchilled", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 22,
	hp_max = 37,
	armor = 120,
	collisionbox = {-0.3, 0, -0.3, 0.3, 1.2, 0.3},
	visual = "mesh",
	mesh = "stalchild.b3d",
	textures = {
		{"mobs_stalchilled.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 20,
	walk_velocity = 1.5,
	run_velocity = 2.5,
	jump = true,
	visual_scale = {x=0.8, y=0.8},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	do_custom = function(self)
		local pos = self.object:getpos()
		local light = minetest.get_node_light(pos)
		if light ~= nil then
		if light <= 10 then
			minetest.add_particlespawner({
			amount = 10,
			time = 0.5,
			minpos = {x=pos.x-0.2, y=pos.y-0.3, z=pos.z-0.2},
			maxpos = {x=pos.x+0.2, y=pos.y+0.5, z=pos.z+0.2},
			minvel = {x=-0.5, y=2, z=-0.5},
			maxvel = {x=0.5, y=4, z=0.5},
			minacc = {x=0, y=-7, z=0},
			maxacc = {x=0, y=-7, z=0},
			minexptime = 2,
			maxexptime = 3,
			minsize = 1,
			maxsize = 2,
			collisiondetection = true,
			texture = "default_ice.png"
		})
		self.object:set_properties({physical = false})
		minetest.after(2, function()
			self.object:remove()
		end)
		end
		end
	end,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 1,
	fear_height = 3,
	animation = {
		speed_normal = 13,
		speed_run = 14,
		stand_start = 1,
		stand_end = 20,
		walk_start = 55,
		walk_end = 75,
		run_start = 55,
		run_end = 75,
		punch_start = 35,
		punch_end = 51,
	},
})

mobs:register_egg("mobs_loz:stalchilled", "Stalchilled", "wool_cyan.png", 1)

mobs:register_mob("mobs_loz:stalchild_dark", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 22,
	hp_max = 37,
	armor = 100,
	collisionbox = {-0.3, -0.1, -0.3, 0.3, 1.3, 0.3},
	visual = "mesh",
	mesh = "stalchild.b3d",
	textures = {
		{"mobs_stalchild_dark.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	visual_scale = {x=1, y=1},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
		minetest.env:add_entity(pos, "experience:orb")
	end,
	do_custom = function(self)
		local pos = self.object:getpos()
		local light = minetest.get_node_light(pos)
		if light ~= nil then
		if light >= 14 then
			minetest.add_particlespawner({
			amount = 10,
			time = 0.5,
			minpos = {x=pos.x-0.2, y=pos.y-0.3, z=pos.z-0.2},
			maxpos = {x=pos.x+0.2, y=pos.y+0.5, z=pos.z+0.2},
			minvel = {x=-0.5, y=2, z=-0.5},
			maxvel = {x=0.5, y=4, z=0.5},
			minacc = {x=0, y=-7, z=0},
			maxacc = {x=0, y=-7, z=0},
			minexptime = 2,
			maxexptime = 3,
			minsize = 1,
			maxsize = 2,
			collisiondetection = true,
			texture = "default_lava.png"
		})
		self.object:set_properties({physical = false})
		minetest.after(2, function()
			self.object:remove()
		end)
		end
		end
	end,
	water_damage = 1,
	lava_damage = 0,
	light_damage = 2,
	fear_height = 5,
	animation = {
		speed_normal = 13,
		speed_run = 14,
		stand_start = 1,
		stand_end = 20,
		walk_start = 55,
		walk_end = 75,
		run_start = 55,
		run_end = 75,
		punch_start = 35,
		punch_end = 51,
	},
})

mobs:register_egg("mobs_loz:stalchild_dark", "Dark Stalchild", "default_obsidian.png", 1)