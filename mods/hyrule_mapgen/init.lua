
local mg_name = minetest.get_mapgen_params().mgname or ""

if mg_name ~= "v6" then
dofile(minetest.get_modpath("hyrule_mapgen").."/mapgen.lua")
end

--overrides

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
			texture = "hyrule_mapgen_spark.png"
		})
	end
})


minetest.register_node("hyrule_mapgen:lavabiome_dirt", {
	description = "Burnt Dirt",
	tiles = {
		"hyrule_mapgen_dirt.png"
	},
	paramtype = "light",
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
			{-0.375, 0.4375, -0.1875, 0.3125, 0.5, 0.25}, -- NodeBox2
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