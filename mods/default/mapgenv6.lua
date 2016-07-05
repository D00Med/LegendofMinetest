--
-- Register decorations
--

-- y?
minetest.clear_registered_decorations()

-- Papyrus
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 8,
	noise_params = {
		offset = -0.3,
		scale = 0.7,
		spread = {x = 100, y = 100, z = 100},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	y_min = 1,
	y_max = 1,
	decoration = "default:papyrus",
	height = 2,
	height_max = 4,
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

-- Cacti
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.012,
		scale = 0.024,
		spread = {x = 100, y = 100, z = 100},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	y_min = 1,
	y_max = 30,
	decoration = "default:cactus",
	height = 3,
        height_max = 4,
})

-- Long grasses
for length = 1, 5 do
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.007,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "default:grass_"..length,
	})
end

-- Dry shrubs
	minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.035,
		spread = {x = 100, y = 100, z = 100},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	y_min = 1,
	y_max = 30,
	decoration = "default:dry_shrub",
})

minetest.register_on_generated(default.generate_nyancats)
