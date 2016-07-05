-- Minerals

minetest.register_node("default:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'default:coal_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"default_stone.png^default_mineral_iron.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

--rupees by D00Med
minetest.register_node("default:stone_with_redrupee", {
	description = "Buried red rupee",
	tiles = {"default_stone.png^hyruletools_redrupee.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'maptools:gold_coin',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:stone_with_bluerupee", {
	description = "Buried blue rupee",
	tiles = {"default_stone.png^hyruletools_bluerupee.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'maptools:silver_coin',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("default:stone_with_greenrupee", {
	description = "Buried green rupee",
	tiles = {"default_stone.png^hyruletools_greenrupee.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'maptools:copper_coin',
	sounds = default.node_sound_stone_defaults(),
})

--end of rupees

minetest.register_node("default:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"default_stone.png^default_mineral_copper.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'default:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_mese", {
	description = "Mese Ore",
	tiles = {"default_stone.png^default_mineral_mese.png"},
	paramtype = "light",
	groups = {cracky = 1, xp = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
	light_source = 1,
})

minetest.register_node("default:mese", {
	description = "Mese Block",
	tiles = {"default_mese_block.png"},
	paramtype = "light",
	groups = {cracky = 1, level = 2, xp = 1},
	sounds = default.node_sound_stone_defaults(),
	light_source = 3,
})

minetest.register_node("default:stone_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_stone.png^default_mineral_diamond.png"},
	groups = {cracky = 1, xp = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"default_stone.png^default_mineral_gold.png"},
	groups = {cracky = 2, xp = 1},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})



-- Blocks

minetest.register_node("default:coalblock", {
	description = "Coal Block",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3, fuel = 370},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:steelblock", {
	description = "Steel Block",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:copperblock", {
	description = "Copper Block",
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:bronzeblock", {
	description = "Bronze Block",
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:goldblock", {
	description = "Gold Block",
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:diamondblock", {
	description = "Diamond Block",
	tiles = {"default_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})
