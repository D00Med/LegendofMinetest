-- GENERATED CODE
-- Node Box Editor, version 0.8.1 - Glass
-- Namespace: test

minetest.register_node("decor_vase:vase", {
	description = "pot",
	tiles = {
		"decor_vase_base.png",
		"decor_vase_base.png",
		"decor_vase.png",
		"decor_vase.png",
		"decor_vase.png",
		"decor_vase.png"
	},
	drawtype = "nodebox",
	sounds = default.node_sound_glass_defaults(),
	paramtype = "light",
	groups = {oddly_breakable_by_hand=1, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.25}, -- NodeBox1
			{-0.25, -0.5, -0.25, 0.25, 0.375, 0.3125}, -- NodeBox2
			{-0.3125, -0.4375, -0.3125, 0.3125, 0.3125, 0.375}, -- NodeBox3
			{-0.375, -0.375, -0.375, 0.375, 0.25, 0.4375}, -- NodeBox4
			{-0.4375, -0.3125, -0.4375, 0.4375, 0.1875, 0.5}, -- NodeBox5
			{-0.3125, 0.375, -0.3125, 0.3125, 0.5, 0.375}, -- NodeBox6
		}
	},
	drop = {
		items = {
			{items = {"maptools:copper_coin"}, rarity = 1},
		}
	},
})

minetest.register_craft( {
	output = "decor_vase:vase 5",
	recipe = {
		{ "default:clay_lump", "", "default:clay_lump" },
		{ "default:clay_lump", "", "default:clay_lump" },
		{ "", "default:clay_lump", "" }
	}
})
