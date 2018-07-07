
local mg_name = minetest.get_mapgen_params().mgname or ""

if mg_name ~= "v6" then
dofile(minetest.get_modpath("hyrule_mapgen").."/mapgen.lua")
end

dofile(minetest.get_modpath("hyrule_mapgen").."/nodes.lua")
dofile(minetest.get_modpath("hyrule_mapgen").."/crafts.lua")


--village spawner

if minetest.setting_getbool("lom_devmode") then
minetest.register_craftitem("hyrule_mapgen:tower_spawner", {
	description = "Tower Floor Template Spawner",
	inventory_image = "hyrule_mapgen_spawner.png",
	on_place = function(itemstack, placer, pointed_thing)
		if not minetest.setting_getbool("lom_devmode") then
			minetest.chat_send_player(placer:get_player_name(), "Requires 'lom_devmode' to be 'true'")
			return
		end
		local pos = pointed_thing.above
		minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, minetest.get_modpath("hyrule_mapgen").."/schematics/tower_template.mts", 0, {}, true)
		itemstack:take_item()
		return itemstack
	end,
})
end

minetest.register_craftitem("hyrule_mapgen:village_spawner", {
	description = "Village Spawner",
	inventory_image = "hyrule_mapgen_spawner.png",
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, minetest.get_modpath("hyrule_mapgen").."/schematics/village.mts", 0, {}, true)
		local obj = minetest.env:add_entity({x=pos.x+14, y=pos.y+2, z=pos.z+24}, "mobs_npc:shopkeeper")
		
			local obj2 = minetest.env:add_entity({x=pos.x+3, y=pos.y+3, z=pos.z+9}, "mobs_npc:npc_custom")
			local npc2 = obj2:get_luaentity()
			npc2.text = "I'll trade you something cool for a 'weird beard'"
			npc2.reward_text = "Thanks!'"
			npc2.item = "hyruletools:gameboy"
			npc2.reward_item = "mobs_loz:weird_beard"
			npc2.skin = "mobs_npc_toby109tt.png"
			npc2.zdir = -1
			
			local obj3 = minetest.env:add_entity({x=pos.x+13, y=pos.y+3, z=pos.z+7}, "mobs_npc:npc_custom")
			local npc3 = obj3:get_luaentity()
			npc3.text = "I heard there is a strange land deep underground..."
			npc3.skin = "mobs_npc_old.png"
			
			local obj4 = minetest.env:add_entity({x=pos.x+17, y=pos.y+3, z=pos.z+5}, "mobs_npc:npc")
			local obj5 = minetest.env:add_entity({x=pos.x+7, y=pos.y+3, z=pos.z+12}, "mobs_npc:npc")
		
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_node("hyrule_mapgen:village_npc_spawner", {
	description = "Village NPC Spawner",
	drawtype = "allfaces",
	tiles = {
		"hyrule_mapgen_npc_spawn.png",
	},
	walkable = false,
	pointable = true,
	drop = "",
	groups = {not_in_creative_inventory=1},
	on_blast = function(pos, intensity)
	end,
	sunlight_propagates = false,
	paramtype = "light",
	buildable_to = true,
	is_ground_content = false,
})

minetest.register_node("hyrule_mapgen:village_shop_spawner", {
	description = "Village Shopkeeper Spawner",
	drawtype = "allfaces",
	tiles = {
		"hyrule_mapgen_npc_spawn.png^[colorize:cyan:100",
	},
	walkable = false,
	pointable = true,
	drop = "",
	groups = {not_in_creative_inventory=1},
	on_blast = function(pos, intensity)
	end,
	sunlight_propagates = false,
	paramtype = "light",
	buildable_to = true,
	is_ground_content = false,
})

minetest.register_node("hyrule_mapgen:village_quest_spawner", {
	description = "Village Quest NPC Spawner",
	drawtype = "allfaces",
	tiles = {
		"hyrule_mapgen_npc_spawn.png^[colorize:yellow:100",
	},
	walkable = false,
	pointable = true,
	drop = "",
	groups = {not_in_creative_inventory=1},
	on_blast = function(pos, intensity)
	end,
	sunlight_propagates = false,
	paramtype = "light",
	buildable_to = true,
	is_ground_content = false,
})

minetest.register_node("hyrule_mapgen:village_witch_spawner", {
	description = "Village Witch Spawner",
	drawtype = "allfaces",
	tiles = {
		"hyrule_mapgen_npc_spawn.png^[colorize:black:100",
	},
	walkable = false,
	pointable = true,
	drop = "",
	groups = {not_in_creative_inventory=1},
	on_blast = function(pos, intensity)
	end,
	sunlight_propagates = false,
	paramtype = "light",
	buildable_to = true,
	is_ground_content = false,
})

--functions
hyrule_mapgen = {}

function hyrule_mapgen.register_slope(name, desc, texture, craft)
minetest.register_node("hyrule_mapgen:slope_"..name, {
	description = desc.." Slope",
	sunlight_propagates = false,
	drawtype = "mesh",
	mesh = "moreblocks_slope.obj",
	tiles = texture,
		selection_box = {
			type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5, 0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25, 0.5,     0, 0.5},
		{-0.5,     0,     0, 0.5,  0.25, 0.5},
		{-0.5,  0.25,  0.25, 0.5,   0.5, 0.5}
	}
		},
		collision_box = {
			type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5, 0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25, 0.5,     0, 0.5},
		{-0.5,     0,     0, 0.5,  0.25, 0.5},
		{-0.5,  0.25,  0.25, 0.5,   0.5, 0.5}
	}
		},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1},
	on_place = minetest.rotate_node
})

minetest.register_node("hyrule_mapgen:corner_"..name, {
	description = desc.." Slope Corner",
	sunlight_propagates = false,
	drawtype = "mesh",
	mesh = "simplyslopes_slopecorner.obj",
	tiles = texture,
	selection_box = {
			type = "fixed",
			fixed = {
			  {-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5},
			  {-0.5, -0.1875, -0.1875, 0.5, 0.1875, 0.5},
			  {-0.5, 0.1875, 0.1875, 0.5, 0.5, 0.5},
			},
		},

		collision_box = {
			type = "fixed",
			fixed = {
			  {-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5},
			  {-0.5, -0.1875, -0.1875, 0.5, 0.1875, 0.5},
			  {-0.5, 0.1875, 0.1875, 0.5, 0.5, 0.5},
			},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1},
	on_place = minetest.rotate_node
})

minetest.register_craft({
	output = "hyrule_mapgen:slope_"..name,
	recipe = {
		{craft, "",},
		{craft, craft,}
	}
})

minetest.register_craft({
	output = "hyrule_mapgen:corner_"..name,
	recipe = {
		{"", craft,},
		{craft, craft,}
	}
})



end

hyrule_mapgen.register_slope("rroof", "Red Roof", {"kblocks_red.png"}, "kblocks:red")
hyrule_mapgen.register_slope("broof", "Blue Roof", {"kblocks_blue.png"}, "kblocks:blue")
hyrule_mapgen.register_slope("straw", "Straw Roof", {"farming_straw.png"}, "farming:straw")

--effects
minetest.register_lbm({
	name = "hyrule_mapgen:spawn_butterflies",
	nodenames = {"flowers:flower_rose", "flowers:flower_tulip", "flowers:flower_dandelion_yellow", "flowers:flower_viola", "flowers:flower_dandelion_white", "flowers:flower_geranium"},
	run_at_every_load = true,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if math.random(1,20) == 3 then
		minetest.env:add_entity({x=pos.x,y=pos.y+0.5,z=pos.z}, "hyrule_mapgen:butterfly")
		end
	end
})

minetest.register_lbm({
	name = "hyrule_mapgen:spawn_dragonflies",
	nodenames = {"moreplants:tallgrass", "moreplants:bulrush"},
	run_at_every_load = true,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if math.random(1,50) == 3 then
		minetest.env:add_entity({x=pos.x,y=pos.y+0.5,z=pos.z}, "hyrule_mapgen:dragonfly")
		end
	end
})

sound = false

minetest.register_abm({
	nodenames = {"hyrule_mapgen:crystal_1"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 19,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "hyrule_mapgen_crystal_glow1.png",
			animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.00},
			glow = 9
		})
	end
})

local function find_mob(pos, radius, mob_name)
		local objs = minetest.get_objects_inside_radius(pos, radius)
		for _, obj in ipairs(objs) do
			if obj:get_luaentity() ~= nil then
			if obj:get_luaentity().name == mob_name then 
			return true
			end
			end
		end
end

local function check_for_player(pos)
		local objs = minetest.get_objects_inside_radius(pos, 10)
		for _, obj in ipairs(objs) do
			if obj:is_player() then
				return true
			end
		end
end

local monster_list = {"mobs_loz:stalchild", "mobs_loz:keese", "mobs_loz:darknut", "mobs_loz:wolfos", "mobs_loz:deku_baba", "mobs_loz:armos", "mobs_loz:redead", "mobs_loz:skulltula"}
local monster_list2 = {"mobs_loz:dark_stalchild", "mobs_loz:ice_volvagia", "mobs_loz:keese_fire", "mobs_loz:keese_ice", "mobs_loz:darkernut", "mobs_loz:wolfos_tower", "mobs_loz:deku_baba_dry", "mobs_loz:gibido"}

minetest.register_lbm({
	name = "hyrule_mapgen:tower_spawns",
	nodenames = {"hyrule_mapgen:tower_spawner",},
	run_at_every_load = true,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if not check_for_player(pos) then return end
	
		if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "quartz:chiseled_immortal" then
			minetest.env:add_entity(pos, "mobs_loz:blade_x")
		return
		elseif minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "quartz:pillar_immortal" then
			minetest.env:add_entity(pos, "mobs_loz:blade_z")
		return
		elseif minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "quartz:wall_immortal" then
			minetest.env:add_entity(pos, "mobs_loz:armos")
		else
		local mob_number = math.random(1,8)
		local mob = ""
		if pos.y <= 800 then
		mob = monster_list[mob_number]
		else
		mob = monster_list2[mob_number]
		end
		if not find_mob(pos, 5, mob) then
			local obj = minetest.env:add_entity({x=pos.x+math.random(-4,4), y=pos.y+0.5, z=pos.z+math.random(-4,4)}, mob)
			local monster = obj:get_luaentity()
			local hp = monster.object:get_hp()
			monster.object:set_hp(hp+pos.y*0.2)
			monster.damage = monster.damage+pos.y*0.01
		end
		end
	end
})

minetest.register_lbm({
	name = "hyrule_mapgen:generate_tower",
	nodenames = {"hyrule_mapgen:tower_generator",},
	run_at_every_load = true,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.setting_getbool("lom_devmode") then
			return
		end
		local num = math.random(1,8)
		minetest.place_schematic({x=pos.x-15, y=pos.y+1,z=pos.z-15}, minetest.get_modpath("hyrule_mapgen").."/schematics/tower_"..num..".mts", 0, {["hyrule_mapgen:tower_dev"] = "hyrule_mapgen:tower_spawner",}, true)
		if pos ~= nil and minetest.get_node(pos).name == "hyrule_mapgen:tower_generator" then
			minetest.remove_node(pos)
		end
	end
})

minetest.register_abm({
	nodenames = {"hyrule_mapgen:crystal_2"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 19,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "hyrule_mapgen_crystal_glow2.png",
			animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.00},
			glow = 9
		})
	end
})

minetest.register_abm({
	nodenames = {"hyrule_mapgen:crystal_3"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 19,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "hyrule_mapgen_crystal_glow3.png",
			animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.00},
			glow = 9
		})
	end
})

minetest.register_abm({
	nodenames = {"default:water_flowing"},
	interval = 3.0,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
	
	if minetest.find_node_near(pos, 6, {"default:ice"}) and not minetest.find_node_near(pos, 6, {"hyrule_mapgen:lamp_lit", "fire:basic_flame"}) then
		minetest.set_node(pos, {name="hyrule_mapgen:ice_waterfall"})
		return
	end
	
		local above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		local below = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local above2 = minetest.get_node({x=pos.x, y=pos.y+2, z=pos.z}).name
		if above == "default:water_flowing" and below ~= "default:water_flowing" and above2 == "default:water_flowing" and minetest.find_nodes_in_area({x=pos.x-2, y=pos.y, z=pos.z-2}, {x=pos.x+2, y=pos.x+3, z=pos.z+2}, {"default:water_source"}) ~= nil then
		minetest.add_particlespawner({
			amount = 9,
			time = 2,
			minpos = {x=pos.x-0.9, y=pos.y+0.3, z=pos.z-0.9},
			maxpos = {x=pos.x+0.9, y=pos.y+0.9, z=pos.z+0.9},
			minvel = {x=0, y=0.1, z=0},
			maxvel = {x=0.1, y=0.3, z=0.1},
			minacc = {x=0, y=0.1, z=0},
			maxacc = {x=0.2, y=0.2, z=0.2},
			minexptime = 0.5,
			maxexptime = 1,
			minsize = 8,
			maxsize = 12,
			collisiondetection = false,
			vertical = false,
			texture = "hyrule_mapgen_mist.png",
		})
		minetest.add_particlespawner({
			amount = 9,
			time = 2,
			minpos = {x=pos.x-0.8, y=pos.y+0.7, z=pos.z-0.8},
			maxpos = {x=pos.x+0.8, y=pos.y+0.8, z=pos.z+0.8},
			minvel = {x=0, y=0.1, z=0},
			maxvel = {x=0.1, y=0.3, z=0.1},
			minacc = {x=0, y=0.5, z=0},
			maxacc = {x=0.1, y=0.9, z=0.1},
			minexptime = 0.2,
			maxexptime = 0.3,
			minsize = 7,
			maxsize = 9,
			collisiondetection = false,
			vertical = false,
			texture = "hyrule_mapgen_splash.png",
		})
		if not sound then
		minetest.sound_play("waterfall", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 3,
		})
		sound = true
		minetest.after(12, function()
			sound = false
		end)
		end
		end
	end
})

minetest.register_abm({
	nodenames = {"hyrule_mapgen:ice_waterfall"},
	interval = 2.0,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
	
	if minetest.find_node_near(pos, 6, {"fire:basic_flame", "hyrule_mapgen:lamp_lit"}) then
		minetest.set_node(pos, {name="default:water_flowing"})
	end
	--[[
	minetest.add_particlespawner({
			amount = 1,
			time = 2,
			minpos = {x=pos.x-1.3, y=pos.y+0.3, z=pos.z-1.3},
			maxpos = {x=pos.x+1.3, y=pos.y+0.9, z=pos.z+1.3},
			minvel = {x=0, y=0.1, z=0},
			maxvel = {x=0.1, y=0.3, z=0.1},
			minacc = {x=0, y=0.1, z=0},
			maxacc = {x=0.2, y=0.2, z=0.2},
			minexptime = 0.5,
			maxexptime = 1,
			minsize = 12,
			maxsize = 15,
			collisiondetection = false,
			vertical = false,
			texture = "hyrule_mapgen_mist.png",
		})]]
	end
})

--[[
minetest.register_abm({
	nodenames = {"fire:basic_flame"},
	interval = 2.0,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local num = math.random(1,100)
		minetest.add_particlespawner({
			amount = 3,
			time = 2,
			minpos = {x=pos.x-0.3, y=pos.y+0.5, z=pos.z-0.3},
			maxpos = {x=pos.x+0.3, y=pos.y+0.5, z=pos.z+0.3},
			minvel = {x=0, y=0.3, z=0},
			maxvel = {x=0, y=0.7, z=0},
			minacc = {x=0, y=0.1, z=0},
			maxacc = {x=0.1, y=0.2, z=0.1},
			minexptime = 1,
			maxexptime = 2,
			minsize = 0.1,
			maxsize = 0.5,
			collisiondetection = false,
			vertical = false,
			texture = "hyrule_mapgen_spark.png^[colorize:red:"..num,
		})
	end
})
]]

minetest.register_abm({
	nodenames = {"hyrule_mapgen:healwater_src"},
	interval = 5,
	chance = 5,
	action = function(pos, node)
		for i=1,10 do
		minetest.after(i*0.4, function()
		minetest.add_particle({
			pos = {x=pos.x+math.random(-5,5)/10, y=pos.y+0.3, z=pos.z+math.random(-5,5)/10},
			velocity = {x=0, y=0.5, z=0},
			acceleration = {x=0, y=0.5, z=0},
			expirationtime = math.random(5,20)/10,
			size = math.random(1,2),
			collisiondetection = false,
			collisionremoval = false,
			vertical = false,
			texture = "mobs_fairy_spark.png",
			glow = 9
		})
		end)
		end
	end
})

minetest.register_abm({
	nodenames = {"default:meselamp"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 25,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "hyrule_mapgen_glow_small.png",
			animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 2.00},
			glow = 9
		})
	end
})

minetest.register_abm({
	nodenames = {"default:mese_post_light"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y+0.1, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 15,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "hyrule_mapgen_glow_small.png",
			animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 2.00},
			glow = 9
		})
	end
})

minetest.register_abm({
	nodenames = {"hyrule_mapgen:dungeon_torch"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y+1, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 13,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "hyrule_mapgen_glow_small.png",
			animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 2.00},
			glow = 9
		})
	end
})

minetest.register_abm({
	nodenames = {"default:torch", "default:torch_ceiling",},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		if minetest.get_timeofday() <= 0.6 and minetest.get_timeofday() >= 0.2 and pos.y >= -20 then
		return 
		end
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y+0.1, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 15,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "hyrule_mapgen_glow_small.png",
			animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 0.20},
			glow = 9
		})
	end
})

minetest.register_abm({
	nodenames = {"default:torch_wall"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		if minetest.get_timeofday() <= 0.6 and minetest.get_timeofday() >= 0.2 and pos.y >= -20  then
		return 
		end
		local dir = minetest.facedir_to_dir(node.param2)
		local particle_pos = {x=pos.x-0.22*dir.z*1.2, y=pos.y+0.1, z=pos.z-0.18*dir.x*1.2}
		if dir.x == 0 and dir.z == 0 then
		particle_pos = {x=pos.x, y=pos.y+0.1, z=pos.z+0.2}
		elseif dir.x == -1 and dir.z == 0 then
		particle_pos = {x=pos.x-0.15, y=pos.y+0.1, z=pos.z}
		elseif dir.x == 0 and dir.z == -1 then
		particle_pos = {x=pos.x+0.15, y=pos.y+0.1, z=pos.z}
		end
		minetest.add_particle({
			pos = particle_pos,
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 15,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "hyrule_mapgen_glow_small.png",
			animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 0.20},
			glow = 9
		})
	end
})

minetest.register_abm({
	nodenames = {"hyrule_mapgen:beamos"},
	interval = 0.8,
	chance = 1,
	action = function(pos, node)
		local x = 0
		local z = 0
		if node.param2 == 0 then
			z = -1
		elseif node.param2 == 2 then
			z = 1
		elseif node.param2 == 1 then
			x = -1
		elseif node.param2 == 3 then
			x = 1
		end
		--minetest.chat_send_all(node.param2)
		for num=1,5 do
		local objs = minetest.get_objects_inside_radius({x=pos.x+x*num, y=pos.y-0.5, z=pos.z+z*num}, 1)
		for _, obj in ipairs(objs) do
			if obj:is_player() then
				local name = obj:get_player_name()
				minetest.sound_play("Laser", {pos=pos, max_hear_distance=10, gain=0.5})
				local ent = minetest.env:add_entity(pos, "hyrule_mapgen:laser")
				ent:setvelocity({x=12*x, y=0, z=12*z})
				for i=1,5 do
				minetest.after(i/10, function()
				local ent = minetest.env:add_entity(pos, "hyrule_mapgen:laser")
				ent:setvelocity({x=12*x, y=0, z=12*z})
				end)
				end
			end
		end
		end
	end
})

minetest.register_abm({
	nodenames = {"hyrule_mapgen:geyser"},
	interval = 1,
	chance = 2,
	action = function(pos, node)
		for i=1,30 do
		minetest.after(i*0.13, function()
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y+math.random(0,3)/10, z=pos.z},
			velocity = {x=math.random(-1,1)/10, y=math.random(1,2), z=math.random(-1,1)/10},
			acceleration = {x=math.random(-1,1)/10, y=math.random(-5,-10)/10, z=math.random(-1,1)/10},
			expirationtime = math.random(5,10)/10,
			size = math.random(3,5),
			collisiondetection = false,
			collisionremoval = false,
			vertical = false,
			texture = "hyrule_mapgen_fire.png",
			glow = 9
		})
		end)
		end
	end
})

minetest.register_abm({
	nodenames = {"hyrule_mapgen:lamp_lit"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		for i=1,5 do
		minetest.after(i*0.2, function()
		minetest.add_particle({
			pos = {x=pos.x+math.random(-2,2)/10, y=pos.y, z=pos.z+math.random(-2,2)/10},
			velocity = {x=0, y=math.random(5,10)/10, z=0},
			acceleration = {x=math.random(0,5)/10, y=0.5, z=math.random(0,5)/10},
			expirationtime = math.random(2,5)/10,
			size = math.random(4,8),
			collisiondetection = false,
			collisionremoval = false,
			vertical = false,
			texture = "hyruletools_flame.png",
			glow = 9
		})
		end)
		end
	end
})

minetest.register_abm({
	nodenames = {"hyrule_mapgen:lamp_lit"},
	interval = 30,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name="hyrule_mapgen:lamp"})
	end
})

--entities

minetest.register_entity("hyrule_mapgen:windmill", {
	visual = "mesh",
	mesh = "windmill.b3d",
	textures = {"hyrule_mapgen_windmill.png"},
	collisionbox = {0, 0, 0, 0, 0, 0},
	visual_size = {x=1, y=1},
	physical = true,
	on_activate = function(self)
		self.object:set_animation({x=1, y=40}, 5, 0)
	end,
	on_step = function(self)
		local pos = self.object:getpos()
		if not minetest.find_node_near(pos, 1, {"hyrule_mapgen:windmill_node"}) then
		self.object:remove()
		end
	end,
})

minetest.register_entity("hyrule_mapgen:butterfly", {
	visual = "mesh",
	mesh = "butterfly.b3d",
	physical = true,
	textures = {"hyrule_mapgen_butterfly1.png",},
	visual_size = {x=0.3, y=0.3},
	on_activate = function(self)
		num = math.random(1,4)
		self.object:set_properties({textures = {"hyrule_mapgen_butterfly"..num..".png",},})
		self.object:set_animation({x=1, y=10}, 20, 0)
		self.object:setyaw(math.pi+num)
		minetest.after(30, function()
		self.object:remove()
		end)
	end,
	on_step = function(self)
		local pos = self.object:getpos()
		local vec = self.object:getvelocity()
		local num = math.random(-math.pi, math.pi)
		self.object:setyaw(math.pi+num)
		self.object:setvelocity({x=-math.sin(12*pos.y), y=math.cos(12*pos.x), z=-math.sin(12*pos.y)})
		self.object:setacceleration({x=-math.sin(6*vec.y), y=math.cos(6*vec.x), z=-math.sin(6*vec.y)})
	end,
	collisionbox = {0,0,0,0,0.1,0},
})

minetest.register_entity("hyrule_mapgen:dragonfly", {
	visual = "mesh",
	mesh = "butterfly.b3d",
	physical = true,
	textures = {"hyrule_mapgen_dragonfly.png",},
	visual_size = {x=0.3, y=0.3},
	on_activate = function(self)
		num = math.random(1,4)
		self.object:set_properties({textures = {"hyrule_mapgen_dragonfly"..num..".png",},})
		self.object:set_animation({x=1, y=10}, 40, 0)
		self.object:setyaw(math.pi+num)
		minetest.after(60, function()
		self.object:remove()
		end)
		if math.random(1,100) == 1 then
		self.object:remove()
		end
	end,
	on_step = function(self, dtime)
		local num = math.random(-math.pi, math.pi)
		local num1 = math.random(-1, 1)
		local num2 = math.random(-1, 1)
		local pos = self.object:getpos()
		local vec = self.object:getvelocity()		
		--self.object:setyaw(math.pi+num)
		self.object:setvelocity({x=num1*2, y=math.cos(12*pos.x), z=num2*2})
		self.object:setacceleration({x=-num1*1, y=math.cos(6*vec.x), z=-1})
	end,
	collisionbox = {0,0,0,0,0.1,0},
})

--default nodes

minetest.register_node(":default:dirt_with_grass2", {
	description = "Dirt with dark Grass",
	tiles = {"default_grass_top_2.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side_2.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node(":default:dirt_with_grass3", {
	description = "Dirt with dark Grass",
	tiles = {"default_grass_top_3.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side_3.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

--overrides

local dirt_treasure = {
	{"hyruletools:green_rupee", 10},
	{"fishing:bait_worm", 10},
	{"hyruletools:blue_rupee", 20},
	{"hyruletools:red_rupee", 40},
}

local shovels = {
	{"default:shovel_steel"},
	{"default:shovel_wood"},
	{"default:shovel_bronze"},
	{"default:shovel_diamond"},
	{"default:shovel_mese"},
	{"default:shovel_stone"},
	}

for _, row in ipairs(shovels) do
minetest.override_item(row[1], {
	on_place = function(itemstack, placer, pointed_thing)
		if minetest.get_node(pointed_thing.under).name == "default:dirt" or minetest.get_node(pointed_thing.under).name == "default:dirt_with_grass" or minetest.get_node(pointed_thing.under).name == "default:dirt_with_grass2" or minetest.get_node(pointed_thing.under).name == "default:dirt_with_grass3" then
		minetest.set_node(pointed_thing.under, {name="hyrule_mapgen:packed_dirt"})
		for _, row in ipairs(dirt_treasure) do
			local item = row[1]
			local chance = row[2]
			local pos = pointed_thing.under
			if math.random(1, chance) == 1 then
				minetest.add_item({x=pos.x, y=pos.y+1.2,z=pos.z}, item)
			end
		end
		end
	end,
})
end

minetest.clear_craft({output="default:sword_steel",})
minetest.clear_craft({output="default:sword_bronze",})
minetest.clear_craft({output="default:sword_mese",})
minetest.clear_craft({output="default:sword_diamond",})

minetest.override_item("default:junglegrass", {
	selection_box = {
		type = "fixed",
		fixed = {
		{-0.3,-0.5,-0.3,0.3,0,0.3},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
		{-0.3,-0.5,-0.3,0.3,0,0.3},
		},
	},
})

minetest.override_item("default:book", {
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local dir = placer:get_look_dir()
		minetest.set_node(pos, {name="default:book_placed", param2=minetest.dir_to_facedir(dir)})
		itemstack:take_item()
		return itemstack
	end,
})

minetest.override_item("default:book_written", {
	on_place = function(itemstack, placer, pointed_thing)
		minetest.chat_send_player(placer:get_player_name(), "Written books can't be placed!")
	end,
})

minetest.override_item("vessels:drinking_glass", {
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"hyrule_mapgen_trans.png",
		"hyrule_mapgen_trans.png",
		"vessels_drinking_glass.png",
	},
	walkable = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875},
			{-0.25, -0.4375, -0.25, 0.25, 0, -0.25},
			{-0.25, -0.4375, 0.25, 0.25, 0, 0.25},
			{0.25, -0.4375, -0.25, 0.25, 0, 0.25},
			{-0.25, -0.4375, -0.25, -0.25, 0, 0.25},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875},
			{-0.25, -0.4375, -0.25, 0.25, 0, 0.25},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875},
			{-0.25, -0.4375, -0.25, 0.25, 0, -0.25},
			{-0.25, -0.4375, 0.25, 0.25, 0, 0.25},
			{0.25, -0.4375, -0.25, 0.25, 0, 0.25},
			{-0.25, -0.4375, -0.25, -0.25, 0, 0.25},
		}
	},
})

minetest.override_item("default:meselamp", {
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.4375}, -- NodeBox1
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5}, -- NodeBox2
			{0.4375, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, -- NodeBox4
			{0.4375, -0.5, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox5
			{-0.5, -0.5, -0.5, -0.4375, -0.4375, 0.5}, -- NodeBox6
			{0.4375, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox7
			{0.4375, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox8
			{-0.5, 0.4375, -0.5, -0.4375, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, -0.5, 0.5, -0.4375, -0.4375}, -- NodeBox10
			{-0.5, -0.5, 0.4375, 0.5, -0.4375, 0.5}, -- NodeBox11
			{-0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox12
			{-0.5, 0.4375, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox13
		}
	}
})

minetest.override_item("default:chest_open", {
	visual_scale = 0.5,
	tiles = {
		"default_chest_open.png",
	},
})

minetest.override_item("default:chest_locked_open", {
	visual_scale = 0.5,
	tiles = {
		"default_chest_locked_open.png",
	},
})

minetest.override_item("vessels:steel_bottle", {
	tiles = {
		"vessels_steel_bottle_top.png",
		"vessels_steel_bottle_top.png",
		"vessels_steel_bottle.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.1875, 0.125, -0.4375, 0.1875}, -- NodeBox1
			{-0.1875, -0.5, -0.125, 0.1875, -0.4375, 0.125}, -- NodeBox2
			{-0.1875, -0.4375, -0.25, 0.1875, 0, 0.25}, -- NodeBox3
			{-0.25, -0.4375, -0.1875, 0.25, 0, 0.1875}, -- NodeBox4
			{-0.1875, 0, -0.125, 0.1875, 0.0625, 0.125}, -- NodeBox5
			{-0.125, 0, -0.1875, 0.125, 0.0625, 0.1875}, -- NodeBox6
			{-0.0625, 0.0625, -0.0625, 0.0625, 0.125, 0.0625}, -- NodeBox7
			{-0.125, 0.125, -0.125, 0.125, 0.1875, 0.125}, -- NodeBox8
			{-0.0625, 0.1875, -0.0625, 0.0625, 0.25, 0.0625}, -- NodeBox9
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.1875, 0.125, -0.4375, 0.1875}, -- NodeBox1
			{-0.1875, -0.5, -0.125, 0.1875, -0.4375, 0.125}, -- NodeBox2
			{-0.1875, -0.4375, -0.25, 0.1875, 0, 0.25}, -- NodeBox3
			{-0.25, -0.4375, -0.1875, 0.25, 0, 0.1875}, -- NodeBox4
			{-0.1875, 0, -0.125, 0.1875, 0.0625, 0.125}, -- NodeBox5
			{-0.125, 0, -0.1875, 0.125, 0.0625, 0.1875}, -- NodeBox6
			{-0.0625, 0.0625, -0.0625, 0.0625, 0.125, 0.0625}, -- NodeBox7
			{-0.125, 0.125, -0.125, 0.125, 0.1875, 0.125}, -- NodeBox8
			{-0.0625, 0.1875, -0.0625, 0.0625, 0.25, 0.0625}, -- NodeBox9
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.1875, 0.125, -0.4375, 0.1875}, -- NodeBox1
			{-0.1875, -0.5, -0.125, 0.1875, -0.4375, 0.125}, -- NodeBox2
			{-0.1875, -0.4375, -0.25, 0.1875, 0, 0.25}, -- NodeBox3
			{-0.25, -0.4375, -0.1875, 0.25, 0, 0.1875}, -- NodeBox4
			{-0.1875, 0, -0.125, 0.1875, 0.0625, 0.125}, -- NodeBox5
			{-0.125, 0, -0.1875, 0.125, 0.0625, 0.1875}, -- NodeBox6
			{-0.0625, 0.0625, -0.0625, 0.0625, 0.125, 0.0625}, -- NodeBox7
			{-0.125, 0.125, -0.125, 0.125, 0.1875, 0.125}, -- NodeBox8
			{-0.0625, 0.1875, -0.0625, 0.0625, 0.25, 0.0625}, -- NodeBox9
		}
	},
	walkable = true,
})

minetest.override_item("default:mese_post_light", {
	node_box = {
		type = "fixed",
		fixed = {
			{-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
			{-3/16, -3/16, -3/16, 3/16, 6/16, 3/16},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
			{-3/16, -3/16, -3/16, 3/16, 6/16, 3/16},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
			{-3/16, -3/16, -3/16, 3/16, 6/16, 3/16},
		},
	},
})

minetest.override_item("default:ladder_wood", {
	tiles = {
	"default_wood.png",
	},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.3125, 0.5, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- NodeBox2
			{-0.5, 0.3125, 0.375, 0.5, 0.4375, 0.5}, -- NodeBox3
			{-0.5, 0.0625, 0.375, 0.5, 0.1875, 0.5}, -- NodeBox4
			{-0.5, -0.1875, 0.375, 0.5, -0.0625, 0.5}, -- NodeBox5
			{-0.5, -0.4375, 0.375, 0.5, -0.3125, 0.5}, -- NodeBox6
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.3125, 0.5, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- NodeBox2
			{-0.5, 0.3125, 0.375, 0.5, 0.4375, 0.5}, -- NodeBox3
			{-0.5, 0.0625, 0.375, 0.5, 0.1875, 0.5}, -- NodeBox4
			{-0.5, -0.1875, 0.375, 0.5, -0.0625, 0.5}, -- NodeBox5
			{-0.5, -0.4375, 0.375, 0.5, -0.3125, 0.5}, -- NodeBox6
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.3125, 0.5, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- NodeBox2
			{-0.5, 0.3125, 0.375, 0.5, 0.4375, 0.5}, -- NodeBox3
			{-0.5, 0.0625, 0.375, 0.5, 0.1875, 0.5}, -- NodeBox4
			{-0.5, -0.1875, 0.375, 0.5, -0.0625, 0.5}, -- NodeBox5
			{-0.5, -0.4375, 0.375, 0.5, -0.3125, 0.5}, -- NodeBox6
		}
	},
})

minetest.override_item("default:ladder_steel", {
	tiles = {
	"default_steel_block.png",
	},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.3125, 0.5, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- NodeBox2
			{-0.4, 0.3125, 0.375, 0.4, 0.4375, 0.5}, -- NodeBox3
			{-0.4, 0.0625, 0.375, 0.4, 0.1875, 0.5}, -- NodeBox4
			{-0.4, -0.1875, 0.375, 0.4, -0.0625, 0.5}, -- NodeBox5
			{-0.4, -0.4375, 0.375, 0.4, -0.3125, 0.5}, -- NodeBox6
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.3125, 0.5, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- NodeBox2
			{-0.4, 0.3125, 0.375, 0.4, 0.4375, 0.5}, -- NodeBox3
			{-0.4, 0.0625, 0.375, 0.4, 0.1875, 0.5}, -- NodeBox4
			{-0.4, -0.1875, 0.375, 0.4, -0.0625, 0.5}, -- NodeBox5
			{-0.4, -0.4375, 0.375, 0.4, -0.3125, 0.5}, -- NodeBox6
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.3125, 0.5, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- NodeBox2
			{-0.4, 0.3125, 0.375, 0.4, 0.4375, 0.5}, -- NodeBox3
			{-0.4, 0.0625, 0.375, 0.4, 0.1875, 0.5}, -- NodeBox4
			{-0.4, -0.1875, 0.375, 0.4, -0.0625, 0.5}, -- NodeBox5
			{-0.4, -0.4375, 0.375, 0.4, -0.3125, 0.5}, -- NodeBox6
		}
	},
})

minetest.override_item("flowers:waterlily", {
	drawtype = "mesh",
	tiles = {"waterlily.png"},
	mesh = "waterlily.b3d",
	paramtype = "light",
	visual_scale = 0.5,
	walkable = true,
})

if minetest.setting_getbool("3d_leaves") then
minetest.override_item("default:leaves", {
	drawtype = "mesh",
	mesh = "leaf.obj",
	tiles = {"hyrule_mapgen_default_leaves.png"},
	paramtype = "light",
	walkable = false,
})


minetest.override_item("default:pine_needles", {
	drawtype = "mesh",
	mesh = "leaf.obj",
	tiles = {"hyrule_mapgen_pine_needles.png"},
	paramtype = "light",
	walkable = false,
})

minetest.override_item("default:aspen_leaves", {
	drawtype = "mesh",
	mesh = "leaf.obj",
	tiles = {"hyrule_mapgen_aspen_leaves.png"},
	paramtype = "light",
	walkable = false,
})
minetest.override_item("default:jungleleaves", {
	drawtype = "mesh",
	mesh = "leaf.obj",
	tiles = {"hyrule_mapgen_jungleleaves.png"},
	paramtype = "light",
	walkable = false,
})
end

minetest.override_item("default:cactus", {
	drawtype = "mesh",
	mesh = "cactus.b3d",
	tiles = {"cactus.png"},
	paramtype = "light",
	visual_scale = 0.5,
	damage_per_second = 1,
	selection_box = {
	type = "fixed",
	fixed = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
	},
	collision_box = {
	type = "fixed",
	fixed = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
	},
})

minetest.override_item("default:grass_1", {
	on_destruct = function(pos, oldnode)
		local num = math.random(3,7)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
		if num == 4 then
		minetest.env:add_item(pos, "farming:seed_wheat")
		end
	end,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	},
})

minetest.override_item("default:grass_2", {
	on_destruct = function(pos, oldnode)
		local num = math.random(3,7)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
		if num == 4 then
		minetest.env:add_item(pos, "farming:seed_wheat")
		end
	end,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	},
})


minetest.override_item("default:grass_3", {
	on_destruct = function(pos, oldnode)
		local num = math.random(3,7)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
		if num == 4 then
		minetest.env:add_item(pos, "farming:seed_wheat")
		end
	end,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	},
})

minetest.override_item("default:grass_4", {
	on_destruct = function(pos, oldnode)
		local num = math.random(3,7)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
		if num == 4 then
		minetest.env:add_item(pos, "farming:seed_wheat")
		end
	end,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	},
})

minetest.override_item("default:grass_5", {
	on_destruct = function(pos, oldnode)
		local num = math.random(3,7)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
		if num == 4 then
		minetest.env:add_item(pos, "farming:seed_wheat")
		end
	end,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	},
})


minetest.override_item("default:ice", {
	drawtype = "glasslike",
	use_texture_alpha = true,
})

minetest.override_item("default:furnace", {
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5}, -- NodeBox1
			{-0.4375, 0.375, -0.5, 0.4375, 0.4375, 0.5}, -- NodeBox2
			{-0.375, 0.4375, -0.5, 0.375, 0.5, 0.5}, -- NodeBox3
			{-0.5, 0.3125, -0.5, 0.5, 0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.3125, 0.3125, 0.5}, -- NodeBox5
			{0.3125, -0.5, -0.5, 0.5, 0.375, 0.5}, -- NodeBox6
			{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox7
			{-0.5, -0.5, -0.375, 0.5, 0.3125, 0.5}, -- NodeBox8
		}
	},
})

minetest.override_item("default:furnace_active", {
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5}, -- NodeBox1
			{-0.4375, 0.375, -0.5, 0.4375, 0.4375, 0.5}, -- NodeBox2
			{-0.375, 0.4375, -0.5, 0.375, 0.5, 0.5}, -- NodeBox3
			{-0.5, 0.3125, -0.5, 0.5, 0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.3125, 0.3125, 0.5}, -- NodeBox5
			{0.3125, -0.5, -0.5, 0.5, 0.375, 0.5}, -- NodeBox6
			{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox7
			{-0.5, -0.5, -0.375, 0.5, 0.3125, 0.5}, -- NodeBox8
		}
	},
})

minetest.override_item("default:chest_locked", {
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
})


minetest.override_item("default:chest", {
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
})

minetest.override_item("default:bookshelf", {
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.375, -0.4375, 0.4375, 0.4375, 0.4375}, -- NodeBox1
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox2
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, -0.0625, -0.5, 0.5, 0.125, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, -- NodeBox5
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5}, -- NodeBox6
			{0.4375, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.4375, -0.5, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox8
		}
	},
})

minetest.override_item("vessels:shelf", {
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.375, -0.4375, 0.4375, 0.4375, 0.4375}, -- NodeBox1
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox2
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, -0.0625, -0.5, 0.5, 0.125, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, -- NodeBox5
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5}, -- NodeBox6
			{0.4375, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.4375, -0.5, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox8
		}
	},
})

minetest.override_item("farming:bread", {
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local dir = placer:get_look_dir()
		minetest.set_node(pos, {name="farming:bread_node", param2=minetest.dir_to_facedir(dir)})
		itemstack:take_item()
		return itemstack
	end,
})


--ore overrides

minetest.override_item("default:stone_with_iron", {
	groups = {cracky = 2, xp = 1},
})

minetest.override_item("default:stone_with_copper", {
	groups = {cracky = 2, xp = 1},
})

minetest.override_item("default:stone_with_mese", {
	groups = {cracky = 1, xp = 1},
})

minetest.override_item("default:mese", {
	groups = {cracky = 1, level = 2, xp = 1},
})

minetest.override_item("default:stone_with_diamond", {
	groups = {cracky = 1, xp = 1},
})

minetest.override_item("default:stone_with_gold", {
	groups = {cracky = 2, xp = 1},
})

-- 'Can grow' function

local random = math.random

local function can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	local name_under = node_under.name
	local is_soil = minetest.get_item_group(name_under, "soil")
	if is_soil == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 13 then
		return false
	end
	return true
end
-- Sapling ABM

minetest.register_abm({
	nodenames = {"hyrule_mapgen:magicsapling", "hyrule_mapgen:wildsapling",
		"hyrule_mapgen:palmsapling", "hyrule_mapgen:bigsapling"},
	interval = 10,
	chance = 50,
	action = function(pos, node)
		if not can_grow(pos) then
			return
		end

		local mapgen = minetest.get_mapgen_params().mgname
		if node.name == "hyrule_mapgen:magicsapling" then
			minetest.log("action", "A magic sapling grows into a tree at "..
				minetest.pos_to_string(pos))
			if mapgen == "v7" then
				grow_new_magic_tree(pos)
			end
		elseif node.name == "hyrule_mapgen:palmsapling" then
			minetest.log("action", "A palm sapling grows into a tree at "..
				minetest.pos_to_string(pos))
			if mapgen == "v7" then
				grow_new_palm_tree(pos)
			end
		elseif node.name == "hyrule_mapgen:bigsapling" then
			minetest.log("action", "A big sapling grows into a tree at "..
				minetest.pos_to_string(pos))
			if mapgen == "v7" then
				grow_new_big_tree(pos)
			end
		elseif node.name == "hyrule_mapgen:wildsapling" then
			minetest.log("action", "A wild sapling grows into a tree at "..
				minetest.pos_to_string(pos))
			grow_new_wild_tree(pos)
		end
	end
})

function grow_new_wild_tree(pos)
	local path = minetest.get_modpath("hyrule_mapgen") .. "/schematics/wildtree.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, 0, nil, false)
end

function grow_new_magic_tree(pos)
	local path = minetest.get_modpath("hyrule_mapgen") .. "/schematics/magictree.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, 0, nil, false)
end

function grow_new_palm_tree(pos)
	local path = minetest.get_modpath("hyrule_mapgen") .. "/schematics/palmtree.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, 0, nil, false)
end

function grow_new_big_tree(pos)
	local path = minetest.get_modpath("hyrule_mapgen") .. "/schematics/big_tree.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, 0, nil, false)
end