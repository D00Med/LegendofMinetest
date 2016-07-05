minetest.register_node("default:cactus", {
	description = "Cactus",
	tiles = {"default_cactus_top.png", "default_cactus_top.png",
		"default_cactus_side.png"},
	paramtype2 = "facedir",
	groups = {snappy = 1, choppy = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	damage_per_second = 1,
	on_place = minetest.rotate_node,

	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})
