
mobs:register_mob("mobs_loz:business_scrub", {
	type = "monster",
	attack_type = "shoot",
	arrow = "mobs_loz:deku_nut",
	shoot_interval = 1.5,
	shoot_offset = 1.5,
	hp_min = 10,
	hp_max = 25,
	armor = 150,
	collisionbox = {-0.4, -0.1, -0.2, 0.2, 0.4, 0.2},
	visual = "mesh",
	mesh = "business_scrub.b3d",
	textures = {
		{"mobs_business_scrub.png"},
	},
	visual_size = {x=1, y=1},
	blood_texture = "default_wood.png",
	view_range = 10,
	walk_velocity = 0.001,
	run_velocity = 0.001,
	jump = false,
	jump_height = 0,
	knock_back = 0,
	makes_footstep_sound = false,
	drops = {
		{name = "mobs_loz:nut",
		chance = 9, min = 1, max = 2},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		local obj = minetest.env:add_entity(pos, "mobs_loz:business_scrub_standing")
	end,
	on_activate = function(self)
		set_animation(self, "stand")
	end,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "farming:carrot" then
		item:take_item()
		clicker:set_wielded_item(item)
		local pos = self.object:getpos()
		minetest.add_particlespawner({
			amount = 3,
			time = 1.5,
			minpos = {x=pos.x-0.2, y=pos.y+0.5, z=pos.z-0.2},
			maxpos = {x=pos.x+0.2, y=pos.y+0.1, z=pos.z+0.2},
			minvel = {x=-1, y=2, z=-1},
			maxvel = {x=1, y=4, z=1},
			minacc = {x=0, y=-7, z=0},
			maxacc = {x=0, y=-7, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 1,
			maxsize = 2,
			collisiondetection = false,
			texture = "hyruletools_heart.png"
		})
		minetest.env:add_entity(pos, "mobs_loz:business_scrub_passive")
		self.object:remove()
		end
	end,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 28,
		stand_end = 28,
		walk_start = 28,
		walk_end = 28,
		run_start = 28,
		run_end = 28,
		shoot_start = 28,
		shoot_end = 57,
	},
})

mobs:register_egg("mobs_loz:business_scrub", "Business Scrub", "default_leaves.png", 1)


mobs:register_mob("mobs_loz:business_scrub_standing", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 2,
	attack_type = "shoot",
	arrow = "mobs_loz:nut",
	shoot_interval = 0.5,
	shoot_offset = 0.5,
	hp_min = 10,
	hp_max = 25,
	armor = 90,
	collisionbox = {-0.4, 0, -0.2, 0.2, 1, 0.2},
	visual = "mesh",
	mesh = "business_scrub.b3d",
	textures = {
		{"mobs_business_scrub.png"},
	},
	visual_size = {x=1, y=1},
	blood_texture = "default_wood.png",
	view_range = 10,
	walk_velocity = 0.001,
	run_velocity = 0.001,
	walk_chance = 0,
	knock_back = 0,
	jump = false,
	jump_height = 0,
	makes_footstep_sound = false,
	drops = {
		{name = "mobs_loz:nut",
		chance = 9, min = 1, max = 2},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 1,
		stand_end = 20,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		shoot_start = 28,
		shoot_end = 57,
	},
		on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		
		if item:get_name() == "hyruletools:green_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:leaves"})
		elseif item:get_name() == "hyruletools:blue_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:stick"})
		
		elseif item:get_name() == "hyruletools:blue_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:stick"})
		elseif item:get_name() == "hyruletools:red_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:dirt"})
			end
		end,
})

mobs:register_mob("mobs_loz:business_scrub_passive", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 2,
	attack_type = "shoot",
	arrow = "mobs_loz:nut",
	shoot_interval = 0.5,
	shoot_offset = 0.5,
	hp_min = 10,
	hp_max = 25,
	armor = 90,
	collisionbox = {-0.4, 0, -0.2, 0.2, 1, 0.2},
	visual = "mesh",
	mesh = "business_scrub.b3d",
	textures = {
		{"mobs_business_scrub.png"},
	},
	runaway = true,
	knock_back = 1,
	runaway_timer = 20,
	visual_size = {x=1, y=1},
	blood_texture = "default_wood.png",
	view_range = 10,
	walk_velocity = 1.5,
	run_velocity = 5,
	jump_height = 5,
	makes_footstep_sound = true,
	drops = {
		{name = "mobs_loz:nut",
		chance = 9, min = 1, max = 2},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 60,
		walk_end = 80,
		run_start = 60,
		run_end = 80,
	},
		on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		
		if item:get_name() == "farming:carrot" then
		item:take_item()
		clicker:set_wielded_item(item)
		local pos = self.object:getpos()
		minetest.add_particlespawner({
			amount = 3,
			time = 1.5,
			minpos = {x=pos.x-0.2, y=pos.y+0.9, z=pos.z-0.2},
			maxpos = {x=pos.x+0.2, y=pos.y+0.6, z=pos.z+0.2},
			minvel = {x=-1, y=2, z=-1},
			maxvel = {x=1, y=4, z=1},
			minacc = {x=0, y=-7, z=0},
			maxacc = {x=0, y=-7, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 2,
			maxsize = 3,
			collisiondetection = false,
			texture = "hyruletools_heart.png"
		})
		end
		
		if item:get_name() == "hyruletools:green_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:leaves"})
		elseif item:get_name() == "hyruletools:blue_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:stick"})
		
		elseif item:get_name() == "hyruletools:blue_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:stick"})
		elseif item:get_name() == "hyruletools:red_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:dirt"})
			end
		end,
})

mobs:register_mob("mobs_loz:business_scrub_passive2", {
	type = "animal",
	passive = true,
	reach = 1,
	damage = 2,
	attack_type = "shoot",
	arrow = "mobs_loz:nut",
	shoot_interval = 0.5,
	shoot_offset = 0.5,
	hp_min = 10,
	hp_max = 25,
	armor = 90,
	collisionbox = {-0.4, 0, -0.2, 0.2, 1, 0.2},
	visual = "mesh",
	mesh = "business_scrub.b3d",
	textures = {
		{"mobs_business_scrub_beard.png"},
	},
	runaway = true,
	knock_back = 1,
	runaway_timer = 20,
	visual_size = {x=1, y=1},
	blood_texture = "default_wood.png",
	view_range = 10,
	walk_velocity = 1.5,
	run_velocity = 5,
	jump_height = 5,
	makes_footstep_sound = true,
	drops = {
		{name = "mobs_loz:weird_beard",
		chance = 1, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 60,
		walk_end = 80,
		run_start = 60,
		run_end = 80,
	},
		on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		
		if item:get_name() == "hyruletools:green_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:leaves"})
		elseif item:get_name() == "hyruletools:blue_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:stick"})
		
		elseif item:get_name() == "hyruletools:blue_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:stick"})
		elseif item:get_name() == "hyruletools:red_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:dirt"})
			end
		end,
})

mobs:register_egg("mobs_loz:business_scrub_passive", "Business Scrub (passive)", "default_leaves.png", 1)

minetest.register_craftitem("mobs_loz:nut", {
	description = "Deku Nut",
	inventory_image = "mobs_nut.png",
})

minetest.register_craftitem("mobs_loz:weird_beard", {
	description = "Weird Beard",
	inventory_image = "mobs_weird_beard.png",
	groups = {not_in_creative_inventory=1}
})


