minetest.register_node("default:ladder", {
	description = "Ladder",
	tiles = {"default_wood.png"},
	inventory_image = "default_ladder.png",
	wield_image = "default_ladder.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	climbable = true,
	is_ground_content = false,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.3125, 0.5, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- NodeBox2
			{-0.5, 0.3125, 0.375, 0.5, 0.4375, 0.5}, -- NodeBox3
			{-0.5, 0.0625, 0.375, 0.5, 0.1875, 0.5}, -- NodeBox4
			{-0.5, -0.1875, 0.375, 0.5, -0.0625, 0.5}, -- NodeBox5
			{-0.5, -0.4375, 0.375, 0.5, -0.3125, 0.5}, -- NodeBox6
		}
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2, fuel = 5},
	sounds = default.node_sound_wood_defaults(),
})
