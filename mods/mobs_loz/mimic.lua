-- Mimic by D00Med
-- edit of Dirt Monster by PilzAdam

minetest.register_node("mobs_loz:mimic_chest", {
	description = "Mimic Chest",
	tiles = {"hyrule_mapgen_chest_top.png", "hyrule_mapgen_chest_top.png", "hyrule_mapgen_chest_side.png",
		"hyrule_mapgen_chest_side.png", "hyrule_mapgen_chest_side.png", "hyrule_mapgen_chest.png"},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.25, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.375, 0.5, 0.4375, 0.375}, -- NodeBox2
			{-0.5, 0.25, -0.4375, 0.5, 0.375, 0.4375}, -- NodeBox3
			{-0.5, 0.4375, -0.3125, 0.5, 0.5, 0.3125}, -- NodeBox4
		}
	},
	groups = {cracky=4},
	on_rightclick = function(pos, node, clicker)
		minetest.env:remove_node(pos)
		minetest.env:add_entity(pos, "mobs_loz:mimic")
	end
})

minetest.register_node("mobs_loz:mimic_chest2", {
	description = "Mimic Chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.25, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.375, 0.5, 0.4375, 0.375}, -- NodeBox2
			{-0.5, 0.25, -0.4375, 0.5, 0.375, 0.4375}, -- NodeBox3
			{-0.5, 0.4375, -0.3125, 0.5, 0.5, 0.3125}, -- NodeBox4
		}
	},
	groups = {cracky=4},
	on_rightclick = function(pos, node, clicker)
		minetest.env:remove_node(pos)
		minetest.env:add_entity(pos, "mobs_loz:mimic2")
	end
})

mobs:register_mob("mobs_loz:mimic", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 10,
	hp_max = 27,
	armor = 130,
	collisionbox = {-0.5, 0, -0.5, 0.5, 1, 0.5},
	visual = "mesh",
	mesh = "mimic.b3d",
	textures = {
		{"mobs_mimic.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 3.5,
	walk_velocity = 0.01,
	run_velocity = 2,
	jump = false,
	jump_height = 0,
	drops = {
		{name = "hyruletools:red_rupee",
		chance = 4, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	do_custom = function(self)
		if self.state ~= "attack" then
			minetest.after(3, function()
			if self.state ~= "attack" and self.object ~= nil then
			local pos = self.object:getpos()
			if pos ~= nil then
			minetest.set_node(pos, {name="mobs_loz:mimic_chest", param2=1})
			self.object:remove()
			end
			end
			end)
		end
	end,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 13,
		speed_run = 15,
		stand_start = 0,
		stand_end = 1,
		walk_start = 0,
		walk_end = 1,
		run_start = 0,
		run_end = 1,
		punch_start = 1,
		punch_end = 14,
	},
})

mobs:register_mob("mobs_loz:mimic2", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 10,
	hp_max = 27,
	armor = 130,
	collisionbox = {-0.5, 0, -0.5, 0.5, 1, 0.5},
	visual = "mesh",
	mesh = "mimic.b3d",
	textures = {
		{"mobs_mimic2.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 3.5,
	walk_velocity = 0.01,
	run_velocity = 2,
	jump = false,
	jump_height = 0,
	drops = {
		{name = "hyruletools:red_rupee",
		chance = 4, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	do_custom = function(self)
		if self.state ~= "attack" then
			minetest.after(3, function()
			if self.state ~= "attack" and self.object ~= nil then
			local pos = self.object:getpos()
			if pos ~= nil then
			minetest.set_node(pos, {name="mobs_loz:mimic_chest2", param2=1})
			self.object:remove()
			end
			end
			end)
		end
	end,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 13,
		speed_run = 15,
		stand_start = 0,
		stand_end = 1,
		walk_start = 0,
		walk_end = 1,
		run_start = 0,
		run_end = 1,
		punch_start = 1,
		punch_end = 14,
	},
})

--mobs:register_spawn("mobs_loz:mimic", {"default:cobblestone", "default:sandstone_brick", "default:stone_brick"}, 7, 0, 7000, 2, 31000)

--mobs:register_egg("mobs_loz:mimic", "Mimic", "default_chest_front.png", 1)