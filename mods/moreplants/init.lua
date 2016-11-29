
--moreplants by D00Med

--plants

minetest.register_node("moreplants:tallgrass", {
	description = "Tall Grass",
	drawtype = "plantlike",
	tiles = {"moreplants_longgrass.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_longgrass.png",
	visual_scale = 1.4,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
})

minetest.register_node("moreplants:aliengrass", {
	description = "Alien Grass",
	drawtype = "plantlike",
	tiles = {"moreplants_aliengrass.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_aliengrass.png",
	visual_scale = 1.54,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
})



minetest.register_node("moreplants:bulrush", {
	description = "Bulrush",
	drawtype = "plantlike",
	tiles = {"moreplants_bullrush.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_bullrush.png",
	visual_scale = 1.3,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
})

minetest.register_node("moreplants:bigfern", {
	description = "Big Fern",
	drawtype = "plantlike",
	tiles = {"moreplants_bigfern.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_bigfern.png",
	visual_scale = 1.5,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
})

minetest.register_node("moreplants:umbrella", {
	description = "Umbrella Weed",
	drawtype = "plantlike",
	tiles = {"moreplants_umbrella.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_umbrella.png",
	visual_scale = 2,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 3, 0.3}
	},
	walkable = true,
})

minetest.register_node("moreplants:bigflower", {
	description = "Big Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_bigflower.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_bigflower.png",
	visual_scale = 1.2,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flower=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
})

minetest.register_node("moreplants:medflower", {
	description = "Medium Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_medflower.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_medflower.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flower=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	on_use = minetest.item_eat(1),
	walkable = false,
})


minetest.register_node("moreplants:weed", {
	description = "Weed",
	drawtype = "plantlike",
	tiles = {"moreplants_weed.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_weed.png",
	visual_scale = 1.1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
})

minetest.register_node("moreplants:stoneweed", {
	description = "Stone weed",
	drawtype = "plantlike",
	tiles = {"moreplants_stoneplant.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_stoneplant.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:spikefern", {
	description = "Spike Fern",
	drawtype = "plantlike",
	tiles = {"moreplants_spikefern.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_spikefern.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:bluespike", {
	description = "Blue Spikeflower",
	drawtype = "plantlike",
	tiles = {"moreplants_bluespike.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_bluespike.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:blueflower", {
	description = "blue flower",
	drawtype = "plantlike",
	tiles = {"moreplants_blueflower.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_blueflower.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flower=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:eyeweed", {
	description = "Eye weed",
	drawtype = "plantlike",
	tiles = {"moreplants_eyeweed.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_eyeweed.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	drop = "moreplants:eye",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:fern", {
	description = "Fern",
	drawtype = "plantlike",
	tiles = {"moreplants_fern.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_fern.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:bush", {
	description = "Bush",
	drawtype = "plantlike",
	tiles = {"moreplants_bush.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_bush.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:cactus", {
	description = "Small Cactus",
	drawtype = "plantlike",
	tiles = {"moreplants_cactus.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_cactus.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
	damage_per_second = 1
})

minetest.register_node("moreplants:firefung", {
	description = "Fire Mushroom",
	drawtype = "plantlike",
	tiles = {"moreplants_firemush.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_firemush.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, igniter=1, hot=3, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:bluemush", {
	description = "Blue Cave Mushroom",
	drawtype = "plantlike",
	tiles = {"moreplants_bluemush.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_bluemush.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	on_use = minetest.item_eat(1),
	walkable = false,
})

minetest.register_node("moreplants:caveflower", {
	description = "Cave flower",
	drawtype = "plantlike",
	tiles = {"moreplants_cavefung.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_cavefung.png",
	visual_scale = 1,
	light_source = 5,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flower=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:moonflower", {
	description = "Moon Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_moonflower.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_moonflower.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flower=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:fireflower", {
	description = "Fire flower",
	drawtype = "plantlike",
	tiles = {"moreplants_fireflower.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_fireflower.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flower=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	walkable = false,
})

minetest.register_node("moreplants:deadweed", {
	description = "dead weed",
	drawtype = "plantlike",
	tiles = {"moreplants_deadweed.png"},
	paramtype = "light",
	light_source = 5,
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_deadweed.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	walkable = false,
})

minetest.register_node("moreplants:taigabush", {
	description = "Taiga bush",
	drawtype = "plantlike",
	tiles = {"moreplants_tundrabush.png"},
	paramtype = "light",
	light_source = 5,
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_tundrabush.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	walkable = false,
})

minetest.register_node("moreplants:glowfung", {
	description = "glow fungus",
	drawtype = "torchlike",
	tiles = {"moreplants_glowfung.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	light_source = 20,
	legacy_wallmounted = true,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	paramtype2 = "wallmounted",
	is_ground_content = false,
	inventory_image = "moreplants_glowfung.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	walkable = false,
})

minetest.register_node("moreplants:jungleflower", {
	description = "Jungle flower",
	drawtype = "plantlike",
	tiles = {"moreplants_jungleflower1.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_jungleflower1.png",
	visual_scale = 1.1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flower=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.4, -0.5, -0.4, 0.4, 0.4, 0.4}
	},
	walkable = false,
})

minetest.register_node("moreplants:mushroom", {
	description = "Pink Mushroom",
	tiles = {
		"moreplants_mushroom_top.png",
		"moreplants_mushroom_top.png",
		"moreplants_mushroom_side.png",
		"moreplants_mushroom_side.png",
		"moreplants_mushroom_side.png",
		"moreplants_mushroom_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	buildable_to = true, 
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.3125, 0.0625}, -- NodeBox1
			{-0.1875, -0.3125, -0.1875, 0.1875, -0.1875, 0.1875}, -- NodeBox2
			{-0.125, -0.1875, -0.125, 0.125, -0.125, 0.125}, -- NodeBox3
		}
	},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	light_source=2,
})

minetest.register_node("moreplants:curly", {
	description = "Curly flower",
	drawtype = "plantlike",
	tiles = {"moreplants_curly.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_curly.png",
	visual_scale = 1.1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	drop = "moreplants:curlyfruit",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.4, 0.3}
	},
	walkable = false,
})

minetest.register_node("moreplants:clover", {
	description = "Clover",
	drawtype = "firelike",
	tiles = {
		"moreplants_clover.png",
		"moreplants_trans.png",
		"moreplants_clover.png",
		"moreplants_clover.png",
		"moreplants_clover.png",
		"moreplants_clover.png"
	},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	is_ground_content=true,
	buildable_to = true, 
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "moreplants_clover.png",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.1, 0.5}
	},
})

minetest.register_node("moreplants:groundfung", {
	description = "Ground fungus",
	drawtype = "firelike",
	tiles = {
		"moreplants_groundfung.png",
		"moreplants_trans.png",
		"moreplants_groundfung.png",
		"moreplants_groundfung.png",
		"moreplants_groundfung.png",
		"moreplants_groundfung.png"
	},
	groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
	is_ground_content=true,
	buildable_to = true, 
	walkable = false,
	inventory_image = "moreplants_groundfung.png",
	paramtype = "light",
	sunlight_propagates=true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.1, 0.5}
	},
})

--trees

minetest.register_node("moreplants:palm", {
	description = "Palm tree",
	tiles = {"moreplants_palmtree_top.png", "moreplants_palmtree_top.png", "moreplants_palmtree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	drop = "default:tree",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.375, 0.3125, 0.5, 0.375}, -- NodeBox1
			{-0.375, -0.5, -0.3125, 0.375, 0.5, 0.3125}, -- NodeBox2
		}
	},
	on_place = minetest.rotate_node
})

minetest.register_node("moreplants:palmleaves2", {
	description = "palm leaves (2)",
	drawtype = "plantlike",
	visual_scale = 2.5,
	tiles = {"moreplants_palmleaves2.png"},
	inventory_image = "moreplants_palmleaves2.png",
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = false,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, -0.2, 0.3}
	},
	groups = {cracky=3,dig_immediate=3},
})

minetest.register_node("moreplants:palmleaves1", {
	description = "palm leaves (1)",
	drawtype = "signlike",
	visual_scale = 4.0,
	tiles = {"moreplants_palmleaves.png"},
	inventory_image = "moreplants_palmleaves.png",
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = false,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "wallmounted",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	groups = {cracky=3,dig_immediate=3},
})

--craftitems
minetest.register_craftitem("moreplants:curlyfruit", {
	description = "Curly Fruit",
	inventory_image = "moreplants_curlyfruit.png",
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("moreplants:eye", {
	description = "Eyeball",
	inventory_image = "moreplants_eye.png"
})

--craft recipes
minetest.register_craft({
	output = "default:cactus 1",
	recipe = {
		{"moreplants:cactus", "moreplants:cactus", "moreplants:cactus"},
		{"moreplants:cactus", "moreplants:cactus", "moreplants:cactus"},
		{"moreplants:cactus", "moreplants:cactus",  "moreplants:cactus"}
	}
})

minetest.register_craft({
	output = "default:paper 1",
	recipe = {
		{"moreplants:weed", "moreplants:weed", "moreplants:weed"},
	}
})

--decorations

moreplants = {}

function moreplants.mapgen()
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 26,
	fill_ratio = 0.005,
	biomes = {"desert"},
	decoration = "moreplants:fireflower",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {"stone_grassland", "sandstone_grassland"},
	decoration = "moreplants:tallgrass",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.001,
	biomes = {"stone_grassland", "sandstone_grassland"},
	decoration = "moreplants:blueflower",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.02,
	biomes = {"rainforest"},
	decoration = "moreplants:jungleflower",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {"rainforest"},
	decoration = "moreplants:umbrella",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {"rainforest", "coniferous_forest"},
	decoration = "moreplants:bigfern",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {"rainforest"},
	decoration = "moreplants:bigflower",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {"rainforest"},
	decoration = "moreplants:medflower",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:sand",
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {"stone_grassland_ocean", "deciduous_forest_ocean"},
	decoration = "moreplants:bulrush",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:water_source",
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"stone_grassland_ocean", "deciduous_forest_ocean"},
	decoration = "moreplants:aliengrass",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 26,
	fill_ratio = 0.005,
	biomes = {"desert"},
	decoration = "moreplants:eyeweed",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:stone",
	sidelen = 16,
	fill_ratio = 0.001,
	decoration = "moreplants:stoneweed",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 26,
	fill_ratio = 0.005,
	biomes = {"desert"},
	decoration = "moreplants:cactus",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 26,
	fill_ratio = 0.005,
	biomes = {"deciduous_forest"},
	decoration = "moreplants:curly",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 26,
	fill_ratio = 0.005,
	biomes = {"deciduous_forest"},
	decoration = "moreplants:bush",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:snow_block",
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"tundra"},
	decoration = "moreplants:moonflower",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:snowblock", "default:dirt_with_snow",
	sidelen = 26,
	fill_ratio = 0.02,
	biomes = {"taiga"},
	decoration = "moreplants:deadweed",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:snowblock", "default:dirt_with_snow",
	sidelen = 26,
	fill_ratio = 0.02,
	biomes = {"taiga"},
	decoration = "moreplants:taigabush",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:snowblock", "default:dirt_with_snow",
	sidelen = 16,
	fill_ratio = 0.02,
	biomes = {"taiga"},
	decoration = "moreplants:groundfung",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.02,
	biomes = {"coniferous_forest"},
	decoration = "moreplants:spikefern",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 26,
	fill_ratio = 0.02,
	biomes = {"coniferous_forest"},
	decoration = "moreplants:weed",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 26,
	fill_ratio = 0.02,
	biomes = {"coniferous_forest"},
	decoration = "moreplants:fern",
	height = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {"deciduous_forest"},
	decoration = "moreplants:mushroom",
	height = 1,
})
-- minetest.register_decoration({
	-- deco_type = "simple",
	-- place_on = "air",
	-- sidelen = 16,
	-- fill_ratio = 0.01,
	-- biomes = {"deciduous_forest"},
	-- spawn_by = "default:tree",
	-- decoration = "moreplants:glowfung",
	-- height = 1,
-- })
end

if minetest.get_mapgen_params().mgname ~= "v6" or minetest.get_mapgen_params().mgname ~= "singlenode" then
	moreplants.mapgen()
end

--ABM spawning
-- ABM from the Mushroom mod
--by DanDuncombe and VanessaE
-- License of code ; WTFPL

-- Natural Spawning ABM
-- minetest.register_abm({
-- nodenames = {
-- "default:stone",
-- },
-- neighbors = {"air"},
-- interval = 500,
-- chance = 200,
-- action = function(pos, node)
-- local top_pos = {x=pos.x, y=pos.y+1, z=pos.z}
-- if minetest.get_node(top_pos).name == "air" then
-- if minetest.find_node_near(pos, 3, {"default:lava_source"}) then
-- minetest.add_node(top_pos, {name="moreplants:firefung"})
-- elseif minetest.get_node_light(top_pos, nil) < 8 then
-- if minetest.find_node_near(pos, 3, {"default:water_source"}) then
-- minetest.add_node(top_pos, {name="moreplants:bluemush"})
-- else
-- minetest.add_node(top_pos, {name="moreplants:caveflower"})
-- end
-- end
-- end
-- end
-- })
-- Spawn underground plants in newly generated areas

local frequency = 200

minetest.register_on_generated(function(minp, maxp)
	if maxp.y > 0 then
		return
	end
	local stone = minetest.find_nodes_in_area_under_air(minp, maxp,
		{"default:stone", "default:desert_stone"})
	for n = 1, #stone do
		if math.random(1, frequency) == 1 then
			local pos = {x = stone[n].x, y = stone[n].y + 1, z = stone[n].z }
			if minetest.find_node_near(pos, 3, {"group:lava"}) then
				minetest.add_node(pos, {name = "moreplants:firefung"})
			elseif minetest.get_node_light(pos, nil) < 8 then
				if minetest.find_node_near(pos, 3, {"group:water"}) then
					minetest.add_node(pos, {name = "moreplants:bluemush"})
				else
					minetest.add_node(pos, {name = "moreplants:caveflower"})
				end
			end
		end
	end
end)
