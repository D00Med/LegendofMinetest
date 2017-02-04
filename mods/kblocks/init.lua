if minetest.setting_getbool("loz_mode") then
minetest.register_node("kblocks:blue", {
	description = "Blue Rooftile",
	tiles = {
		"kblocks_blue.png"
	},
	groups = {cracky=1}
})

minetest.register_node("kblocks:red", {
	description = "Red Rooftile",
	tiles = {
		"kblocks_red.png"
	},
	groups = {cracky=1}
})

stairs.register_stair_and_slab(
	"red",
	"kblocks:red",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"kblocks_red.png"},
	"Red Roof Slope",
	"Red Roof Slab",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"blue",
	"kblocks:blue",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"kblocks_blue.png"},
	"Blue Roof Slope",
	"Blue Roof Slab",
	default.node_sound_wood_defaults()
)

minetest.register_node("kblocks:brown", {
	description = "Brown Tile",
	tiles = {
		"kblocks_browntile.png"
	},
	groups = {cracky=1}
})

minetest.register_node("kblocks:green", {
	description = "Green Tile",
	tiles = {
		"kblocks_greentile.png"
	},
	groups = {cracky=1}
})

minetest.register_node("kblocks:hedge", {
	description = "Hedge",
	tiles = {
		"kblocks_hedge_top.png",
		"kblocks_hedge_bottom.png",
		"kblocks_hedge_side.png",
		"kblocks_hedge_side.png",
		"kblocks_hedge_side.png",
		"kblocks_hedge_side.png"
	},
	groups = {cracky=1}
})

minetest.register_node("kblocks:vent", {
	description = "Chimney",
	tiles = {
		"kblocks_hole.png",
		"kblocks_hedge_bottom.png",
		"kblocks_hedge_bottom.png",
		"kblocks_hedge_bottom.png",
		"kblocks_hedge_bottom.png",
		"kblocks_hedge_bottom.png"
	},
	groups = {cracky=1},
	drawtype = "nodebox",
	walkable = false,
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox1
			{-0.4375, -0.4375, -0.4375, 0.4375, -0.0625, 0.4375}, -- NodeBox2
			{-0.5, -0.0625, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox3
		}
	},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:eye" then
			minetest.set_node(pos, {name="kblocks:vent_invis", param2=node.param2})
		end
	end
})

minetest.register_node("kblocks:vent_invis", {
	drawtype = "allfaces",
	tiles = {
		"3d_armor_trans.png",
	},
	groups = {cracky=1},
	drawtype = "nodebox",
	walkable = false,
	paramtype = "light",
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:eye" then
			minetest.set_node(pos, {name="kblocks:vent", param2=node.param2})
		end
	end
})

minetest.register_node("kblocks:stone", {
	description = "Garden Stone",
	tiles = {
		"kblocks_stone.png",
		"kblocks_stone.png",
		"kblocks_greentile.png",
		"kblocks_greentile.png",
		"kblocks_greentile.png",
		"kblocks_greentile.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propogates = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.1875, 0.25, -0.4375, 0.125}, -- NodeBox1
			{-0.1875, -0.5, 0.125, 0.25, -0.4375, 0.1875}, -- NodeBox3
			{-0.125, -0.5, 0.1875, 0.1875, -0.4375, 0.25}, -- NodeBox4
			{-0.1875, -0.5, -0.25, 0.1875, -0.4375, -0.1875}, -- NodeBox5
			{-0.3125, -0.5, -0.0625, -0.25, -0.4375, 0.0625}, -- NodeBox6
			{0.25, -0.5, 0, 0.3125, -0.4375, 0.125}, -- NodeBox7
		}
	},
	groups = {cracky=2}
})
end



minetest.register_craft({
	output = 'kblocks:vent',
	recipe = {
		{'default:stone', '', 'default:stone'},
		{'default:stone', '', 'default:stone'},
	}
})

minetest.register_craft({
	output = 'kblocks:blue 4',
	recipe = {
		{'default:brick', 'dye:blue', 'default:brick'},
		{'default:brick', 'dye:blue', 'default:brick'},
	}
})

minetest.register_craft({
	output = 'kblocks:red 4',
	recipe = {
		{'default:brick', 'dye:red', 'default:brick'},
		{'default:brick', 'dye:red', 'default:brick'},
	}
})

minetest.register_craft({
	output = 'kblocks:brown 4',
	recipe = {
		{'default:dirt', 'default:dirt'},
		{'default:dirt', 'default:dirt'},
	}
})

minetest.register_craft({
	output = 'kblocks:green 4',
	recipe = {
		{'default:leaves', 'default:leaves'},
		{'default:leaves', 'default:leaves'},
	}
})

minetest.register_craft({
	output = "kblocks:stone 6",
	type = "shapeless",
	recipe = {"default:cobble"}
})