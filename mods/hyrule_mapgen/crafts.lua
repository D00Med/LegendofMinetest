
minetest.register_craft( {
	output = "hyrule_mapgen:logpile 1",
	recipe = {
		{ "", "default:tree", "" },
		{ "default:tree", "", "default:tree" }
	}
})

minetest.register_craft( {
	output = "hyrule_mapgen:big_table 1",
	recipe = {
		{ "default:wood", "default:wood", "default:wood" },
		{ "default:wood", "", "" },
		{ "default:wood", "", "" }
	}
})

minetest.register_craft( {
	output = "hyrule_mapgen:wood_fence 6",
	recipe = {
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "default:stick", "default:stick"}
	}
})

minetest.register_craft({
	output = 'hyrule_mapgen:ice_brick',
	recipe = {
		{'default:ice', 'default:ice', ''},
		{'default:ice', '', ''},
		{'default:ice', '', ''},
	}
})

minetest.register_craft({
	output = 'hyrule_mapgen:bridge',
	recipe = {
		{'', 'group:wood', ''},
		{'group:wood', 'group:wood', 'group:wood'},
	}
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

minetest.register_craft({
	output = 'hyrule_mapgen:railblock',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:steel_ingot', 'default:steel_ingot', ''},
		{'', 'default:steel_ingot', ''},
	}
})

minetest.register_craft({
	output = 'hyrule_mapgen:wallring',
	recipe = {
		{'hyrule_mapgen:railblock', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'hyrule_mapgen:volvagia_spawn',
	recipe = {
		{'', 'default:stone', ''},
		{'bucket:bucket_lava', 'hyruletools:pendant3', 'bucket:bucket_lava'},
		{'', 'default:stone', ''},
	}
})

minetest.register_craft({
	output = 'hyrule_mapgen:bongo_spawn',
	recipe = {
		{'', 'default:stone', ''},
		{'bucket:bucket_lava', 'hyruletools:pendant1', 'bucket:bucket_lava'},
		{'', 'default:stone', ''},
	}
})

minetest.register_craft({
	output = 'hyrule_mapgen:dodongo_spawn',
	recipe = {
		{'', 'default:tree', ''},
		{'moreplants:eye', 'hyruletools:pendant2', 'moreplants:eye'},
		{'', 'default:tree', ''},
	}
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
