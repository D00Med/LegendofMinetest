minetest.register_node("default:ice", {
	description = "Ice",
	drawtype = "allfaces_optional",
	tiles = {"default_ice.png"},
	use_texture_alpha = true,
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
})
