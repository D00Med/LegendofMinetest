
minetest.clear_registered_biomes()

-- Icesheet

	minetest.register_biome({
		name = "icesheet",
		--node_dust = "default:snowblock",
		node_top = "default:snowblock",
		depth_top = 2,
		node_filler = "default:ice",
		depth_filler = 6,
		node_stone = "default:stone",
		node_water_top = "default:ice",
		depth_water_top = 10,
		--node_water = "",
		node_river_water = "default:ice",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		y_min = -8,
		y_max = 31000,
		heat_point = 0,
		humidity_point = 73,
	})

	minetest.register_biome({
		name = "icesheet_ocean",
		node_dust = "default:snowblock",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		node_water_top = "default:ice",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		y_min = -112,
		y_max = -9,
		heat_point = 0,
		humidity_point = 73,
	})

minetest.register_biome({
	name = "lavabiome",
	--node_dust = "",
	node_top = "hyrule_mapgen:lavabiome_dirt",
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
	depth_filler = 5,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 9,
	y_max = 21000,
	heat_point = 46,
	humidity_point = 26,
})

minetest.register_biome({
	name = "lost_woods",
	--node_dust = "",
	node_top = "default:dirt_with_grass2",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	node_river_water = "default:water_source",
	y_min = 9,
	y_max = 100,
	heat_point = 35,
	humidity_point = 15,
})

minetest.register_biome({
	name = "coniferous_forest_dunes",
	--node_dust = "",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 5,
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
	depth_filler = 5,
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
	depth_filler = 3,
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
	depth_filler = 5,
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
	depth_filler = 5,
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
	depth_filler = 5,
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
	depth_filler = 6,
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
	name = "swamp",
	--node_dust = "",
	node_top = "hyrule_mapgen:swamp_mud",
	depth_top = 2,
	node_filler = "default:dirt",
	depth_filler = 3,
	--node_stone = "",
	node_water_top = "default:river_water_source",
	depth_water_top = 1,
	--node_water = "",
	--node_river_water = "",
	y_min = 1,
	y_max = 31000,
	heat_point = 24,
	humidity_point = 77,
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
	depth_filler = 2,
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
	depth_filler = 5,
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
	depth_filler = 5,
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

--swamp grass

minetest.register_decoration({
		deco_type = "simple",
		place_on = {"hyrule_mapgen:swamp_mud",},
		sidelen = 16,
		noise_params = {
			offset = 0.02,
			scale = 0.02,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"swamp"},
		y_min = 1,
		y_max = 31000,
		decoration = "hyrule_mapgen:swamp_grass",
	})
	
minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:river_water_source",},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.002,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"swamp", "rainforest_swamp"},
		y_min = 1,
		y_max = 31000,
		decoration = "hyrule_mapgen:biglily",
	})

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
	place_on = {"default:dirt_with_grass", "default:dirt_with_grass2"},
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

--swamp trees
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"hyrule_mapgen:swamp_mud",},
	sidelen = 16,
	noise_params = {
		offset = 0.002,
		scale = 0.001,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"swamp"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/swamp_tree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"hyrule_mapgen:swamp_mud",},
	sidelen = 16,
	noise_params = {
		offset = 0.002,
		scale = 0.001,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"swamp"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/palmtree2.mts",
	flags = "place_center_x, place_center_z",
})


minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"hyrule_mapgen:swamp_mud",},
	sidelen = 16,
	noise_params = {
		offset = 0.002,
		scale = 0.001,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"swamp"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/palmtree3.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"hyrule_mapgen:swamp_mud",},
	sidelen = 16,
	noise_params = {
		offset = 0.002,
		scale = 0.001,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"swamp"},
	y_min = 1,
	y_max = 11000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/smallpool.mts",
	flags = "place_center_x, place_center_z, place_center_y",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"hyrule_mapgen:swamp_mud",},
	sidelen = 16,
	noise_params = {
		offset = 0.002,
		scale = 0.001,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"swamp"},
	y_min = 1,
	y_max = 11000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/bigpool.mts",
	flags = "place_center_x, place_center_y, place_center_z",
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
	decoration = "hyrule_mapgen:rock",
	y_min = 15,
	y_max = 40,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt_with_grass3", "default:dirt_with_dry_grass"},
	sidelen = 32,
	noise_params = {
			offset = 0.002,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
	biomes = {"deciduous_forest", "magic_forest", "wild_forest",},
	decoration = "hyrule_mapgen:deku_flower",
	y_min = 15,
	y_max = 40,
})

--geysers(lavabiome)
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"hyrule_mapgen:lavabiome_dirt"},
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
	decoration = "hyrule_mapgen:geyser",
	y_min = 0,
	y_max = 50,
})

-- Jungle tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:dirt"},
	sidelen = 80,
	fill_ratio = 0.09,
	biomes = {"rainforest"},
	y_min = 0,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/jungletree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:dirt"},
	sidelen = 80,
	fill_ratio = 0.09,
	biomes = {"rainforest_swamp"},
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
	place_on = {"default:sand", "hyrule_mapgen:swamp_mud"},
	sidelen = 16,
	noise_params = {
		offset = 0.004,
		scale = 0.002,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"sandstone_grassland_ocean", "stone_grassland_ocean", "deciduous_forest_ocean", "swamp"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/palmtree.mts",
	flags = "place_center_x, place_center_z",
})

-- goron hut
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"hyrule_mapgen:lavabiome_dirt"},
	sidelen = 36,
	noise_params = {
			offset = 0.002,
			scale = 0.003,
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

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:snowblock"},
	sidelen = 46,
	noise_params = {
			offset = 0,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
	biomes = {"icesheet"},
	y_min = 1,
	y_max = 1000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/igloo.mts",
	flags = "place_center_x, place_center_z",
})

-- volcano
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"hyrule_mapgen:lavabiome_dirt"},
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

-- Coral reef

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:sand"},
		noise_params = {
			offset = -0.1,
			scale = 0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 7013,
			octaves = 3,
			persist = 1,
		},
		biomes = {
			"desert_ocean",
			"savanna_ocean",
			"rainforest_ocean",
		},
		y_min = -8,
		y_max = -2,
		schematic = minetest.get_modpath("default") .. "/schematics/corals.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

--shrub
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass2"},
	sidelen = 26,
	noise_params = {
		offset = 0.001,
		scale = 0.002,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"coniferous_forest"},
	y_min = 1,
	y_max = 31000,
	schematic = minetest.get_modpath("hyrule_mapgen").."/schematics/shrub.mts",
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


--bomb flower

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"hyrule_mapgen:swamp_mud",},
	sidelen = 36,
	noise_params = {
		offset = 0.001,
		scale = 0.005,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"swamp"},
	y_min = 5,
	y_max = 31000,
	decoration = "hyruletools:bomb_flower",
	height = 1,
	height_max = 1,
})

--icicle

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:snowblock", "default:ice"},
	sidelen = 16,
	noise_params = {
		offset = 0.006,
		scale = 0.04,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"icesheet"},
	y_min = 5,
	y_max = 31000,
	decoration = "hyrule_mapgen:icicle",
	height = 1,
	height_max = 1,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"hyrule_mapgen:lavabiome_dirt",},
	sidelen = 16,
	noise_params = {
		offset = 0.006,
		scale = 0.04,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"lavabiome"},
	y_min = 5,
	y_max = 31000,
	decoration = "hyrule_mapgen:obsidian_spike",
	height = 1,
	height_max = 1,
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

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "hyrule_mapgen:glowstone",
	wherein        = "default:stone",
	clust_scarcity = 18 * 18 * 18,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = -3113,
	y_max          = -66,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "hyrule_mapgen:dungeon_seed",
	wherein        = "default:stone",
	clust_scarcity = 22 * 22 * 22,
	clust_num_ores = 1,
	clust_size     = 2,
	y_min          = -9113,
	y_max          = -66,
})

--rupees

minetest.register_node("hyrule_mapgen:stone_with_redrupee", {
	description = "Buried red rupee",
	tiles = {"default_stone.png^hyruletools_redrupee.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'hyruletools:red_rupee',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("hyrule_mapgen:stone_with_bluerupee", {
	description = "Buried blue rupee",
	tiles = {"default_stone.png^hyruletools_bluerupee.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'hyruletools:blue_rupee',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("hyrule_mapgen:stone_with_greenrupee", {
	description = "Buried green rupee",
	tiles = {"default_stone.png^hyruletools_greenrupee.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'hyruletools:green_rupee',
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "hyrule_mapgen:stone_with_redrupee",
	wherein        = "default:stone",
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -115,
	y_max          = 30,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "hyrule_mapgen:stone_with_redrupee",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -163,
	y_max          = -46,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "hyrule_mapgen:stone_with_greenrupee",
	wherein        = "default:stone",
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -15,
	y_max          = 2,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "hyrule_mapgen:stone_with_greenrupee",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -63,
	y_max          = -16,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "hyrule_mapgen:stone_with_bluerupee",
	wherein        = "default:stone",
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -150,
	y_max          = 20,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "hyrule_mapgen:stone_with_bluerupee",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -630,
	y_max          = -26,
})


moreplants.mapgen()
farming.register_mgv7_decorations()

local frequency = 5

minetest.register_on_generated(function(minp, maxp)
	if maxp.y < -5 or maxp.y > 50 then
		return
	end
	local dirt = minetest.find_nodes_in_area(minp, maxp,
		{"default:dirt", "default:dirt_with_grass", "default:dirt_with_grass2", "default:dirt_with_grass3"})
	for n = 1, #dirt do
		if math.random(1, frequency) == 1 then
			local pos = {x = dirt[n].x, y = dirt[n].y, z = dirt[n].z }
				if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "air" then
					if math.random(1,2) == 1 then
					minetest.add_node({x=pos.x, y=pos.y-1, z=pos.z}, {name = "hyrule_mapgen:roots"})
					else
					minetest.add_node({x=pos.x, y=pos.y-1, z=pos.z}, {name = "hyrule_mapgen:roots2"})
					end
				end
		end
	end
end)

minetest.register_on_generated(function(minp, maxp)
	if maxp.y < -50 or maxp.y > 10 then
		return
	end
	local dirt = minetest.find_nodes_in_area(minp, maxp,
		{"default:stone"})
	for n = 1, #dirt do
		if math.random(1, 50) == 1 then
			local pos = {x = dirt[n].x, y = dirt[n].y, z = dirt[n].z }
				if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "air" then
					if math.random(1,2) == 1 then
					minetest.add_node({x=pos.x, y=pos.y-1, z=pos.z}, {name = "hyrule_mapgen:stalagtite"})
					elseif math.random(1,2) == 1 then
					minetest.add_node({x=pos.x, y=pos.y-1, z=pos.z}, {name = "hyrule_mapgen:stalagtite1"})
					elseif math.random(1,2) == 1 then
					minetest.add_node({x=pos.x, y=pos.y-1, z=pos.z}, {name = "hyrule_mapgen:stalagtite2"})
					else
					minetest.add_node({x=pos.x, y=pos.y-1, z=pos.z}, {name = "hyrule_mapgen:stalagtite3"})
					end
				end
		end
	end
end)

minetest.register_on_generated(function(minp, maxp)
	if maxp.y < -150 or maxp.y > 20 then
		return
	end
	local dirt = minetest.find_nodes_in_area(minp, maxp,
		{"default:stone"})
	for n = 1, #dirt do
		if math.random(1, 50) == 1 then
			local pos = {x = dirt[n].x, y = dirt[n].y, z = dirt[n].z }
				if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" and pos.y >= -100 then
					if math.random(1,2) == 1 then
					minetest.add_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "hyrule_mapgen:stalagmite0"})
					elseif math.random(1,2) == 1 then
					minetest.add_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "hyrule_mapgen:stalagmite1"})
					else
					minetest.add_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "hyrule_mapgen:stalagmite2"})
					end
				elseif minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
					if math.random(1,2) == 1 then
					minetest.add_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "hyrule_mapgen:crystal_1"})
					elseif math.random(1,2) == 1 then
					minetest.add_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "hyrule_mapgen:crystal_2"})
					else
					minetest.add_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "hyrule_mapgen:crystal_3"})
					end
				end
		end
	end
end)

--place a village on singleplayer spawn on day 1


minetest.register_on_newplayer(function(player)
	if not village_spawned and minetest.get_day_count() == 0 then
		local name = player:get_player_name()
		if name == "singleplayer" then
		minetest.after(1, function()
		local pos = player:getpos()
		minetest.place_schematic({x=pos.x-6, y=pos.y-1, z=pos.z-4}, minetest.get_modpath("hyrule_mapgen").."/schematics/cave.mts", 0, {}, true)
		local obj = minetest.env:add_entity({x=pos.x-2, y=pos.y+1, z=pos.z}, "mobs_npc:npc_custom")
		local npc = obj:get_luaentity()
		npc.xdir = 1
		npc.item = "default:sword_wood"
		npc.text = "It's dangerous to go alone, take this!"
		end)
		end
	end
end)

--villages

local village_rarity = 100000

minetest.register_on_generated(function(minp, maxp)
	if maxp.y < -1 or maxp.y > 21000 then
		return
	end
	local grass = minetest.find_nodes_in_area(minp, maxp,
		{"default:dirt_with_grass2"})
	for n = 1, #grass do
		if math.random(1, village_rarity) == 1 then
			local pos = {x = grass[n].x, y = grass[n].y, z = grass[n].z }
				if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
				minetest.place_schematic(pos, minetest.get_modpath("hyrule_mapgen").."/schematics/pine_village.mts", random, {}, true)
				local obj = minetest.env:add_entity({x=pos.x+4, y=pos.y+7, z=pos.z+5}, "mobs_npc:shopkeeper")
				local obj = minetest.env:add_entity({x=pos.x+6, y=pos.y+3, z=pos.z+18}, "mobs_npc:npc_custom")
				local npc = obj:get_luaentity()
				npc.text = "I'll give you something nice if you find me a 'red potion'"
				npc.reward_text = "*slurp* Here you go"
				npc.item = "bucket:bucket_empty"
				npc.reward_item = "witchcraft:potion_red"
				npc.zdir = -1
				end
		end
	end
end)

minetest.register_on_generated(function(minp, maxp)
	if maxp.y < -1 or maxp.y > 11000 then
		return
	end
	local grass = minetest.find_nodes_in_area(minp, maxp,
		{"default:snowblock"})
	for n = 1, #grass do
		if math.random(1, village_rarity) == 1 then
			local pos = {x = grass[n].x, y = grass[n].y, z = grass[n].z }
				if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
				minetest.place_schematic(pos, minetest.get_modpath("hyrule_mapgen").."/schematics/icecastle.mts", random, {}, true)
				end
		end
	end
end)

--dungeons
--below ground

local dungeon_rarity = 500

minetest.register_on_generated(function(minp, maxp)
	if maxp.y > -60 or maxp.y < -30000 then
		return
	end
	local stone = minetest.find_nodes_in_area(minp, maxp,
		{"hyrule_mapgen:dungeon_seed"})
	for n = 1, #stone do
		if math.random(1, dungeon_rarity) == 1 then
			local pos = {x = stone[n].x, y = stone[n].y, z = stone[n].z }
			if pos.y <= -500 then
			local number = math.random(1,2)
				minetest.place_schematic(pos, minetest.get_modpath("hyrule_mapgen").."/schematics/dungeon_retro"..number..".mts", random, {}, true)
				minetest.add_node({x=pos.x+math.random(1,12), y=pos.y+1, z=pos.z+math.random(1,12)}, {name = "mobs_loz:mimic_chest"})
			else
			local number = math.random(1,2)
				minetest.place_schematic(pos, minetest.get_modpath("hyrule_mapgen").."/schematics/dungeon"..number..".mts", random, {}, true)
				minetest.add_node({x=pos.x+math.random(1,12), y=pos.y+1, z=pos.z+math.random(1,12)}, {name = "mobs_loz:mimic_chest"})
			end
		end
	end
end)