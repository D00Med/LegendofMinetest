
local mg_name = minetest.get_mapgen_params().mgname or ""

if mg_name ~= "v6" then
dofile(minetest.get_modpath("hyrule_mapgen").."/mapgen.lua")
end

--village spawner

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
minetest.register_abm({
	nodenames = {"flowers:flower_rose", "flowers:flower_tulip", "flowers:flower_dandelion_yellow", "flowers:flower_viola", "flowers:flower_dandelion_white", "flowers:flower_geranium"},
	interval = 7.0,
	chance = 6,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.env:add_entity({x=pos.x,y=pos.y+0.5,z=pos.z}, "hyrule_mapgen:butterfly")
	end
})

minetest.register_abm({
	nodenames = {"moreplants:tallgrass", "moreplants:bulrush"},
	interval = 10.0,
	chance = 60,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.env:add_entity({x=pos.x,y=pos.y+0.5,z=pos.z}, "hyrule_mapgen:dragonfly")
	end
})

sound = false

minetest.register_abm({
	nodenames = {"default:water_flowing"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		local below = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local above2 = minetest.get_node({x=pos.x, y=pos.y+2, z=pos.z}).name
		if above == "default:water_flowing" and below ~= "default:water_flowing" and above2 == "default:water_flowing" and minetest.find_nodes_in_area({x=pos.x-2, y=pos.y, z=pos.z-2}, {x=pos.x+2, y=pos.x+3, z=pos.z+2}, {"default:water_source"}) ~= nil then
		minetest.add_particlespawner({
			amount = 9,
			time = 1,
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
			time = 1,
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
	nodenames = {"fire:basic_flame"},
	interval = 1.0,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local num = math.random(1,100)
		minetest.add_particlespawner({
			amount = 3,
			time = 1,
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

minetest.register_abm({
	nodenames = {"hyrule_mapgen:healwater_src"},
	interval = 5,
	chance = 5,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 10,
			time = 4,
			minpos = {x=pos.x-0.5, y=pos.y+0.3, z=pos.z-0.5},
			maxpos = {x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5},
			minvel = {x=-0, y=0.5, z=-0},
			maxvel = {x=0, y=0.5, z=0},
			minacc = {x=0, y=0.5, z=0},
			maxacc = {x=0, y=0.5, z=0},
			minexptime = 0.5,
			maxexptime = 2,
			minsize = 1,
			maxsize = 2,
			collisiondetection = false,
			texture = "mobs_fairy_spark.png"
		})
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
		if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "hyrule_mapgen:windmill_node" then
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
		minetest.after(10, function()
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
		--self.object:set_properties({textures = {"hyrule_mapgen_butterfly"..num..".png",},})
		self.object:set_animation({x=1, y=10}, 40, 0)
		self.object:setyaw(math.pi+num)
		minetest.after(10, function()
		self.object:remove()
		end)
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

--overrides

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

--new nodes

minetest.register_node("hyrule_mapgen:logpile", {
	description = "Log Pile",
	tiles = {
		"default_tree.png^[transformR90",
		"default_tree.png^[transformR90",
		"default_tree.png^[transformR90",
		"default_tree.png^[transformR90",
		"default_tree_top.png",
		"default_tree_top.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.4375, -0.5, -0.0625, -0.125, 0.5}, -- NodeBox1
			{0.0625, -0.4375, -0.5, 0.5, -0.125, 0.5}, -- NodeBox2
			{0.125, -0.5, -0.5, 0.4375, -0.0625, 0.5}, -- NodeBox3
			{-0.4375, -0.5, -0.5, -0.125, -0.0625, 0.5}, -- NodeBox4
			{-0.125, -0.0625, -0.5, 0.1875, 0.375, 0.5}, -- NodeBox5
			{-0.1875, 0, -0.5, 0.25, 0.3125, 0.5}, -- NodeBox6
		}
	},
	groups = {choppy=3, oddly_breakable_by_hand=1, flammable=1, falling_node=1},
	drop = "default:tree 3",
})

minetest.register_node("hyrule_mapgen:bigmush", {
	description = "Big Mushroom",
	drawtype = "plantlike",
	tiles = {
		"hyrule_mapgen_bigmush.png"
	},
	wield_image = "hyrule_mapgen_bigmush.png",
	inventory_image = "hyrule_mapgen_bigmush.png",
	groups = {snappy=1, flammable=1, oddly_breakable_by_hand = 1,},
	paramtype = "light",
	walkable = false,
	selection_box = {
	type = "fixed",
	fixed = {-0.3, -0.5, -0.3, 0.3, 0.2, 0.3}
	},
	on_use = minetest.item_eat(-2)
})

minetest.register_node("hyrule_mapgen:big_table", {
	description = "Big Table",
	tiles = {
		"hyrule_mapgen_bigtable_top.png",
		"hyrule_mapgen_bigtable.png",
		"hyrule_mapgen_bigtable.png",
		"hyrule_mapgen_bigtable.png",
		"hyrule_mapgen_bigtable.png",
		"hyrule_mapgen_bigtable.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, 0.1875, -0.1875, 0.375, 0.5}, -- NodeBox2
		}
	},
	groups = {choppy=1, oddly_breakable_by_hand=1}
})

minetest.register_craft( {
	output = "hyrule_mapgen:big_table 1",
	recipe = {
		{ "default:wood", "default:wood", "default:wood" },
		{ "default:wood", "", "" },
		{ "default:wood", "", "" }
	}
})

minetest.register_node("hyrule_mapgen:crystal_1", {
	description = "Cave Crystal (Blue)",
	tiles = {
		"hyrule_mapgen_crystal1.png",
	},
	groups = {cracky=1},
	drawtype = "nodebox",
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.0625, 0.1875, 0.4375, 0.25}, -- NodeBox6
			{0, -0.5, -0.3125, 0.1875, 0.1875, -0.125}, -- NodeBox7
			{-0.3125, -0.5, -0.1875, -0.0625, -0.0625, 0.0625}, -- NodeBox8
			{0.1875, -0.5, 0.0625, 0.3125, 0, 0.1875}, -- NodeBox9
			{-0.25, -0.5, 0.125, 0, 0.0625, 0.375}, -- NodeBox10
		}
	},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:crystal_3", {
	description = "Cave Crystal (Green)",
	tiles = {
		"hyrule_mapgen_crystal3.png",
	},
	groups = {cracky=1},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.25, 0, 0.1875, -0.0625}, -- NodeBox16
			{0, -0.5, 0.0625, 0.25, 0.5, 0.3125}, -- NodeBox19
			{-0.375, -0.5, 0.0625, -0.1875, -0.0625, 0.25}, -- NodeBox20
		}
	},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:crystal_2", {
	description = "Cave Crystal (Purple)",
	tiles = {
		"hyrule_mapgen_crystal2.png",
	},
	groups = {cracky=1},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.1875, 0.125, 0.4375, 0.125}, -- NodeBox11
			{0.0625, -0.5, 0.1875, 0.25, 0.1875, 0.375}, -- NodeBox12
			{-0.375, -0.5, -0.25, -0.1875, -0.0625, -0.0625}, -- NodeBox13
			{-0.3125, -0.5, 0.0625, -0.0625, 0.125, 0.3125}, -- NodeBox14
			{0.0625, -0.5, -0.3125, 0.25, 0.25, -0.125}, -- NodeBox15
		}
	},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:bush_leaves", {
	description = "Shrub Leaves",
	tiles = {"hyrule_mapgen_bushleaves.png"},
	drawtype = "allfaces",
	paramtype = "light",
	walkable = false,
	groups = {snappy=1, oddly_breakable_by_hand=1, leaves=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("hyrule_mapgen:windmill_node", {
	description = "Windmill",
	drawtype = "airlike",
	tiles = {"hyrule_mapgen_trans.png"},
	wield_image = "hyrule_mapgen_windmill_inv.png",
	inventory_image = "hyrule_mapgen_windmill_inv.png",
	groups = {choppy = 1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos, node)
		minetest.env:add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "hyrule_mapgen:windmill")
	end,
})

minetest.register_node("hyrule_mapgen:dungeon_seed", {
	description = "Dungeon Seed",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "default:stone"
})

minetest.register_node("hyrule_mapgen:ice_brick", {
	description = "Ice Brick",
	tiles = {"hyrule_mapgen_ice_brick.png"},
	groups = {cracky = 3, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = 'hyrule_mapgen:ice_brick',
	recipe = {
		{'default:ice', 'default:ice', ''},
		{'default:ice', '', ''},
		{'default:ice', '', ''},
	}
})

stairs.register_stair_and_slab(
	"ice_brick",
	"hyrule_mapgen:ice_brick",
	{cracky = 3, cools_lava = 1},
	{"hyrule_mapgen_ice_brick.png"},
	"Ice brick Stair",
	"Ice brick Slab",
	default.node_sound_glass_defaults()
)

minetest.register_node("hyrule_mapgen:icicle", {
	description = "Icicle",
	tiles = {
		"default_ice.png",
	},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- NodeBox1
			{-0.1875, 0.4375, -0.1875, 0.1875, 1.1875, 0.1875}, -- NodeBox2
			{-0.125, 1.1875, -0.125, 0.125, 1.6875, 0.125}, -- NodeBox3
			{-0.0625, 1.6875, -0.0625, 0.0625, 2.0625, 0.0625}, -- NodeBox4
		}
	},
	groups = {cracky=3, oddly_breakable_by_hand=1, dig_immediate=3},
	sounds = default.node_sound_glass_defaults(),
	drop = "",
	on_destruct = function(pos)
		minetest.env:add_item({x=pos.x-0.3, y=pos.y+0.5, z=pos.z-0.3}, "hyruletools:ice_fragment")
		minetest.env:add_item({x=pos.x-0.3, y=pos.y+0.5, z=pos.z+0.3}, "hyruletools:ice_fragment")
		minetest.env:add_item({x=pos.x+0.3, y=pos.y+0.5, z=pos.z-0.3}, "hyruletools:ice_fragment")
		minetest.env:add_item({x=pos.x+0.3, y=pos.y+0.5, z=pos.z+0.3}, "hyruletools:ice_fragment")
	end,
})

minetest.register_node("hyrule_mapgen:obsidian_spike", {
	description = "Obsidian spike",
	tiles = {
		"default_obsidian.png",
	},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- NodeBox1
			{-0.1875, 0.4375, -0.1875, 0.1875, 1.1875, 0.1875}, -- NodeBox2
			{-0.125, 1.1875, -0.125, 0.125, 1.6875, 0.125}, -- NodeBox3
			{-0.0625, 1.6875, -0.0625, 0.0625, 2.0625, 0.0625}, -- NodeBox4
		}
	},
	groups = {cracky=1,},
	sounds = default.node_sound_stone_defaults(),
	drop = "default:obsidian",
})

minetest.register_entity("hyrule_mapgen:laser", {
	visual = "cube",
	textures = {
	"hyrule_mapgen_laser.png",
	"hyrule_mapgen_laser.png",
	"hyrule_mapgen_laser.png",
	"hyrule_mapgen_laser.png",
	"hyrule_mapgen_laser.png",
	"hyrule_mapgen_laser.png",
	},
	visual_size={x=0.1,y=0.1},
	collisionbox = {0, 0, 0, 0, 0, 0},
	physical = false,
	automatic_rotate = true,
	automatic_face_movement_dir = 0,
	on_activate = function(self)
		minetest.after(3, function()
			self.object:remove()
		end)
	end,
	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y-0.5,z=pos.z}, 0.5)	
			for k, obj in pairs(objs) do
				if obj:is_player() then
					obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=1},
						}, nil)
						self.object:remove()
				end
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyrule_mapgen:laser" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=1},
						}, nil)
						self.object:remove()
					end
				end
			end
	end
})

minetest.register_node("hyrule_mapgen:beamos", {
	description = "Beamos",
	tiles = {
		"hyrule_mapgen_beamos_top.png",
		"hyrule_mapgen_beamos_bottom.png",
		"hyrule_mapgen_beamos_sides.png",
		"hyrule_mapgen_beamos_sides.png",
		"hyrule_mapgen_beamos_sides.png",
		"hyrule_mapgen_beamos_front.png",
	},
	groups = {cracky = 3,},
	paramtype2 = "facedir",
})


minetest.register_abm({
	nodenames = {"hyrule_mapgen:beamos"},
	interval = 1,
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
		local numbers = {
		{1},
		{2},
		{3},
		{4},
		}
		for _, number in ipairs(numbers) do
		local num = number[1]
		local objs = minetest.get_objects_inside_radius({x=pos.x+x*num, y=pos.y, z=pos.z+z*num}, 1)
		for _, obj in ipairs(objs) do
			if obj:is_player() then
				local name = obj:get_player_name()
				minetest.sound_play("Laser", {to_player=obj, gain=0.5})
				local ent = minetest.env:add_entity(pos, "hyrule_mapgen:laser")
				ent:setvelocity({x=7*x, y=0, z=7*z})
				minetest.after(0.1, function()
				local ent = minetest.env:add_entity(pos, "hyrule_mapgen:laser")
				ent:setvelocity({x=7*x, y=0, z=7*z})
				end)
				minetest.after(0.2, function()
				local ent = minetest.env:add_entity(pos, "hyrule_mapgen:laser")
				ent:setvelocity({x=7*x, y=0, z=7*z})
				end)
				minetest.after(0.3, function()
				local ent = minetest.env:add_entity(pos, "hyrule_mapgen:laser")
				ent:setvelocity({x=7*x, y=0, z=7*z})
				end)
			end
		end
		end
	end
})

minetest.register_node("hyrule_mapgen:spikes", {
	description = "Spikes",
	drawtype = "firelike",
	tiles = {
		"hyrule_mapgen_spikes.png"
	},
	wield_image = "hyrule_mapgen_spikes.png",
	inventory_image = "hyrule_mapgen_spikes.png",
	groups = {cracky=3},
	paramtype = "light",
	walkable = false,
	damage_per_second = 3,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 0.5}
	}
})

minetest.register_node("hyrule_mapgen:sinkingsand", {
	description = "Sinkin Sand",
	drawtype = "liquid",
	tiles = {{
		name = "hyrule_mapgen_sinkingsand.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.00},
	}},
	inventory_image = "hyrule_mapgen_sinkingsand_inv.png",
	groups = {liquid=1, water=1},
	pointable = false,
	buildable_to = true,
	liquid_viscosity = 8,
	liquid_range = 0,
	liquidtype = "source",
	liquid_alternative_flowing = "hyrule_mapgen:sinkingsand",
	liquid_alternative_source = "hyrule_mapgen:sinkingsand",
	damage_per_second = 3,
	walkable = false
})


chest_items = {
	{"clawshot:clawshot", 20},
	{"hyruletools:eye", 20},
	{"hyruletools:boomerang", 20},
	{"hyruletools:flame_rod", 50},
	{"hyruletools:wand", 50},
	{"hyruletools:medallion", 50},
	{"hyruletools:medallion2", 50},
	{"hyruletools:medallion3", 50},
	{"hyruletools:green_rupee 5", 10},
	{"hyruletools:blue_rupee 2", 10},
	{"hyruletools:red_rupee", 10},
	{"hyruletools:nyan_rupee", 50},
}

minetest.register_node("hyrule_mapgen:chest", {
	description = "Dungeon Chest",
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
	groups = {cracky = 2, oddly_breakable_by_hand = 1},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		for _, row in ipairs(chest_items) do
		local item = row[1]
		local rarity = row[2]
		if math.random(1,rarity) == 1 then
			meta:set_string("item", item)
			else
			meta:set_string("item", "hyruletools:green_rupee 20")
		end
		end
		inv:set_size("main", 1*1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_rightclick = function(pos, node, clicker, item, _)
		local name = clicker:get_player_name()
		if clicker:get_wielded_item():get_name() == "hyruletools:key" then
			item:take_item()
			local meta = minetest.get_meta(pos)
			local item = meta:get_string("item")
			if item == nil then
				for _, row in ipairs(chest_items) do
				local item = row[1]
				local rarity = row[2]
				if math.random(1,rarity) == 1 then
					meta:set_string("item", item)
					else
					meta:set_string("item", "hyruletools:green_rupee 20")
				end
				end
			end
			minetest.env:add_item(pos, item)
			minetest.env:remove_node(pos)
		else
		minetest.chat_send_player(name, "It is locked, you need a key!")
		end
	end,
})

minetest.register_node("hyrule_mapgen:chest_key", {
	description = "Dungeon Chest (key)",
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
	groups = {cracky = 2, oddly_breakable_by_hand = 1},
	is_ground_content = false,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "hyrule_mapgen:dungeon_brick" and minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "hyrule_mapgen:dungeon_tile" and minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "hyrule_mapgen:dungeon_brick2" and minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "hyrule_mapgen:dungeon_tile2" then
			minetest.env:add_item(pos, "hyruletools:key")
		else
			minetest.env:add_item(pos, "hyruletools:retro_key")
		end
			minetest.env:remove_node(pos)
			return itemstack
	end,
})

minetest.register_node("hyrule_mapgen:chest_bosskey", {
	description = "Dungeon Chest (Boss key)",
	tiles = {"hyrule_mapgen_chest_top.png", "hyrule_mapgen_chest_top.png", "hyrule_mapgen_chest_side.png",
		"hyrule_mapgen_chest_side.png", "hyrule_mapgen_chest_side.png", "hyrule_mapgen_chest_bosskey.png"},
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
	groups = {cracky = 2, oddly_breakable_by_hand = 1},
	is_ground_content = false,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_rightclick = function(pos, node, clicker, item, _)
		local name = clicker:get_player_name()
		if clicker:get_wielded_item():get_name() == "hyruletools:key" then
			item:take_item()
			minetest.env:add_item(pos, "hyruletools:key_boss")
			minetest.env:remove_node(pos)
		else
		minetest.chat_send_player(name, "It's locked, you need a key!")
		end
	end,
})

minetest.register_node("hyrule_mapgen:bridge", {
	description = "Wooden Bridge",
	tiles = {
		"hyrule_mapgen_bridge.png",
		"hyrule_mapgen_bridge.png",
		"hyrule_mapgen_bridge_side.png",
		"hyrule_mapgen_bridge_side.png",
		"hyrule_mapgen_bridge.png",
		"hyrule_mapgen_bridge.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, -0.125, -0.1875}, -- NodeBox1
			{-0.5, -0.5, 0.1875, 0.5, -0.125, 0.4375}, -- NodeBox2
			{-0.5, -0.5, -0.125, 0.5, -0.125, 0.125}, -- NodeBox3
			{-0.5, -0.4375, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox4
		}
	},
	groups = {choppy=1, oddly_breakable_by_hand=1}
})

minetest.register_craft({
	output = 'hyrule_mapgen:bridge',
	recipe = {
		{'', 'group:wood', ''},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_node("hyrule_mapgen:bridge2", {
	description = "Subrosian Bridge",
	tiles = {
		"hyrule_mapgen_bridge2.png",
		"hyrule_mapgen_bridge2.png",
		"hyrule_mapgen_bridge_side2.png",
		"hyrule_mapgen_bridge_side2.png",
		"hyrule_mapgen_bridge2.png",
		"hyrule_mapgen_bridge2.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, -0.125, -0.1875}, -- NodeBox1
			{-0.5, -0.5, 0.1875, 0.5, -0.125, 0.4375}, -- NodeBox2
			{-0.5, -0.5, -0.125, 0.5, -0.125, 0.125}, -- NodeBox3
			{-0.5, -0.4375, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox4
		}
	},
	groups = {choppy=2, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:swamp_flower", {
	description = "Swamp Flower",
	drawtype = "mesh",
	mesh = "lilypad.b3d",
	tiles = {"hyrule_mapgen_swampflower.png"},
	inventory_image = "hyrule_mapgen_swampflower.png",
	paramtype = "light",
	sunlight_propagates = false,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-1, -0.5, -1, 1, -0.4, 1}
	},
	groups = {cracky=3,dig_immediate=3},
})

playereffects.register_effect_type("float", "", nil, {"gravity"}, 
	function(player)
		player:set_physics_override(nil,nil,0.2)
		physics_overriden = true
	end,
	
	function(effect, player)
		player:set_physics_override(nil,nil,1)
		physics_overriden = false
	end,
	false
)

minetest.register_node("hyrule_mapgen:fallen_leaves", {
	description = "Fallen Leaves",
	tiles = {
		"hyrule_mapgen_leaves.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	place_param2 = random,
	groups = {snappy=2, oddly_breakable_by_hand=1, dig_immediate=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},
		}
	}
})

minetest.register_node("hyrule_mapgen:biglily", {
	description = "Big Waterlily",
	drawtype = "mesh",
	mesh = "lilypad.b3d",
	tiles = {"hyrule_mapgen_biglily.png"},
	inventory_image = "hyrule_mapgen_biglily.png",
	paramtype = "light",
	sunlight_propagates = false,	
	walkable = true,
	is_ground_content = true,
	liquids_pointable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-1, -0.5, -1, 1, -0.4, 1}
	},
	--on_place from flowers waterlily Originally by Ironzorg (MIT) and VanessaE (MIT)
    --Various Minetest developers and contributors.
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local node = minetest.get_node(pointed_thing.under).name
		local def = minetest.registered_nodes[node]
		local player_name = placer:get_player_name()

		if def and def.liquidtype == "source" and
				minetest.get_item_group(node, "water") > 0 then
			if not minetest.is_protected(pos, player_name) then
				minetest.set_node(pos, {name = "hyrule_mapgen:biglily",
					param2 = math.random(0, 3)})
				if not minetest.setting_getbool("creative_mode") then
					itemstack:take_item()
				end
			else
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos, player_name)
			end
		end

		return itemstack
	end,
	groups = {snappy=1, dig_immediate=3,},
})

minetest.register_node("hyrule_mapgen:deku_flower", {
	description = "Deku Flower",
	drawtype = "mesh",
	mesh = "flatnode.b3d",
	tiles = {"hyrule_mapgen_dekuflower.png"},
	inventory_image = "hyrule_mapgen_dekuflower.png",
	paramtype = "light",
	sunlight_propagates = false,	
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	groups = {snappy=1, dig_immediate=3,},
})

minetest.register_node("hyrule_mapgen:healwater_src", {
	description = "Healing Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png^[colorize:pink:150",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	alpha = 160,
	light_source = 14,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = -1,
	liquidtype = "source",
	liquid_alternative_flowing = "hyrule_mapgen:healwater_src",
	liquid_alternative_source = "hyrule_mapgen:healwater_src",
	liquid_range = 0,
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 80, g = 50, b = 50},
	groups = {water = 3, liquid = 3,},
	sounds = default.node_sound_water_defaults(),
})

-- GENERATED CODE
-- Node Box Editor, version 0.8.1 - Glass
-- Namespace: test

minetest.register_node("hyrule_mapgen:geyser", {
	description = "Lava Geyser",
	tiles = {
		"hyrule_mapgen_geyser_top.png",
		"hyrule_mapgen_geyser_side.png",
		"hyrule_mapgen_geyser_side.png",
		"hyrule_mapgen_geyser_side.png",
		"hyrule_mapgen_geyser_side.png",
		"hyrule_mapgen_geyser_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {crumbly=2, oddly_breakable_by_hand=1},
	damage_per_second = 1,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5}, -- NodeBox1
			{-0.4375, -0.3125, -0.4375, 0.4375, -0.125, 0.4375}, -- NodeBox2
			{-0.375, -0.125, -0.375, -0.125, 0, 0.375}, -- NodeBox3
			{0.1875, -0.125, -0.375, 0.375, 0, 0.375}, -- NodeBox4
			{-0.375, -0.125, -0.375, 0.375, 0, -0.1875}, -- NodeBox5
			{-0.3125, -0.125, 0.125, 0.3125, 0, 0.375}, -- NodeBox6
		}
	}
})

--end of generated code

minetest.register_abm({
	nodenames = {"hyrule_mapgen:geyser"},
	interval = 0.5,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 30,
			time = 4,
			minpos = {x=pos.x-0.2, y=pos.y, z=pos.z-0.2},
			maxpos = {x=pos.x+0.2, y=pos.y+1, z=pos.z+0.2},
			minvel = {x=-0.1, y=1, z=-0.1},
			maxvel = {x=0.1, y=2, z=0.1},
			minacc = {x=0, y=-0.5, z=0},
			maxacc = {x=0, y=-1, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 3,
			maxsize = 5,
			collisiondetection = false,
			texture = "hyrule_mapgen_fire.png"
		})
	end
})

minetest.register_node("hyrule_mapgen:leaves_with_gale", {
	description = "Leaves with Gale seed",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"default_leaves.png^hyrule_mapgen_galeseed.png"
	},
	drop = "default:leaves",
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:seed_satchel" then
		local item = clicker:get_wielded_item()
		itemstack:take_item()
		minetest.env:add_item(pos, "hyruletools:seed_gale")
		minetest.env:set_node(pos, {name="default:leaves"})
		end
	end,
	walkable = false,
	groups = {snappy=3, oddly_breakable_by_hand=1, dig_immediate=3}
})

minetest.register_node("hyrule_mapgen:leaves_with_ember", {
	description = "Leaves with Ember seed",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"default_pine_needles.png^hyrule_mapgen_emberseed.png"
	},
	drop = "default:pine_needles",
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:seed_satchel" then
		local item = clicker:get_wielded_item()
		itemstack:take_item()
		minetest.env:add_item(pos, "hyruletools:seed_ember")
		minetest.env:set_node(pos, {name="default:pine_needles"})
		end
	end,
	walkable = false,
	groups = {snappy=3, oddly_breakable_by_hand=1, dig_immediate=3}
})

minetest.register_node("hyrule_mapgen:leaves_with_pegasus", {
	description = "Leaves with Pegasus seed",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"default_jungleleaves.png^hyrule_mapgen_pegasusseed.png"
	},
	drop = "default:jungleleaves",
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:seed_satchel" then
		local item = clicker:get_wielded_item()
		itemstack:take_item()
		minetest.env:add_item(pos, "hyruletools:seed_pegasus")
		minetest.env:set_node(pos, {name="default:jungleleaves"})
		end
	end,
	walkable = false,
	groups = {snappy=3, oddly_breakable_by_hand=1, dig_immediate=3}
})

minetest.register_node("hyrule_mapgen:leaves_with_mystery", {
	description = "Leaves with Mystery seed",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"default_aspen_leaves.png^hyrule_mapgen_mysteryseed.png"
	},
	drop = "default:aspen_leaves",
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:seed_satchel" then
		local item = clicker:get_wielded_item()
		itemstack:take_item()
		minetest.env:add_item(pos, "hyruletools:seed_mystery")
		minetest.env:set_node(pos, {name="default:aspen_leaves"})
		end
	end,
	walkable = false,
	groups = {snappy=3, oddly_breakable_by_hand=1, dig_immediate=3}
})

minetest.register_node("hyrule_mapgen:swamp_mud", {
	description = "Swamp Mud",
	tiles = {
		"hyrule_mapgen_swampmud.png"
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_dirt_defaults()
})

minetest.register_node("hyrule_mapgen:swamp_grass", {
	description = "Swamp Grass",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_swampgrass.png"},
	inventory_image = "hyrule_mapgen_swampgrass.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.5, -0.3, 0.3, 0.4, 0.3}}
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3},
	sounds = default.node_sound_leaves_defaults(),
	on_destruct = function(pos, oldnode)
		local num = math.random(3,7)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
		if num == 4 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
	end,
	drop = "",
})

minetest.register_node("hyrule_mapgen:grupee", {
	description = "Green Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"hyrule_mapgen_grupee.png"
	},
	use_texture_alpha = true,
	groups = {cracky=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:rrupee", {
	description = "Red Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"hyrule_mapgen_rrupee.png"
	},
	use_texture_alpha = true,
	groups = {cracky=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:brupee", {
	description = "Blue Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"hyrule_mapgen_brupee.png"
	},
	use_texture_alpha = true,
	groups = {cracky=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:nrupee", {
	description = "Nyan Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"hyrule_mapgen_nrupee.png"
	},
	use_texture_alpha = true,
	groups = {cracky=1, oddly_breakable_by_hand=1}
})


minetest.register_craft({
	output = 'hyrule_mapgen:grupee',
	recipe = {
		{'hyruletools:green_rupee', 'hyruletools:green_rupee', 'hyruletools:green_rupee'},
		{'hyruletools:green_rupee', 'hyruletools:green_rupee', 'hyruletools:green_rupee'},
		{'hyruletools:green_rupee', 'hyruletools:green_rupee', 'hyruletools:green_rupee'},
	}
})

minetest.register_craft({
	output = 'hyrule_mapgen:rrupee',
	recipe = {
		{'hyruletools:red_rupee', 'hyruletools:red_rupee', 'hyruletools:red_rupee'},
		{'hyruletools:red_rupee', 'hyruletools:red_rupee', 'hyruletools:red_rupee'},
		{'hyruletools:red_rupee', 'hyruletools:red_rupee', 'hyruletools:red_rupee'},
	}
})

minetest.register_craft({
	output = 'hyrule_mapgen:brupee',
	recipe = {
		{'hyruletools:blue_rupee', 'hyruletools:blue_rupee', 'hyruletools:blue_rupee'},
		{'hyruletools:blue_rupee', 'hyruletools:blue_rupee', 'hyruletools:blue_rupee'},
		{'hyruletools:blue_rupee', 'hyruletools:blue_rupee', 'hyruletools:blue_rupee'},
	}
})

minetest.register_craft({
	output = 'hyrule_mapgen:nrupee',
	recipe = {
		{'hyruletools:nyan_rupee', 'hyruletools:nyan_rupee', 'hyruletools:nyan_rupee'},
		{'hyruletools:nyan_rupee', 'hyruletools:nyan_rupee', 'hyruletools:nyan_rupee'},
		{'hyruletools:nyan_rupee', 'hyruletools:nyan_rupee', 'hyruletools:nyan_rupee'},
	}
})

minetest.register_node("hyrule_mapgen:sandstone", {
	description = "Dungeon Sandstone",
	tiles = {
		"hyrule_mapgen_sandstone.png"
	},
	groups = {cracky=3,}
})

stairs.register_stair_and_slab(
	"dsandstone",
	"hyrule_mapgen:sandstone",
	{cracky = 3, oddly_breakable_by_hand = 2, flammable = 2},
	{"hyrule_mapgen_sandstone.png"},
	"Dungeon Sandstone Stair",
	"Dungeon Sandstne Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("hyrule_mapgen:sandstone_tile", {
	description = "Dungeon Sandstone Tile",
	tiles = {
		"hyrule_mapgen_sandstone_tile.png"
	},
	groups = {cracky=3,}
})

minetest.register_node("hyrule_mapgen:sandstone_decoration", {
	description = "Dungeon Sandstone Decoration",
	tiles = {
		"hyrule_mapgen_sandstone.png",
		"hyrule_mapgen_sandstone.png",
		"hyrule_mapgen_sandstone_decoration.png",
		"hyrule_mapgen_sandstone_decoration.png",
		"hyrule_mapgen_sandstone_decoration.png",
		"hyrule_mapgen_sandstone_decoration.png",
	},
	groups = {cracky=3,}
})

minetest.register_node("hyrule_mapgen:sandstone_decoration2", {
	description = "Dungeon Sandstone Decoration 2",
	tiles = {
		"hyrule_mapgen_sandstone.png",
		"hyrule_mapgen_sandstone.png",
		"hyrule_mapgen_sandstone_decoration2.png",
		"hyrule_mapgen_sandstone_decoration2.png",
		"hyrule_mapgen_sandstone_decoration2.png",
		"hyrule_mapgen_sandstone_decoration2.png",
	},
	groups = {cracky=3,}
})

minetest.register_node("hyrule_mapgen:pillar", {
	description = "Sandstone Pillar",
	tiles = {
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_pillar.png",
		"hyrule_mapgen_sandstone_pillar.png",
		"hyrule_mapgen_sandstone_pillar.png",
		"hyrule_mapgen_sandstone_pillar.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=2, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- NodeBox4
		}
	}
})

minetest.register_node("hyrule_mapgen:pillar_base", {
	description = "Sandstone Pillar (base)",
	tiles = {
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_pillar_base.png",
		"hyrule_mapgen_sandstone_pillar_base.png",
		"hyrule_mapgen_sandstone_pillar_base.png",
		"hyrule_mapgen_sandstone_pillar_base.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=2, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			{-0.375, -0.4375, -0.375, 0.375, -0.3125, 0.375}, -- NodeBox2
			{-0.3125, -0.3125, -0.3125, 0.3125, -0.1875, 0.3125}, -- NodeBox3
			{-0.25, -0.1875, -0.25, 0.25, 0.5, 0.25}, -- NodeBox4
		}
	}
})

minetest.register_node("hyrule_mapgen:pillar_top", {
	description = "Sandstone Pillar (top)",
	tiles = {
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_pillar_top.png",
		"hyrule_mapgen_sandstone_pillar_top.png",
		"hyrule_mapgen_sandstone_pillar_top.png",
		"hyrule_mapgen_sandstone_pillar_top.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=2, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, 0.4375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox1
			{-0.375, 0.3125, -0.375, 0.375, 0.4375, 0.375}, -- NodeBox2
			{-0.3125, 0.1875, -0.3125, 0.3125, 0.3125, 0.3125}, -- NodeBox3
			{-0.25, -0.5, -0.25, 0.25, 0.1875, 0.25}, -- NodeBox4
		}
	}
})

minetest.register_node("hyrule_mapgen:greenwall", {
	description = "Green Tile",
	tiles = {
		"hyrule_mapgen_green_wall.png"
	},
	groups = {cracky=1, magnetic=0}
})

minetest.register_node("hyrule_mapgen:beamoswall", {
	description = "Beamos Block",
	tiles = {
		"hyrule_mapgen_beamos_wall.png"
	},
	groups = {cracky=1, magnetic=0}
})

minetest.register_node("hyrule_mapgen:railblock", {
	description = "Railway Block",
	tiles = {
		"hyrule_mapgen_railblock.png"
	},
	groups = {cracky=1, magnetic=0}
})

minetest.register_node("hyrule_mapgen:greentile", {
	description = "Green Dungeon Tile",
	tiles = {
		"hyrule_mapgen_greentile.png"
	},
	groups = {cracky=1,},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:stained_glass", {
	description = "Stained Glass",
	drawtype = "glasslike",
	tiles = {
		"hyrule_mapgen_stainedglass.png"
	},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = 10,
	sunlight_propagates = true,
	groups = {cracky=1, oddly_breakable_by_hand=1, dig_immediate = 3},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:ganon_sphere", {
	description = "Ganon Sphere",
	tiles = {
		"hyrule_mapgen_ganonsphere.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 10,
	groups = {cracky=4, oddly_breakable_by_hand=1},
	walkable = false,
	sounds = default.node_sound_glass_defaults(),
	use_texture_alpha = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.1875, -0.1875, 0.375, 0.1875, 0.1875}, -- NodeBox5
			{-0.1875, -0.375, -0.1875, 0.1875, 0.375, 0.1875}, -- NodeBox6
			{-0.3125, -0.25, -0.25, 0.3125, 0.25, 0.25}, -- NodeBox7
			{-0.25, -0.25, -0.3125, 0.25, 0.25, 0.3125}, -- NodeBox8
			{-0.25, -0.3125, -0.25, 0.25, 0.3125, 0.25}, -- NodeBox9
			{-0.1875, -0.1875, -0.375, 0.1875, 0.1875, 0.375}, -- NodeBox12
		}
	},
	drop = ""
})

minetest.register_node("hyrule_mapgen:floortile", {
	description = "Floor Tile",
	tiles = {
		"hyrule_mapgen_floortile.png"
	},
	groups = {cracky=1, magnetic=1}
})

minetest.register_node("hyrule_mapgen:floorbrick", {
	description = "Floor Brick",
	tiles = {
		"hyrule_mapgen_brick.png"
	},
	groups = {cracky=1}
})


minetest.register_node("hyrule_mapgen:carpet", {
	description = "Carpet Block",
	tiles = {
		"hyrule_mapgen_carpet.png"
	},
	groups = {fleshy=1, dig_immediate=3, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:carpet_trap", {
	description = "Carpet Trap",
	tiles = {
		"hyrule_mapgen_carpet.png"
	},
	walkable = false,
	damage_per_second = 3,
	groups = {fleshy=1, dig_immediate=3, oddly_breakable_by_hand=1}
})


minetest.register_node("hyrule_mapgen:magnblock", {
	description = "Magnetic Block (almost unbreakeable)",
	tiles = {
		"hyrule_mapgen_magnblock.png"
	},
	groups = {cracky=7, magnetic=1}
})

minetest.register_node("hyrule_mapgen:flameblock", {
	description = "Flame Block (almost unbreakeable)",
	tiles = {
		"hyrule_mapgen_flameblock.png"
	},
	groups = {cracky=7, flammable=1}
})


minetest.register_node("hyrule_mapgen:subrosian_stone", {
	description = "Subrosian Stone",
	tiles = {
		"hyrule_mapgen_subrosianstone.png"
	},
	paramtype = "light",
	light_source = 10,
	groups = {cracky=2,}
})


minetest.register_craft({
	output = 'hyrule_mapgen:railblock',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:steel_ingot', 'default:steel_ingot', ''},
		{'', 'default:steel_ingot', ''},
	}
})

local function open_door(pos, player)
		if doors.get then
				    local minp = {x=pos.x-5, y=pos.y, z=pos.z-5}
    local maxp = {x=pos.x+5, y=pos.y, z=pos.z+5}
    local doorss = minetest.find_nodes_in_area(minp, maxp, "group:door")
    for i = 1, #doorss do
       local dpos = {x=doorss[i].x, y=doorss[i].y, z=doorss[i].z}
       local door = doors.get(dpos)
       door:toggle(player)
    end

		end
end

minetest.register_node("hyrule_mapgen:lamp", {
	description = "Floor Lamp",
	tiles = {
		"hyrule_mapgen_lamptop.png",
		"hyrule_mapgen_lamptop.png",
		"hyrule_mapgen_lampside.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0.375, 0.5, 0, 0.5}, -- NodeBox1
			{0.375, -0.5, -0.5, 0.5, 0, -0.375}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, 0, -0.375}, -- NodeBox3
			{-0.5, -0.5, 0.375, -0.375, 0, 0.5}, -- NodeBox4
			{-0.375, -0.5, -0.375, 0.375, -0.1875, 0.375}, -- NodeBox5
			{-0.375, -0.375, -0.4375, 0.375, 0.1875, -0.3125}, -- NodeBox6
			{-0.375, -0.375, 0.3125, 0.375, 0.1875, 0.4375}, -- NodeBox7
			{0.3125, -0.375, -0.375, 0.4375, 0.1875, 0.375}, -- NodeBox8
			{-0.4375, -0.375, -0.375, -0.3125, 0.1875, 0.375}, -- NodeBox9
			{-0.1875, -0.5, -0.1875, 0.1875, -0.0625, 0.1875}, -- NodeBox10
			{-0.4375, -0.5, -0.4375, 0.4375, 0.0625, 0.4375}, -- NodeBox11
		}
	},
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:lantern" then
			minetest.set_node(pos, {name="hyrule_mapgen:lamp_lit"})
			open_door(pos, clicker)
		end
	end,
	groups = {cracky=1, falling_node=1},
})

minetest.register_node("hyrule_mapgen:lamp_lit", {
	description = "Floor Lamp",
	tiles = {
		"hyrule_mapgen_lamptop.png",
		"hyrule_mapgen_lamptop.png",
		"hyrule_mapgen_lampside.png",
	},
	drawtype = "nodebox",
	light_source = 10,
	sunlight_propagates = false,
	paramtype = "light",
	drop = "hyrule_mapgen:lamp",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0.375, 0.5, 0, 0.5}, -- NodeBox1
			{0.375, -0.5, -0.5, 0.5, 0, -0.375}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, 0, -0.375}, -- NodeBox3
			{-0.5, -0.5, 0.375, -0.375, 0, 0.5}, -- NodeBox4
			{-0.375, -0.5, -0.375, 0.375, -0.1875, 0.375}, -- NodeBox5
			{-0.375, -0.375, -0.4375, 0.375, 0.1875, -0.3125}, -- NodeBox6
			{-0.375, -0.375, 0.3125, 0.375, 0.1875, 0.4375}, -- NodeBox7
			{0.3125, -0.375, -0.375, 0.4375, 0.1875, 0.375}, -- NodeBox8
			{-0.4375, -0.375, -0.375, -0.3125, 0.1875, 0.375}, -- NodeBox9
			{-0.1875, -0.5, -0.1875, 0.1875, -0.0625, 0.1875}, -- NodeBox10
			{-0.4375, -0.5, -0.4375, 0.4375, 0.0625, 0.4375}, -- NodeBox11
		}
	},
	groups = {cracky=1, falling_node=1, not_in_creative_inventory=1},
})

minetest.register_abm({
	nodenames = {"hyrule_mapgen:lamp_lit"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local part = minetest.add_particlespawner(
			5, --amount
			1, --time
			{x=pos.x-0.1, y=pos.y, z=pos.z-0.1}, --minpos
			{x=pos.x+0.1, y=pos.y+0.2, z=pos.z+0.1}, --maxpos
			{x=-0, y=0.5, z=-0}, --minvel
			{x=0, y=1, z=0}, --maxvel
			{x=0,y=0.5,z=0}, --minacc
			{x=0.5,y=0.5,z=0.5}, --maxacc
			0.2, --minexptime
			0.5, --maxexptime
			4, --minsize
			8, --maxsize
			false, --collisiondetection
			"hyrule_mapgen_flame.png" --texture
		)
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

minetest.register_node("hyrule_mapgen:rock", {
	description = "Rock",
	tiles = {
		"hyrule_mapgen_rock.png",
		"hyrule_mapgen_rock.png",
		"hyrule_mapgen_rock.png",
		"hyrule_mapgen_rock.png",
		"hyrule_mapgen_rock.png",
		"hyrule_mapgen_rock.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=1, falling_node=1},
	on_destruct = function(pos, oldnode)
		local num = math.random(3,5)
		if num == 5 then
		minetest.env:add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:green_rupee")
		end
	end,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.4375, -0.4375, -0.3125, 0.375, -0.125, 0.25}, -- NodeBox2
			{-0.3125, -0.125, -0.375, 0.25, -0.0625, 0.3125}, -- NodeBox3
			{-0.3125, -0.4375, -0.4375, 0.25, -0.125, 0.375}, -- NodeBox4
			{-0.375, -0.4375, -0.375, 0.3125, -0.125, 0.3125}, -- NodeBox5
			{-0.25, -0.0625, -0.3125, 0.1875, 0, 0.25}, -- NodeBox6
			{-0.375, -0.125, -0.25, 0.3125, -0.0625, 0.1875}, -- NodeBox7
		}
	}
})

minetest.register_node("hyrule_mapgen:packed_dirt", {
	description = "Packed Dirt",
	tiles = {
		"default_dirt.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	drop = "default:dirt",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.4, 0.5},
		}
	}
})

minetest.register_node("hyrule_mapgen:wallring", {
	description = "Wall Ring",
	tiles = {
		"hyrule_mapgen_railblock.png",
		"hyrule_mapgen_railblock.png",
		"hyrule_mapgen_wallring.png",
		"hyrule_mapgen_wallring.png",
		"hyrule_mapgen_wallring.png",
		"hyrule_mapgen_wallring.png",
	},
	groups = {cracky=1, hook=1}
})

minetest.register_craft({
	output = 'hyrule_mapgen:wallring',
	recipe = {
		{'hyrule_mapgen:railblock', 'default:steel_ingot'},
	}
})


minetest.register_node("hyrule_mapgen:lavabiome_dirt", {
	description = "Burnt Dirt",
	tiles = {
		"hyrule_mapgen_dirt.png"
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:stone_with_redrupee", {
	description = "Buried red rupee",
	tiles = {"default_stone.png^hyruletools_redrupee_ore.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'hyruletools:red_rupee',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("hyrule_mapgen:stone_with_bluerupee", {
	description = "Buried blue rupee",
	tiles = {"default_stone.png^hyruletools_bluerupee_ore.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'hyruletools:blue_rupee',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("hyrule_mapgen:stone_with_greenrupee", {
	description = "Buried green rupee",
	tiles = {"default_stone.png^hyruletools_greenrupee_ore.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'hyruletools:green_rupee',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("hyrule_mapgen:dungeon_barrier", {
	description = "Retro Dungeon Barrier",
	tiles = {
		"hyrule_mapgen_dungeon_barrier.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_tile", {
	description = "Retro Dungeon Tile",
	tiles = {
		"hyrule_mapgen_dungeon_tile.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_brick", {
	description = "Retro Dungeon Brick",
	tiles = {
		"hyrule_mapgen_dungeon_brick.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_barrier2", {
	description = "Retro Dungeon Barrier 2",
	tiles = {
		"hyrule_mapgen_dungeon_barrier2.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_tile2", {
	description = "Retro Dungeon Tile 2",
	tiles = {
		"hyrule_mapgen_dungeon_tile2.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_brick2", {
	description = "Retro Dungeon Brick 2",
	tiles = {
		"hyrule_mapgen_dungeon_brick2.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_torch", {
	description = "Dungeon Torch",
	drawtype = "plantlike",
	visual_scale = 1.6,
	walkable = false,
	tiles = {
		{name = "hyrule_mapgen_torch.png", animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 0.5,},
		},
	},
	inventory_image = "hyrule_mapgen_torch_inv.png",
	wield_image = "hyrule_mapgen_torch_inv.png",
	paramtype = "light",
	light_source = 14,
	use_texture_alpha = true,
	groups = {choppy=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.2, 0.5},
		}
	},
})

minetest.register_node("hyrule_mapgen:subrosian_tile", {
	description = "Subrosian Tile",
	tiles = {
		"hyrule_mapgen_subrosiantile.png",
	},
	paramtype = "light",
	light_source = 10,
	groups = {cracky=2},
})

minetest.register_node("hyrule_mapgen:subrosian_sand", {
	description = "Subrosian Sand",
	tiles = {
		"hyrule_mapgen_subrosiansand.png",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:50",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:10",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:60",
	},
	paramtype = "light",
	light_source = 10,
	groups = {crumbly=1, oddly_breakable_by_hand=1},
})

minetest.register_node("hyrule_mapgen:blue_ore", {
	description = "Subrosian Sand",
	tiles = {
		"hyrule_mapgen_subrosiansand.png",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:50",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:10",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:60",
	},
	paramtype = "light",
	light_source = 10,
	drop = "hyruletools:blue_ore",
	groups = {crumbly=1, oddly_breakable_by_hand=1, xp=1, not_in_creative_inventory=1},
})

minetest.register_node("hyrule_mapgen:red_ore", {
	description = "Subrosian Sand",
	tiles = {
		"hyrule_mapgen_subrosiansand.png",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:50",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:10",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:60",
	},
	paramtype = "light",
	light_source = 10,
	drop = "hyruletools:red_ore",
	groups = {crumbly=1, oddly_breakable_by_hand=1, xp=1, not_in_creative_inventory=1},
})

minetest.register_node("hyrule_mapgen:stalagtite", {
	description = "Stalagtite",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_stalagmite0.png"},
	inventory_image = "hyrule_mapgen_stalagmite0.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:stalagtite1", {
	description = "Stalagtite",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_stalagmite1.png"},
	inventory_image = "hyrule_mapgen_stalagmite1.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
})

minetest.register_node("hyrule_mapgen:stalagtite2", {
	description = "Stalagtite",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_stalagmite2.png"},
	inventory_image = "hyrule_mapgen_stalagmite2.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:stalagtite3", {
	description = "Stalagtite",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_stalagmite3.png"},
	inventory_image = "hyrule_mapgen_stalagmite3.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:stalagmite0", {
	description = "Stalagmite",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_stalagmite0.png^[transformFY"},
	inventory_image = "hyrule_mapgen_stalagmite0.png^[transformFY",
	is_ground_content = false,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:stalagmite1", {
	description = "Stalagmite",
	drawtype = "plantlike",
	visual_scale = 1.5,
	tiles = {"hyrule_mapgen_stalagmite3.png^[transformFY"},
	inventory_image = "hyrule_mapgen_stalagmite3.png^[transformFY",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:stalagmite2", {
	description = "Stalagmite",
	drawtype = "plantlike",
	visual_scale = 1.5,
	tiles = {"hyrule_mapgen_stalagmite2.png^[transformFY"},
	inventory_image = "hyrule_mapgen_stalagmite2.png^[transformFY",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:cicicle", {
	description = "Ceiling Icicle",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_icicle.png"},
	inventory_image = "hyrule_mapgen_icicle.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	use_texture_alpha = true,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:cicicle2", {
	description = "Ceiling Icicle 2",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_icicle2.png"},
	inventory_image = "hyrule_mapgen_icicle2.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	use_texture_alpha = true,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:roots", {
	description = "Hanging Roots",
	drawtype = "torchlike",
	tiles = {"hyrule_mapgen_roots.png"},
	inventory_image = "hyrule_mapgen_roots.png",
	is_ground_content = false,
	sunlight_propagates = true,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
})

minetest.register_node("hyrule_mapgen:roots2", {
	description = "Hanging Root",
	drawtype = "torchlike",
	tiles = {"hyrule_mapgen_roots2.png"},
	inventory_image = "hyrule_mapgen_roots2.png",
	is_ground_content = false,
	sunlight_propagates = true,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
})

tnt.register_tnt({
	name = "hyrule_mapgen:powder_keg",
	description = "Powder Keg",
	tiles = {
		"hyrule_mapgen_keg_top.png",
		"hyrule_mapgen_keg_top.png",
		"hyrule_mapgen_keg_side.png",
		"hyrule_mapgen_keg_side.png",
		"hyrule_mapgen_keg_front.png",
		"hyrule_mapgen_keg_front.png",
	},
	radius = 3,
})

minetest.register_node("hyrule_mapgen:statue", {
	description = "Gossip Stone",
	tiles = {
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.1875, 0.4375, 0.4375, 0.25}, -- NodeBox1
			{-0.375, 0.4375, -0.1875, 0.375, 0.5, 0.25}, -- NodeBox2
		}
	},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:eye" then
			minetest.set_node(pos, {name="hyrule_mapgen:statue_active", param2=node.param2})
		end
	end
})


minetest.register_node("hyrule_mapgen:statue_active", {
	tiles = {
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_active.png"
	},
	drop = 'hyrule_mapgen:statue',
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, falling_node=1},
	light_source = 5,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.1875, 0.4375, 0.4375, 0.25}, -- NodeBox1
			{-0.375, 0.4375, -0.1875, 0.375, 0.5, 0.25}, -- NodeBox2
		}
	},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:eye" then
			minetest.set_node(pos, {name="hyrule_mapgen:statue", param2=node.param2})
		end
	end
})


minetest.register_node("hyrule_mapgen:glowstone", {
	description = "glowstone",
	drawtype = "allfaces",
	tiles = {
		"hyrulemapgen_glowstone.png"
	},
	use_texture_alpha = true,
	groups = {snappy=3, oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 14,
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("hyrule_mapgen:volvagia_spawn", {
	description = "Volvagia spawner",
	tiles = {
		"hyrule_mapgen_vspawn.png"
	},
	groups = {snappy=3, oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
	minetest.after(5, function()
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "mobs_loz:volvagia")
	minetest.sound_play("BrassFleece", {gain=0.3})
	end)
	end,
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:sword" then
			minetest.set_node(pos, {name="hyrule_mapgen:ganon_spawn", param2=node.param2})
		end
	end
})

minetest.register_node("hyrule_mapgen:ganon_spawn", {
	description = "Ganon spawner",
	tiles = {
		"hyrule_mapgen_gspawn.png"
	},
	groups = {snappy=3, oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
	minetest.place_schematic({x=pos.x-6, y=pos.y-1, z=pos.z-6}, minetest.get_modpath("hyrule_mapgen").."/schematics/ganon_dungeon.mts", random, {}, true)
	minetest.after(5, function()
	minetest.add_entity({x=pos.x+3, y=pos.y+1, z=pos.z+3}, "mobs_loz:ganon")
	end)
	end,
})

minetest.register_craft({
	output = 'hyrule_mapgen:volvagia_spawn',
	recipe = {
		{'', 'default:stone', ''},
		{'buckets:bucket_lava', 'hyruletools:pendant3', 'buckets:bucket_lava'},
		{'', 'default:stone', ''},
	}
})

minetest.register_node("hyrule_mapgen:bongo_spawn", {
	description = "Bongo Bongo spawner",
	tiles = {
		"hyrule_mapgen_wspawn.png"
	},
	groups = {snappy=3, oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
	minetest.after(5, function()
	minetest.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:bongobongo")
	end)
	end,
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:sword" then
			minetest.set_node(pos, {name="hyrule_mapgen:ganon_spawn", param2=node.param2})
		end
	end
})

minetest.register_craft({
	output = 'hyrule_mapgen:bongo_spawn',
	recipe = {
		{'', 'default:stone', ''},
		{'buckets:bucket_lava', 'hyruletools:pendant1', 'buckets:bucket_lava'},
		{'', 'default:stone', ''},
	}
})

minetest.register_node("hyrule_mapgen:dodongo_spawn", {
	description = "King Dodongo spawner",
	tiles = {
		"hyrule_mapgen_dspawn.png"
	},
	groups = {snappy=3, oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
	minetest.after(5, function()
	minetest.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:dodongo_boss")
	end)
	end,
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:sword" then
			minetest.set_node(pos, {name="hyrule_mapgen:ganon_spawn", param2=node.param2})
		end
	end
})

minetest.register_craft({
	output = 'hyrule_mapgen:dodongo_spawn',
	recipe = {
		{'', 'default:tree', ''},
		{'moreplants:eye', 'hyruletools:pendant2', 'moreplants:eye'},
		{'', 'default:tree', ''},
	}
})

minetest.register_node("hyrule_mapgen:boulder", {
	description = "Boulder",
	tiles = {
		"default_stone.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.0625, 0.5}, -- NodeBox1
			{-0.5, -0.375, -0.625, 0.5, 0.9375, 0.625}, -- NodeBox2
			{-0.625, -0.375, -0.5, 0.625, 0.9375, 0.5}, -- NodeBox3
			{-0.5, -0.25, -0.6875, 0.5, 0.8125, 0.6875}, -- NodeBox4
			{-0.6875, -0.25, -0.5, 0.6875, 0.8125, 0.5}, -- NodeBox5
			{-0.5625, -0.25, -0.5625, 0.5625, 0.8125, 0.5625}, -- NodeBox6
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.0625, 0.5}, -- NodeBox1
			{-0.5, -0.375, -0.625, 0.5, 0.9375, 0.625}, -- NodeBox2
			{-0.625, -0.375, -0.5, 0.625, 0.9375, 0.5}, -- NodeBox3
			{-0.5, -0.25, -0.6875, 0.5, 0.8125, 0.6875}, -- NodeBox4
			{-0.6875, -0.25, -0.5, 0.6875, 0.8125, 0.5}, -- NodeBox5
			{-0.5625, -0.25, -0.5625, 0.5625, 0.8125, 0.5625}, -- NodeBox6
		}
	},
	groups = {explody=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:snowball", {
	description = "Snow Boulder",
	tiles = {
		"default_snow.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.0625, 0.5}, -- NodeBox1
			{-0.5, -0.375, -0.625, 0.5, 0.9375, 0.625}, -- NodeBox2
			{-0.625, -0.375, -0.5, 0.625, 0.9375, 0.5}, -- NodeBox3
			{-0.5, -0.25, -0.6875, 0.5, 0.8125, 0.6875}, -- NodeBox4
			{-0.6875, -0.25, -0.5, 0.6875, 0.8125, 0.5}, -- NodeBox5
			{-0.5625, -0.25, -0.5625, 0.5625, 0.8125, 0.5625}, -- NodeBox6
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.0625, 0.5}, -- NodeBox1
			{-0.5, -0.375, -0.625, 0.5, 0.9375, 0.625}, -- NodeBox2
			{-0.625, -0.375, -0.5, 0.625, 0.9375, 0.5}, -- NodeBox3
			{-0.5, -0.25, -0.6875, 0.5, 0.8125, 0.6875}, -- NodeBox4
			{-0.6875, -0.25, -0.5, 0.6875, 0.8125, 0.5}, -- NodeBox5
			{-0.5625, -0.25, -0.5625, 0.5625, 0.8125, 0.5625}, -- NodeBox6
		}
	},
	groups = {explody=1},
	sounds = default.node_sound_dirt_defaults()
})

minetest.register_node("hyrule_mapgen:magic_tree", {
	description = "magic tree trunk",
	tiles = {
		"hyrule_mapgen_magic_tree_top.png",
		"hyrule_mapgen_magic_tree_top.png",
		"hyrule_mapgen_magic_tree.png",
		"hyrule_mapgen_magic_tree.png",
		"hyrule_mapgen_magic_tree.png",
		"hyrule_mapgen_magic_tree.png"
	},
	paramtype = "facedir",
	groups = {tree=1, choppy=2, flammable=2, oddly_breakable_by_hand = 1, not_in_creative_inventory=1},
	on_place = minetest.rotate_node
})

minetest.register_node("hyrule_mapgen:magic_leaves", {
	description = "magic leaves",
	drawtype = "allfaces_optional",
	tiles = {
		"hyrule_mapgen_magic_leaves.png"
	},
	groups = {snappy=3, flammable=1, leafdecay=3, oddly_breakable_by_hand = 1, leaves=1, not_in_creative_inventory=1},
	paramtype = "light",
	walkable = false,
})

if minetest.setting_getbool("3d_leaves") then
minetest.override_item("hyrule_mapgen:magic_leaves", {
	drawtype = "mesh",
	mesh = "leaf.obj",
	tiles = {"hyrule_mapgen_magic_leaves2.png"},
	paramtype = "light",
})
end

minetest.register_node("hyrule_mapgen:canopy_leaves", {
	description = "canopy leaves",
	drawtype = "allfaces_optional",
	tiles = {
		"default_leaves.png"
	},
	groups = {snappy=3, flammable=1, leaves=1, oddly_breakable_by_hand = 1, not_in_creative_inventory=1},
	paramtype = "light",
	walkable = false,
})

minetest.register_node("hyrule_mapgen:palm_tree", {
	description = "palm tree trunk",
	tiles = {
		"hyrule_mapgen_palm_tree_top.png",
		"hyrule_mapgen_palm_tree_top.png",
		"hyrule_mapgen_palm_tree.png",
		"hyrule_mapgen_palm_tree.png",
		"hyrule_mapgen_palm_tree.png",
		"hyrule_mapgen_palm_tree.png"
	},
	paramtype = "facedir",
	groups = {tree=1, choppy=2, flammable=2, oddly_breakable_by_hand = 1, not_in_creative_inventory=1},
	on_place = minetest.rotate_node
})

minetest.register_node("hyrule_mapgen:palm_leaves", {
	description = "palm leaves",
	drawtype = "plantlike",
	tiles = {
		"hyrule_mapgen_palm_leaf.png"
	},
	inventory_image = "hyrule_mapgen_palm_leaf.png",
	visual_scale = 3,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, leafdecay=3, oddly_breakable_by_hand = 1, leaves=1, not_in_creative_inventory=1},
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
})

minetest.register_node("hyrule_mapgen:coconut", {
	description = "coconut",
	drawtype = "plantlike",
	tiles = {
		"hyrule_mapgen_coconut.png"
	},
	wield_image = "hyrule_mapgen_coconut.png",
	inventory_image = "hyrule_mapgen_coconut.png",
	groups = {snappy=3, flammable=1, oddly_breakable_by_hand = 1, not_in_creative_inventory=1},
	paramtype = "light",
	walkable = false,
	on_use = minetest.item_eat(2)
})

minetest.register_node("hyrule_mapgen:wild_tree", {
	description = "wild tree trunk",
	tiles = {
		"hyrule_mapgen_wild_tree_top.png",
		"hyrule_mapgen_wild_tree_top.png",
		"hyrule_mapgen_wild_tree.png",
		"hyrule_mapgen_wild_tree.png",
		"hyrule_mapgen_wild_tree.png",
		"hyrule_mapgen_wild_tree.png"
	},
	paramtype = "facedir",
	groups = {tree=1, choppy=2, oddly_breakable_by_hand = 1, flammable=2, not_in_creative_inventory=1},
	on_place = minetest.rotate_node
})

minetest.register_node("hyrule_mapgen:wild_leaves", {
	description = "wild tree leaves",
	drawtype = "plantlike",
	tiles = {
		"hyrule_mapgen_wild_leaves.png"
	},
	wield_image = "hyrule_mapgen_wild_leaves.png",
	inventory_image = "hyrule_mapgen_wild_leaves.png",
	groups = {snappy=3, flammable=1, oddly_breakable_by_hand = 1, leafdecay=3, leaves=1, not_in_creative_inventory=1},
	paramtype = "light",
	walkable = false,
})

if minetest.setting_getbool("3d_leaves") then
minetest.override_item("hyrule_mapgen:wild_leaves", {
	drawtype = "mesh",
	mesh = "leaf.obj",
	tiles = {"hyrule_mapgen_wild_leaves2.png"},
	paramtype = "light",
})
end

minetest.register_craft({
	output = "default:wood 4",
	type = "shapeless",
	recipe = {"hyrule_mapgen:palm_tree"}
})

minetest.register_craft({
	output = "default:junglewood 4",
	type = "shapeless",
	recipe = {"hyrule_mapgen:wild_tree"}
})

minetest.register_craft({
	output = "default:acacia_wood 4",
	type = "shapeless",
	recipe = {"hyrule_mapgen:magic_tree"}
})

minetest.register_node("hyrule_mapgen:magicsapling", {
	description = "Magic Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"hyrule_mapgen_magic_sapling.png"},
	inventory_image = "hyrule_mapgen_magic_sapling.png",
	wield_image = "hyrule_mapgen_magic_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
})

minetest.register_node("hyrule_mapgen:palmsapling", {
	description = "Palm Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"hyrule_mapgen_palm_sapling.png"},
	inventory_image = "hyrule_mapgen_palm_sapling.png",
	wield_image = "hyrule_mapgen_palm_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
})

minetest.register_node("hyrule_mapgen:bigsapling", {
	description = "Big Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"hyrule_mapgen_big_sapling.png"},
	inventory_image = "hyrule_mapgen_big_sapling.png",
	wield_image = "hyrule_mapgen_big_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
})

minetest.register_node("hyrule_mapgen:wildsapling", {
	description = "Wild Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"hyrule_mapgen_wild_sapling.png"},
	inventory_image = "hyrule_mapgen_wild_sapling.png",
	wield_image = "hyrule_mapgen_wild_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
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