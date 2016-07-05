minetest.register_craftitem("default:stick", {
	description = "Stick",
	inventory_image = "default_stick.png",
	groups = {stick = 1, fuel = 1},
})

minetest.register_craftitem("default:paper", {
	description = "Paper",
	inventory_image = "default_paper.png",
	groups = {fuel = 1},
})

minetest.register_craftitem("default:clay_lump", {
	description = "Clay Lump",
	inventory_image = "default_clay_lump.png",
})

minetest.register_craftitem("default:clay_brick", {
	description = "Clay Brick",
	inventory_image = "default_clay_brick.png",
})

minetest.register_craftitem("default:obsidian_shard", {
	description = "Obsidian Shard",
	inventory_image = "default_obsidian_shard.png",
})

minetest.register_craftitem("default:charcoal", {
	description = "Charcoal",
	inventory_image = "default_charcoal.png",
	groups = {coal = 1, fuel = 30},
})
