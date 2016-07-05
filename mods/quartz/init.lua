--Node Registration

--Quartz Crystal
minetest.register_craftitem("quartz:quartz_crystal", {
	description = "Quartz Crystal",
	inventory_image = "quartz_crystal_full.png",
})

--Ore
minetest.register_node("quartz:quartz_ore", {
    description = "Quartz Ore",
 	tiles = {"default_stone.png^quartz_ore.png"},
	groups = {cracky=3, stone=1},
	drop = 'quartz:quartz_crystal',
    sounds = default.node_sound_stone_defaults(),
})
	 
minetest.register_ore({
    ore_type       = "scatter",
    ore            = "quartz:quartz_ore",
    wherein        = "default:stone",
    clust_scarcity = 5000,
    clust_num_ores = 10,
    clust_size     = 5,
    height_min     = -59,
    height_max     = -10,
})

--Quartz Block
minetest.register_node("quartz:block", {
	description = "Quartz Block",
	tiles = {"quartz_block_top.png", "quartz_block_bottom.png", "quartz_block_side.png"},
	groups = {snappy=1,bendy=2,cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

--Chiseled Quartz
minetest.register_node("quartz:chiseled", {
	description = "Chiseled Quartz",
	tiles = {"quartz_chiseled_top.png", "quartz_chiseled_top.png", "quartz_chiseled_side.png"},
	groups = {snappy=1,bendy=2,cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

--Quartz Pillar
minetest.register_node("quartz:pillar", {
	description = "Quartz Pillar",
	tiles = {"quartz_pillar_top.png", "quartz_pillar_top.png", "quartz_pillar_side.png"},
	groups = {snappy=1,bendy=2,cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

--Quartz Pillar (horizontal)
minetest.register_node("quartz:pillar_horizontal", {
        description = "Quartz Pillar Horizontal",
	tiles = {"quartz_pillar_side.png", "quartz_pillar_side.png", "quartz_pillar_side.png^[transformR90",
	"quartz_pillar_side.png^[transformR90", "quartz_pillar_top.png", "quartz_pillar_top.png"},
	paramtype2 = "facedir",
	groups = {snappy=1,bendy=2,cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

--Stairs & Slabs
stairs.register_stair_and_slab("quartzblock", "quartz:block",
	{snappy=1,bendy=2,cracky=1,level=2},
	{"quartz_block_top.png", "quartz_block_bottom.png", "quartz_block_side.png"},
	"Quartz stair",
	"Quartz slab",
	default.node_sound_stone_defaults()
)

stairs.register_slab("quartzstair", "quartz:pillar",
	{snappy=1,bendy=2,cracky=1,level=2},
	{"quartz_pillar_top.png", "quartz_pillar_top.png", "quartz_pillar_side.png"},
	"Quartz Pillar stair",
	"Quartz Pillar slab",
	default.node_sound_stone_defaults()
)		

--Crafting

--Quartz Block
minetest.register_craft({
	output = 'quartz:block',
	recipe = {
		{'quartz:quartz_crystal', 'quartz:quartz_crystal'},
		{'quartz:quartz_crystal', 'quartz:quartz_crystal'},
	}
})
	
--Chiseled Quartz
minetest.register_craft({
	output = 'quartz:chiseled 2',
	recipe = {
		{'stairs:slab_quartzblock'},
		{'stairs:slab_quartzblock'},
	}
})

--Quartz Pillar
minetest.register_craft({
	output = 'quartz:pillar 2',
	recipe = {
		{'quartz:block'},
		{'quartz:block'},
	}
})

minetest.register_craft({
	output = 'quartz:pillar 2',
	recipe = {
		{'quartz:pillar_horizontal'},
		{'quartz:pillar_horizontal'},
	}
})

--Quartz Pillar (horizontal)
minetest.register_craft({
	output = 'quartz:pillar_horizontal 2',
	recipe = {
		{'quartz:block', 'quartz:block'},
	}
})

minetest.register_craft({
	output = 'quartz:pillar_horizontal 2',
	recipe = {
		{'quartz:pillar', 'quartz:pillar'},
	}
})
