minetest.clear_registered_biomes()
local path = minetest.get_modpath("hyrule_mapgen")

-- nodes

dofile(path.."/nodes.lua")



--lavabiomes

-- minetest.register_biome({
	-- name = "lavabiome",
	-- --node_dust = "",
	-- node_top = "lavabiome:dirt",
	-- depth_top = 2,
	-- node_filler = "default:obsidian",
	-- depth_filler = 0,
	-- node_stone = "default:obsidian",
	-- node_water_top = "default:lava_source",
	-- depth_water_top = 1,
	-- node_water = "default:lava_source",
	-- node_river_water = "default:lava_source",
	-- y_min = 1,
	-- y_max = 1000,
	-- heat_point = 85,
	-- humidity_point = 15,
-- })

minetest.register_biome({
	name = "lost_woods",
	--node_dust = "",
	node_top = "default:dirt_with_grass2",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	node_river_water = "default:water_source",
	y_min = 9,
	y_max = 1000,
	heat_point = 45,
	humidity_point = 75,
})

-- minetest.register_biome({
	-- name = "deciduous_forest",
	-- --node_dust = "",
	-- node_top = "default:dirt_with_grass",
	-- depth_top = 1,
	-- node_filler = "default:dirt",
	-- depth_filler = 2,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = 1,
	-- y_max = 31000,
	-- heat_point = 70,
	-- humidity_point = 75,
-- })

-- minetest.register_biome({
	-- name = "deciduous_forest_swamp",
	-- --node_dust = "",
	-- node_top = "default:dirt",
	-- depth_top = 1,
	-- node_filler = "default:dirt",
	-- depth_filler = 2,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = -3,
	-- y_max = 0,
	-- heat_point = 70,
	-- humidity_point = 75,
-- })

-- minetest.register_biome({
	-- name = "deciduous_forest_ocean",
	-- --node_dust = "",
	-- node_top = "default:sand",
	-- depth_top = 1,
	-- node_filler = "default:sand",
	-- depth_filler = 2,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = -112,
	-- y_max = -4,
	-- heat_point = 70,
	-- humidity_point = 75,
-- })

minetest.register_biome({
	name = "mushroom_forest_ocean",
	--node_dust = "",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -112,
	y_max = -4,
	heat_point = 70,
	humidity_point = 75,
})

minetest.register_biome({
	name = "mushroom_forest",
	--node_dust = "",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -4,
	y_max = 1000,
	heat_point = 70,
	humidity_point = 75,
})

-- -- Hot
-- minetest.register_biome({
	-- name = "desert",
	-- --node_dust = "",
	-- node_top = "default:desert_sand",
	-- depth_top = 1,
	-- node_filler = "default:desert_sand",
	-- depth_filler = 1,
	-- node_stone = "default:desert_stone",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = 5,
	-- y_max = 31000,
	-- heat_point = 95,
	-- humidity_point = 10,
-- })

-- minetest.register_biome({
	-- name = "desert_ocean",
	-- --node_dust = "",
	-- node_top = "default:sand",
	-- depth_top = 1,
	-- node_filler = "default:sand",
	-- depth_filler = 2,
	-- node_stone = "default:desert_stone",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = -112,
	-- y_max = 4,
	-- heat_point = 95,
	-- humidity_point = 10,
-- })

-- minetest.register_biome({
	-- name = "savanna",
	-- --node_dust = "",
	-- node_top = "default:dirt_with_dry_grass",
	-- depth_top = 1,
	-- node_filler = "default:dirt",
	-- depth_filler = 1,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = 1,
	-- y_max = 31000,
	-- heat_point = 95,
	-- humidity_point = 50,
-- })

-- minetest.register_biome({
	-- name = "savanna_swamp",
	-- --node_dust = "",
	-- node_top = "default:dirt",
	-- depth_top = 1,
	-- node_filler = "default:dirt",
	-- depth_filler = 2,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = -3,
	-- y_max = 0,
	-- heat_point = 95,
	-- humidity_point = 50,
-- })

-- minetest.register_biome({
	-- name = "savanna_ocean",
	-- --node_dust = "",
	-- node_top = "default:sand",
	-- depth_top = 1,
	-- node_filler = "default:sand",
	-- depth_filler = 2,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = -112,
	-- y_max = -4,
	-- heat_point = 95,
	-- humidity_point = 50,
-- })

-- minetest.register_biome({
	-- name = "rainforest",
	-- --node_dust = "",
	-- node_top = "default:dirt_with_grass",
	-- depth_top = 1,
	-- node_filler = "default:dirt",
	-- depth_filler = 2,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = 1,
	-- y_max = 31000,
	-- heat_point = 95,
	-- humidity_point = 90,
-- })
	
-- minetest.register_biome({
	-- name = "rainforest_swamp",
	-- --node_dust = "",
	-- node_top = "default:dirt",
	-- depth_top = 1,
	-- node_filler = "default:dirt",
	-- depth_filler = 2,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = -3,
	-- y_max = 0,
	-- heat_point = 95,
	-- humidity_point = 90,
-- })

-- minetest.register_biome({
	-- name = "rainforest_ocean",
	-- --node_dust = "",
	-- node_top = "default:sand",
	-- depth_top = 1,
	-- node_filler = "default:sand",
	-- depth_filler = 2,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = -112,
	-- y_max = -4,
	-- heat_point = 95,
	-- humidity_point = 90,
-- })

-- Underground
minetest.register_biome({
	name = "underground",
	--node_dust = "",
	--node_top = "",
	--depth_top = ,
	--node_filler = "",
	--depth_filler = ,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -31000,
	y_max = -113,
	heat_point = 50,
	humidity_point = 50,
})


--decorations

--rocks(req. rocks mod)
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt", "default:sand", "default:desert_sand"},
	sidelen = 16,
	noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
	biomes = {"stone_grassland", "sandstone_grassland", "deciduous_forest", "desert"},
	decoration = "rocks:rock",
	y_min = 15,
	y_max = 40,
})

--geysers(lavabiome)
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"lavabiome:dirt"},
	sidelen = 80,
	noise_params = {
			offset = 0,
			scale = 0.016,
			spread = {x = 50, y = 50, z = 50},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
	biomes = {"lavabiome"},
	decoration = "lavabiome:geyser",
	y_min = 0,
	y_max = 50,
})

-- Big tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass2"},
	sidelen = 16,
	noise_params = {
		offset = 0.06,
		scale = 0.02,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"lost_woods"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/big_tree.mts",
	flags = "place_center_x, place_center_z",
})

--canopy
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass2"},
	sidelen = 16,
	noise_params = {
		offset = 0.06,
		scale = 0.02,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"lost_woods"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/canopy.mts",
	flags = "place_center_x, place_center_z",
})

--mushrooms
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:sand", "default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.06,
		scale = 0.02,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"mushroom_forest_ocean", "mushroom_forest"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/shroom.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:sand", "default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.06,
		scale = 0.02,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"mushroom_forest_ocean", "mushroom_forest"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/bigshroom.mts",
	flags = "place_center_x, place_center_z",
})