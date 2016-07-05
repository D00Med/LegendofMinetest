-- GENERATED CODE
-- Node Box Editor, version 0.8.1 - Glass
-- Namespace: test

minetest.register_node("rocks:rock", {
	description = "rock",
	tiles = {
		"default_stone.png",
		"default_stone.png",
		"default_stone.png",
		"default_stone.png",
		"default_stone.png",
		"default_stone.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=1, falling_node=1},
	drop = "maptools:silver_coin",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.4375, -0.4375, -0.3125, 0.375, -0.125, 0.25}, -- NodeBox2
			{-0.3125, -0.125, -0.375, 0.25, -0.0625, 0.3125}, -- NodeBox3
			{-0.3125, -0.4375, -0.4375, 0.25, -0.125, 0.375}, -- NodeBox4
			{-0.375, -0.4375, -0.375, 0.3125, -0.125, 0.3125}, -- NodeBox5
			{-0.25, -0.0625, -0.3125, 0.1875, 0, 0.25}, -- NodeBox6
			{-0.375, -0.125, -0.25, 0.3125, -0.0625, 0.1875}, -- NodeBox7
		}
	}
})


