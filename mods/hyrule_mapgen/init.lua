
local mg_name = minetest.get_mapgen_params().mgname or ""

if mg_name ~= "v6" then
dofile(minetest.get_modpath("hyrule_mapgen").."/mapgen.lua")
end

--effects
minetest.register_abm({
	nodenames = {"flowers:flower_rose", "flowers:flower_tulip", "flowers:flower_dandelion_yellow", "flowers:flower_viola", "flowers:flower_dandelion_white", "flowers:flower_geranium"},
	interval = 3.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.env:add_entity({x=pos.x,y=pos.y,z=pos.z}, "hyrule_mapgen:butterfly")
	end
})

sound = false

minetest.register_abm({
	nodenames = {"default:water_flowing"},
	interval = 1.0, -- Run every 10 seconds
	chance = 1, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		local above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		local below = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local above2 = minetest.get_node({x=pos.x, y=pos.y+2, z=pos.z}).name
		if above == "default:water_flowing" and below ~= "default:water_flowing" and above2 == "default:water_flowing" then
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
	nodenames = {"default:river_water_flowing"},
	interval = 1.0, -- Run every 10 seconds
	chance = 1, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		local above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		local below = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local above2 = minetest.get_node({x=pos.x, y=pos.y+2, z=pos.z}).name
		if above == "default:river_water_flowing" and below ~= "default:river_water_flowing" and above2 == "default:river_water_flowing" then
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
	interval = 1.0, -- Run every 10 seconds
	chance = 2, -- Select every 1 in 50 nodes
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


--entities

minetest.register_entity("hyrule_mapgen:butterfly", {
	visual = "sprite",
	physical = true,
	textures = {"hyrule_mapgen_butterfly.png",},
	visual_size = {x=0.2, y=0.2},
	on_activate = function(self)
		num = math.random(1,4)
		self.object:set_properties({textures = {"hyrule_mapgen_butterfly"..num..".png",},})
		minetest.after(5, function()
		self.object:remove()
		end)
	end,
	on_step = function(self)
		local pos = self.object:getpos()
		local vec = self.object:getvelocity()
		self.object:setvelocity({x=-math.sin(12*pos.y), y=math.cos(12*pos.x), z=-math.sin(12*pos.y)})
		self.object:setacceleration({x=-math.sin(6*vec.y), y=math.cos(6*vec.x), z=-math.sin(6*vec.y)})
	end,
	collisionbox = {0,0,0,0,0.1,0},
})

--overrides

minetest.override_item("default:grass_1", {
	on_destruct = function(pos, oldnode)
		local num = math.random(3,5)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
	end,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	},
})

minetest.override_item("default:grass_2", {
	on_destruct = function(pos, oldnode)
		local num = math.random(3,5)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
	end,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	},
})

minetest.override_item("default:grass_3", {
	on_destruct = function(pos, oldnode)
		local num = math.random(3,5)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
	end,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	},
})

minetest.override_item("default:grass_4", {
	on_destruct = function(pos, oldnode)
		local num = math.random(3,5)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
	end,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	},
})

minetest.override_item("default:grass_5", {
	on_destruct = function(pos, oldnode)
		local num = math.random(3,5)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
	end,
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
	drawtype = "signlike",
	visual_scale = 3.0,
	tiles = {"hyrule_mapgen_swampflower.png"},
	inventory_image = "hyrule_mapgen_swampflower.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = false,	
	light_source = 50,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	groups = {cracky=3,dig_immediate=3},
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
	light_source = 15,
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


minetest.register_node("hyrule_mapgen:railblock", {
	description = "Railway Block",
	tiles = {
		"hyrule_mapgen_railblock.png"
	},
	groups = {cracky=1, magnetic=0}
})

minetest.register_node("hyrule_mapgen:magnblock", {
	description = "Magnetic Block (almost unbreakeable)",
	tiles = {
		"hyrule_mapgen_magnblock.png"
	},
	groups = {cracky=7, magnetic=1}
})

minetest.register_node("hyrule_mapgen:subrosian_stone", {
	description = "Subrosian Stone",
	tiles = {
		"hyrule_mapgen_subrosianstone.png"
	},
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
	description = "Dungeon Barrier",
	tiles = {
		"hyrule_mapgen_dungeon_barrier.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_tile", {
	description = "Dungeon Tile",
	tiles = {
		"hyrule_mapgen_dungeon_tile.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_brick", {
	description = "Dungeon Brick",
	tiles = {
		"hyrule_mapgen_dungeon_brick.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:subrosian_tile", {
	description = "Subrosian Tile",
	tiles = {
		"hyrule_mapgen_subrosiantile.png",
	},
	groups = {cracky=2},
})

minetest.register_node("hyrule_mapgen:subrosian_sand", {
	description = "Subrosian Sand",
	tiles = {
		"hyrule_mapgen_subrosiansand.png",
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
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
			{-0.375, 0.4375, -0.1875, 0.3125, 0.5, 0.25}, -- NodeBox2
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
	light_source = 30,
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
	minetest.after(5, function()
	minetest.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:ganon")
	end)
	end,
})

minetest.register_craft({
	output = 'hyrule_mapgen:volvagia_spawn',
	recipe = {
		{'', 'default:stone', ''},
		{'mobs:lava_orb', 'hyruletools:pendant3', 'mobs:lava_orb'},
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
		{'mobs:lava_orb', 'hyruletools:pendant1', 'mobs:lava_orb'},
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
})

minetest.register_node("hyrule_mapgen:canopy_leaves", {
	description = "canopy leaves",
	drawtype = "allfaces_optional",
	tiles = {
		"default_leaves.png"
	},
	groups = {snappy=3, flammable=1, leaves=1, oddly_breakable_by_hand = 1, not_in_creative_inventory=1},
	paramtype = "light",
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
})

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