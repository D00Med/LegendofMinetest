

minetest.register_node("decor_shield:shield", {
	description = "sheild",
	drawtype = "signlike",
	tiles = {"decor_swdshld.png"},
	inventory_image = "decor_swdshld.png",
	wield_image = "decor_swdshld.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1}})

minetest.register_craft( {
	output = "decor_shield:shield 1",
	recipe = {
		{ "default:steel_ingot", "", "default:steel_ingot" },
		{ "default:steel_ingot", "", "default:steel_ingot" },
		{ "", "default:sword_steel", "" }
	}
})