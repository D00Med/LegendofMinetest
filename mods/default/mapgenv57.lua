--
-- Register biomes
--

minetest.clear_registered_biomes()

--lavabiomes by D00Med, required lavabiomes mod

minetest.register_biome({
	name = "lavabiome",
	--node_dust = "",
	node_top = "lavabiome:dirt",
	depth_top = 2,
	node_filler = "default:obsidian",
	depth_filler = 0,
	node_stone = "default:obsidian",
	node_water_top = "default:lava_source",
	depth_water_top = 1,
	node_water = "default:lava_source",
	node_river_water = "default:lava_source",
	y_min = 1,
	y_max = 1000,
	heat_point = 85,
	humidity_point = 15,
})


minetest.register_biome({
	name = "coniferous_forest",
	--node_dust = "",
	node_top = "default:dirt_with_grass2",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 9,
	y_max = 21000,
	heat_point = 45,
	humidity_point = 25,
})

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
	y_max = 100,
	heat_point = 45,
	humidity_point = 25,
})

minetest.register_biome({
	name = "coniferous_forest_dunes",
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
	y_min = 5,
	y_max = 8,
	heat_point = 45,
	humidity_point = 25,
})

minetest.register_biome({
	name = "coniferous_forest_ocean",
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
	y_max = 4,
	heat_point = 45,
	humidity_point = 25,
})


-- -- Permanent ice
-- minetest.register_biome({
	-- name = "glacier",
	-- node_dust = "default:snowblock",
	-- node_top = "default:snowblock",
	-- depth_top = 1,
	-- node_filler = "default:snowblock",
	-- depth_filler = 3,
	-- node_stone = "default:stone",
	-- node_water_top = "default:ice",
	-- depth_water_top = 10,
	-- --node_water = "",
	-- node_river_water = "default:ice",
	-- y_min = -8,
	-- y_max = 31000,
	-- heat_point = -5,
	-- humidity_point = 50,
-- })

-- minetest.register_biome({
	-- name = "glacier_ocean",
	-- node_dust = "default:snowblock",
	-- node_top = "default:gravel",
	-- depth_top = 1,
	-- node_filler = "default:gravel",
	-- depth_filler = 2,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = -112,
	-- y_max = -9,
	-- heat_point = -5,
	-- humidity_point = 50,
-- })

-- -- Cold
-- minetest.register_biome({
	-- name = "tundra",
	-- node_dust = "default:snow",
	-- node_top = "default:dirt_with_snow",
	-- depth_top = 1,
	-- node_filler = "default:dirt",
	-- depth_filler = 0,
	-- --node_stone = "",
	-- --node_water_top = "",
	-- --depth_water_top = ,
	-- --node_water = "",
	-- --node_river_water = "",
	-- y_min = 2,
	-- y_max = 31000,
	-- heat_point = 20,
	-- humidity_point = 25,
-- })

-- minetest.register_biome({
	-- name = "tundra_ocean",
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
	-- y_max = 1,
	-- heat_point = 20,
	-- humidity_point = 25,
-- })

minetest.register_biome({
	name = "taiga",
	--node_dust = "default:snow",
	node_top = "default:snowblock",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 2,
	y_max = 31000,
	heat_point = 20,
	humidity_point = 25,
})

minetest.register_biome({
	name = "taiga_ocean",
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
	y_max = 1,
	heat_point = 20,
	humidity_point = 25,
})

-- Temperate
minetest.register_biome({
	name = "stone_grassland",
	--node_dust = "",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 0,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 5,
	y_max = 31000,
	heat_point = 45,
	humidity_point = 25,
})

minetest.register_biome({
	name = "stone_grassland_ocean",
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
	y_max = 4,
	heat_point = 45,
	humidity_point = 25,
})

minetest.register_biome({
	name = "sandstone_grassland",
	--node_dust = "",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 0,
	node_stone = "default:sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 5,
	y_max = 31000,
	heat_point = 70,
	humidity_point = 35,
})

minetest.register_biome({
	name = "sandstone_grassland_ocean",
	--node_dust = "",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	node_stone = "default:sandstone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -112,
	y_max = 4,
	heat_point = 70,
	humidity_point = 35,
})

minetest.register_biome({
	name = "magic_forest",
	--node_dust = "",
	node_top = "default:dirt_with_dry_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 1,
	y_max = 31000,
	heat_point = 80,
	humidity_point = 25,
})

minetest.register_biome({
	name = "wild_forest",
	--node_dust = "",
	node_top = "default:dirt_with_grass3",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 1,
	y_max = 21000,
	heat_point = 20,
	humidity_point = 75,
})

minetest.register_biome({
	name = "deciduous_forest",
	--node_dust = "",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 1,
	y_max = 31000,
	heat_point = 20,
	humidity_point = 70,
})

minetest.register_biome({
	name = "deciduous_forest_swamp",
	--node_dust = "",
	node_top = "default:dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -3,
	y_max = 0,
	heat_point = 25,
	humidity_point = 80,
})

minetest.register_biome({
	name = "deciduous_forest_ocean",
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
	heat_point = 20,
	humidity_point = 75,
})

-- Hot
minetest.register_biome({
	name = "desert",
	--node_dust = "",
	node_top = "default:desert_sand",
	depth_top = 1,
	node_filler = "default:desert_sand",
	depth_filler = 1,
	node_stone = "default:desert_stone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 5,
	y_max = 31000,
	heat_point = 95,
	humidity_point = 10,
})

minetest.register_biome({
	name = "desert_ocean",
	--node_dust = "",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	node_stone = "default:desert_stone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -112,
	y_max = 4,
	heat_point = 95,
	humidity_point = 10,
})

minetest.register_biome({
	name = "savanna",
	--node_dust = "",
	node_top = "default:dirt_with_dry_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 1,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 1,
	y_max = 31000,
	heat_point = 95,
	humidity_point = 50,
})

minetest.register_biome({
	name = "savanna_swamp",
	--node_dust = "",
	node_top = "default:dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -3,
	y_max = 0,
	heat_point = 95,
	humidity_point = 50,
})

minetest.register_biome({
	name = "savanna_ocean",
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
	heat_point = 95,
	humidity_point = 50,
})

minetest.register_biome({
	name = "rainforest",
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
	y_min = 1,
	y_max = 31000,
	heat_point = 95,
	humidity_point = 90,
})
	
minetest.register_biome({
	name = "rainforest_swamp",
	--node_dust = "",
	node_top = "default:dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -3,
	y_max = 0,
	heat_point = 95,
	humidity_point = 90,
})


minetest.register_biome({
	name = "rainforest_ocean",
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
	heat_point = 95,
	humidity_point = 90,
})

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


--
-- Register decorations
--


local function register_grass_decoration(offset, scale, length, dry)
	local name = "default:grass_"
	local biome = {"stone_grassland", "sandstone_grassland",
			"deciduous_forest", "coniferous_forest_dunes", "magic_forest", "lost_woods"}
	if dry then
		name = "default:dry_grass_"
		biome = {"savanna", "magic_forest"}
	end
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass", "default:dirt_with_grass2", "default:sand"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = biome,
		y_min = 1,
		y_max = 31000,
		decoration = name .. length,
	})
end



minetest.clear_registered_decorations()

-- Apple tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.04,
		scale = 0.01,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"deciduous_forest"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("default").."/schematics/apple_tree.mts",
	flags = "place_center_x, place_center_z",
})

--aspen tree

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.02,
		scale = 0.001,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"deciduous_forest"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("default").."/schematics/aspen_tree.mts",
	flags = "place_center_x, place_center_z",
})

-- Big tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "dirt_with_grass2"},
	sidelen = 16,
	noise_params = {
		offset = 0.03,
		scale = 0.005,
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

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.004,
		scale = 0.01,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"deciduous_forest"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("default").."/schematics/big.mts",
	flags = "place_center_x, place_center_z",
})


-- Magic tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.04,
		scale = 0.02,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.06
	},
	biomes = {"magic_forest"},
	y_min = -14,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/magictree.mts",
	flags = "place_center_x, place_center_z",
})

--rocks(req. rocks mod)
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt", "default:sand", "default:desert_sand"},
	sidelen = 16,
	noise_params = {
			offset = 0.004,
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
			offset = 0.004,
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

-- Jungle tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:dirt"},
	sidelen = 80,
	fill_ratio = 0.09,
	biomes = {"rainforest", "rainforest_swamp"},
	y_min = 0,
	y_max = 31000,
	schematic = minetest.get_modpath("default").."/schematics/jungle_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

-- Taiga and temperate forest pine tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:snowblock", "default:dirt_with_grass", "default:dirt_with_grass2"},
	sidelen = 16,
	noise_params = {
		offset = 0.04,
		scale = 0.02,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"taiga", "coniferous_forest"},
	y_min = 2,
	y_max = 31000,
	schematic = minetest.get_modpath("default").."/schematics/pine_tree.mts",
	flags = "place_center_x, place_center_z",
})

--small pine trees
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:snowblock", "default:dirt_with_grass", "default:dirt_with_grass2"},
	sidelen = 16,
	noise_params = {
		offset = 0.04,
		scale = 0.005,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.56
	},
	biomes = {"taiga", "coniferous_forest"},
	y_min = 2,
	y_max = 31000,
	schematic = minetest.get_modpath("default").."/schematics/bconifer.mts",
	flags = "place_center_x, place_center_z",
})

-- Acacia tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_dry_grass"},
	sidelen = 80,
	noise_params = {
		offset = 0,
		scale = 0.003,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"savanna"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("default").."/schematics/acacia_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

--grassland tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 80,
	noise_params = {
		offset = 0,
		scale = 0.003,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"sandstone_grassland", "stone_grassland"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("default").."/schematics/smalltree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

-- Large cactus
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:desert_sand"},
	sidelen = 80,
	noise_params = {
		offset = -0.0005,
		scale = 0.0015,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_min = 5,
	y_max = 31000,
	schematic = minetest.get_modpath("default").."/schematics/large_cactus.mts",
	flags = "place_center_x",
	rotation = "random",
})

-- palm tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:sand"},
	sidelen = 16,
	noise_params = {
		offset = 0.004,
		scale = 0.002,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"sandstone_grassland_ocean", "stone_grassland_ocean", "deciduous_forest_ocean"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/palmtree.mts",
	flags = "place_center_x, place_center_z",
})

-- goron hut
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"lavabiome:dirt"},
	sidelen = 16,
	noise_params = {
			offset = 0.004,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
	biomes = {"lavabiome"},
	y_min = 1,
	y_max = 1000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/goronhut.mts",
	flags = "place_center_x, place_center_z",
})

-- volcano
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"lavabiome:dirt"},
	sidelen = 16,
	noise_params = {
		offset = 0.004,
		scale = 0.002,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"lavabiome"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/volcano.mts",
	flags = "place_center_x, place_center_z",
})



-- wild tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass3"},
	sidelen = 16,
	noise_params = {
		offset = 0.04,
		scale = 0.02,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"wild_forest"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/wildtree.mts",
	flags = "place_center_x, place_center_z",
})

-- Cactus
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand"},
	sidelen = 80,
	noise_params = {
		offset = -0.0005,
		scale = 0.0015,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_min = 5,
	y_max = 31000,
	decoration = "default:cactus",
	height = 2,
	height_max = 5,
})

-- statue
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:dirt_with_dry_grass", "default:dirt_with_grass2", "default:dirt_with_grass", "default:snowblock", "default:dirt_with_grass3"},
	sidelen = 200,
	noise_params = {
		offset = -0.0005,
		scale = 0.0015,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	y_min = 5,
	y_max = 31000,
	decoration = "hyrule_mapgen:statue",
})

-- Papyrus
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt"},
	sidelen = 16,
	noise_params = {
		offset = -0.3,
		scale = 0.7,
		spread = {x = 200, y = 200, z = 200},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"savanna_swamp"},
	y_min = 0,
	y_max = 0,
	schematic = minetest.get_modpath("default").."/schematics/papyrus.mts",
})

-- Grasses
register_grass_decoration(-0.03,  0.09,  5)
register_grass_decoration(-0.015, 0.075, 4)
register_grass_decoration(0,      0.06,  3)
register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

-- Dry grasses
register_grass_decoration(0.01, 0.05,  5, true)
register_grass_decoration(0.03, 0.03,  4, true)
register_grass_decoration(0.05, 0.01,  3, true)
register_grass_decoration(0.07, -0.01, 2, true)
register_grass_decoration(0.09, -0.03, 1, true)

-- Junglegrass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 80,
	fill_ratio = 0.1,
	biomes = {"rainforest"},
	y_min = 1,
	y_max = 31000,
	decoration = "default:junglegrass",
})

-- Dry shrub
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_min = 2,
	y_max = 31000,
	decoration = "default:dry_shrub",
})


--mushroom
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_dry_grass", "default:dirt", "default:stone"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"magic_forest", "underground"},
	y_min = 2,
	y_max = 31000,
	decoration = "moreplants:mushroom",
	spawn_by = "air",
})

--mushroom
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass3"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"wild_forest"},
	y_min = 2,
	y_max = 31000,
	decoration = "doomshrooms:mini",
	spawn_by = "air",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass2"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"coniferous_forest"},
	y_min = 2,
	y_max = 31000,
	decoration = "doomshrooms:tall2",
	spawn_by = "air",
})

--fireflower
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"lavabiome:dirt"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"lavabiome"},
	y_min = 2,
	y_max = 31000,
	decoration = "moreplants:fireflower",
})



--long grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass2", "default:dirt_with_grass", "default:dirt"},
	sidelen = 80,
	fill_ratio = 0.1,
	biomes = {"sandstone_grassland", "stone_grassland"},
	y_min = 2,
	y_max = 31000,
	decoration = "moreplants:tallgrass",
})

--stoneplant
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:stone", "default:snowblock"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"underground", "taiga"},
	y_min = 2,
	y_max = 31000,
	decoration = "moreplants:stoneweed",
	spawn_by = "air",
})


minetest.register_on_generated(default.generate_nyancats)
