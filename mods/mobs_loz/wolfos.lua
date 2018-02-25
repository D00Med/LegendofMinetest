-- Wolfos by D00Med
-- edit of Dirt Monster by PilzAdam


minetest.register_node("mobs_loz:wolfos_tear", {
	description = "Wolfos Tear",
	inventory_image = "mobs_wolfostear.png",
	wield_image = "mobs_wolfostear.png",
	drawtype = "plantlike",
	tiles = {{
		name = "mobs_wolfostear_anim.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.00},
	}},
	paramtype = "light",
	light_source = 9,
	selection_box = {
	type = "fixed",
	fixed = {-0.2,-0.2,-0.2,0.2,0.2,0.2},
	},
	groups = {cracky=1, oddly_breakeable_by_hand=1, dig_immediate=3},
	use_texture_alpha = true,
	walkable = false,
	drop = "",
	on_destruct = function(pos, oldnode)
		minetest.add_item(pos, "mobs_loz:wolfos_tear")
	end,
})

minetest.register_abm({
	nodenames = {"mobs_loz:wolfos_tear"},
	interval = 0.5,
	chance = 1,
	action = function(pos, node)
		local p = pos
		for i=1,8 do
		minetest.after(i/10, function()
		if p == nil then return end
		minetest.add_particle({
			pos = {x=p.x+(math.random(-8,8)/100), y=p.y+(math.random(-8,8)/100), z=p.z+(math.random(-8,8)/100)},
			velocity = {x=0, y=0.5, z=0},
			acceleration = {x=0, y=1, z=0},
			expirationtime = 0.8,
			size = 1,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "experience_glow.png",
			animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = 0.8},
			glow = 14
		})
		end)
		end
	end,
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
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		if math.random(1,50) == 1 then 
			minetest.set_node(self.object:getpos(), {name="mobs_loz:wolfos_tear"})
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

mobs:register_mob("mobs_loz:wolfos_tower", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2.5,
	damage = 4,
	hp_min = 60,
	hp_max = 87,
	armor = 90,
	collisionbox = {-0.5, -0, -0.5, 0.5, 1, 0.5},
	--visual_size = {x=1.5, y=1.5},
	visual = "mesh",
	mesh = "wolfos.b3d",
	textures = {
		{"mobs_wolfos_tower.png"},
	},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 1.6,
	run_velocity = 3.2,
	drops = {
		{name = "loot:key",
		chance = 5, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		if math.random(1,50) == 1 then 
			minetest.set_node(self.object:getpos(), {name="mobs_loz:wolfos_tear"})
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 1,
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

mobs:register_egg("mobs_loz:wolfos_tower", "Tower Wolfos", "default_dirt.png", 1)