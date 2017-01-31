minetest.register_node("doomshrooms:mini",{
	description = "mini mushroom",
	drawtype = "plantlike",
	sunlight_propagates = true,
	tiles = {"doomshrooms_mini.png"},
	inventory_image = "doomshrooms_mini.png",
	wield_image = "doomshrooms_mini.png",
	groups = {oddly_breakable_by_hand=3},
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	drop = "doomshrooms:mini",
})

minetest.register_node("doomshrooms:mini2",{
	description = "mini glowing mushroom",
	drawtype = "plantlike",
	sunlight_propagates = true,
	light_source = 14,
	alpha = 100,	tiles = {"doomshrooms_mini2.png"},
	inventory_image = "doomshrooms_mini2.png",
	wield_image = "doomshrooms_mini2.png",
	groups = {oddly_breakable_by_hand=3},
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	drop = "doomshrooms:mini2",
})

minetest.register_tool("doomshrooms:mushpick", {
	description = "doomshrooms_mushpick",
	inventory_image = "doomshrooms_mushpick.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level = 0,
		groupcaps = {
			cracky = {times={[3]=1.35}, uses=15, maxlevel=1},
		},
		damage_groups = {fleshy = 3},
	},
})

minetest.register_node("doomshrooms:stalk", {
	description = "mushroom stalk",
	tile_images = {"doomshrooms_stalk_base.png","doomshrooms_stalk_base.png","doomshrooms_stalk.png","doomshrooms_stalk.png"},
	groups = {choppy=1},
	})

minetest.register_node("doomshrooms:tall",{
	description = "tall mushroom",
	drawtype = "plantlike",
	sunlight_propagates = true,
	tiles = {"doomshrooms_tall.png"},
	inventory_image = "doomshrooms_tall.png",
	wield_image = "doomshrooms_tall.png",
	groups = {oddly_breakable_by_hand=3},
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	drop = "doomshrooms:tall",
})

minetest.register_node("doomshrooms:stalk2", {
	description = "glowing mushroom stalk",
	tiles = {"doomshrooms_stalk_base2.png","doomshrooms_stalk_base2.png","doomshrooms_stalk2.png","doomshrooms_stalk2.png"},	
	groups = {choppy=1},	
	sunlight_propagates = true,
	light_source = 14,
})

minetest.register_node("doomshrooms:cap", {
	description = "mushroom cap",
	tiles = {"doomshrooms_cap_top.png","doomshrooms_cap_bottom.png","doomshrooms_cap_top.png","doomshrooms_cap_top.png"},
	groups = {choppy=1}, 
})

minetest.register_node("doomshrooms:cap2", {
	description = "glowing mushroom cap",
	tiles = {"doomshrooms_cap_top2.png","doomshrooms_cap_bottom2.png","doomshrooms_cap_top2.png","doomshrooms_cap_top2.png"},	
	groups = {choppy=1},	
	sunlight_propagates = true,
	light_source = 14,
})

minetest.register_node("doomshrooms:tall2",{
	description = "tall mushroom 2",
	drawtype = "plantlike",
	sunlight_propagates = true,
	tiles = {"doomshrooms_tall2.png"},
	inventory_image = "doomshrooms_tall2.png",
	wield_image = "doomshrooms_tall2.png",
	groups = {oddly_breakable_by_hand=3},
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	drop = "doomshrooms:tall2",
})

minetest.register_craft({
	output = "doomshrooms:mushpick",
	recipe = {
		{"doomshrooms:mini", "doomshrooms:mini", "doomshrooms:mini"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})


if minetest.get_mapgen_params().mgname == "v7" then
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass",
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"deciduous_forest"},
	decoration = "doomshrooms:mini",
	height = 1,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass2",
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"coniferous_forest"},
	decoration = "doomshrooms:tall2",
	height = 1,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:dirt_with_grass2",
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"coniferous_forest"},
	decoration = "doomshrooms:tall",
	height = 1,
})
end
