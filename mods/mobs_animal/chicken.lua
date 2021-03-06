
-- Chicken by JK Murray


--cucco.b3d, cucco.png CC-BY-SA 3.0 UNPORTED Created by toby109tt(aka tobyplowy) and D00Med

mobs:register_mob("mobs_animal:chicken", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	reach = 2,
	damage = 5,
	hp_min = 50,
	hp_max = 90,
	armor = 0,
	collisionbox = {-0.25, -0.05, -0.25, 0.25, 0.5, 0.25},
	visual = "mesh",
	visual_size = {x=1.2, y=1.2},
	mesh = "cucco.b3d",
	-- seems a lot of textures but this fixes the problem with the model
	textures = {
		{"mobs_cucco.png"},
	},
	child_texture = {
		{"mobs_cucco_chick.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_chicken",
	},
	walk_velocity = 0.5,
	run_velocity = 3.5,
	jump = true,
	jump_height = 4,
	drops = {
		{name = "mobs:chicken_raw", chance = 1, min = 2, max = 2},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -8,
	fear_height = 5,
	animation = {
		speed_normal = 10,
		speed_run = 33,
		stand_start = 1,
		stand_end = 15,
		walk_start = 20,
		walk_end = 40,
		run_start = 50,
		run_end = 70,
	},
	follow = {"farming:seed_wheat", "farming:seed_cotton"},
	view_range = 5,
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,

	do_custom = function(self)

		if self.child
		or math.random(1, 5000) > 1 then
			return
		end

		local pos = self.object:getpos()

		minetest.add_item(pos, "mobs:egg")

		minetest.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
})

mobs:register_mob("mobs_animal:chicken_evil", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 5,
	hp_min = 50,
	hp_max = 90,
	armor = 10,
	collisionbox = {-0.25, -0.05, -0.25, 0.25, 0.5, 0.25},
	visual = "mesh",
	mesh = "cucco.b3d",
	-- seems a lot of textures but this fixes the problem with the model
	textures = {
		{"mobs_cucco.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_chicken",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "mobs:chicken_raw", chance = 1, min = 2, max = 2},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -1,
	fear_height = 5,
	animation = {
		speed_normal = 12,
		speed_run = 17,
		stand_start = 1,
		stand_end = 15,
		walk_start = 20,
		walk_end = 40,
		run_start = 50,
		run_end = 70,
	},
	view_range = 5,
	on_punch = function(self)
		local pos = self.object:get_pos()
		minetest.env:add_entity({x=pos.x+1, y=pos.y, z=pos.z+1}, "mobs_animal:chicken_evil")
		minetest.env:add_entity({x=pos.x-2, y=pos.y, z=pos.z+1}, "mobs_animal:chicken_evil")
		minetest.env:add_entity({x=pos.x+1, y=pos.y, z=pos.z-2}, "mobs_animal:chicken_evil")
		minetest.env:add_entity({x=pos.x-1, y=pos.y, z=pos.z-1}, "mobs_animal:chicken_evil")
		minetest.env:add_entity({x=pos.x, y=pos.y, z=pos.z+1}, "mobs_animal:chicken_evil")
		minetest.env:add_entity({x=pos.x+1, y=pos.y, z=pos.z}, "mobs_animal:chicken_evil")
	end,
	on_activate = function(self)
		minetest.after(60, function()
			self.object:remove()
		end)
	end,
})

mobs:register_spawn("mobs_animal:chicken",
	{"default:dirt_with_grass", "ethereal:bamboo_dirt"}, 20, 10, 15000, 1, 31000, true)

mobs:register_egg("mobs_animal:chicken", "Cucco", "mobs_chicken_inv.png", 0)

-- compatibility
mobs:alias_mob("mobs:chicken", "mobs_animal:chicken")

-- egg entity

mobs:register_arrow("mobs_animal:egg_entity", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"mobs_chicken_egg.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_node = function(self, pos, node)

		local num = math.random(1, 10)

		if num == 1 then

			pos.y = pos.y + 1

			local nod = minetest.get_node_or_nil(pos)

			if not nod
			or not minetest.registered_nodes[nod.name]
			or minetest.registered_nodes[nod.name].walkable == true then
				return
			end

			local mob = minetest.add_entity(pos, "mobs_animal:chicken")
			local ent2 = mob:get_luaentity()

			mob:set_properties({
				textures = ent2.child_texture[1],
				visual_size = {
					x = ent2.base_size.x / 2,
					y = ent2.base_size.y / 2
				},
				collisionbox = {
					ent2.base_colbox[1] / 2,
					ent2.base_colbox[2] / 2,
					ent2.base_colbox[3] / 2,
					ent2.base_colbox[4] / 2,
					ent2.base_colbox[5] / 2,
					ent2.base_colbox[6] / 2
				},
			})

			ent2.child = true
			ent2.tamed = true
			ent2.owner = self.playername
		end
	end
})

-- egg throwing item

local egg_GRAVITY = 9
local egg_VELOCITY = 19

-- shoot egg
local mobs_shoot_egg = function (item, player, pointed_thing)

	local playerpos = player:getpos()

	minetest.sound_play("default_place_node_hard", {
		pos = playerpos,
		gain = 1.0,
		max_hear_distance = 5,
	})

	local obj = minetest.add_entity({
		x = playerpos.x,
		y = playerpos.y +1.5,
		z = playerpos.z
	}, "mobs_animal:egg_entity")

	local ent = obj:get_luaentity()
	local dir = player:get_look_dir()

	ent.velocity = egg_VELOCITY -- needed for api internal timing
	ent.switch = 1 -- needed so that egg doesn't despawn straight away

	obj:setvelocity({
		x = dir.x * egg_VELOCITY,
		y = dir.y * egg_VELOCITY,
		z = dir.z * egg_VELOCITY
	})

	obj:setacceleration({
		x = dir.x * -3,
		y = -egg_GRAVITY,
		z = dir.z * -3
	})

	-- pass player name to egg for chick ownership
	local ent2 = obj:get_luaentity()
	ent2.playername = player:get_player_name()

	item:take_item()

	return item
end

-- egg
minetest.register_node(":mobs:egg", {
	description = "Chicken Egg",
	tiles = {"mobs_cucco_egg.png"},
	inventory_image  = "mobs_cucco_egg.png",
	visual_scale = 0.7,
	drawtype = "plantlike",
	wield_image = "mobs_cucco_egg.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {snappy = 2, dig_immediate = 3},
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "mobs:egg", param2 = 1})
		end
	end,
	on_use = mobs_shoot_egg
})

-- fried egg
minetest.register_craftitem(":mobs:chicken_egg_fried", {
description = "Fried Egg",
	inventory_image = "mobs_chicken_egg_fried.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobs:egg",
	output = "mobs:chicken_egg_fried",
})

-- raw chicken
minetest.register_craftitem(":mobs:chicken_raw", {
description = "Raw Cucco Meat",
	inventory_image = "mobs_chicken_raw.png",
	on_use = minetest.item_eat(2),
})

-- cooked chicken
minetest.register_craftitem(":mobs:chicken_cooked", {
description = "Cooked Cucco Meat",
	inventory_image = "mobs_chicken_cooked.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobs:chicken_raw",
	output = "mobs:chicken_cooked",
})
