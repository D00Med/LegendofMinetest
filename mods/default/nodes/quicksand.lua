minetest.register_node("default:quicksand_flowing", {
	description = "quicksand flowing",
	inventory_image = minetest.inventorycube("default_quicksand_source.png"),
	drawtype = "flowingliquid",
	tiles = {"default_quicksand_source.png"},
	special_tiles = {
		{
			image="default_quicksand_flowing.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2}
		},
		{
			image="default_quicksand_source.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2}
		},
	},
	alpha = 255,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 4,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:quicksand_flowing",
	liquid_alternative_source = "default:quicksand_source",
	liquid_viscosity = 15,
	freezemelt = "default:sand",
	post_effect_color = {a=179, r=229, g=226, b=158},
	groups = {liquid=3, puts_out_fire=1, not_in_creative_inventory=1, freezes=1, melt_around=1},
})

minetest.register_node("default:quicksand_source", {
	description = "Quicksand",
	inventory_image = minetest.inventorycube("default_quicksand_source.png"),
	drawtype = "liquid",
	tiles = {
		{name="default_quicksand.png", animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=1}}
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name="default_quicksand_source.png",
			animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=1},
			backface_culling = false,
		}
	},
	alpha = 255,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 4,
	paramtype = "light",
	liquidtype = "source",
	liquid_alternative_flowing = "default:quicksand_flowing",
	liquid_alternative_source = "default:quicksand_source",
	liquid_viscosity = 15,
	freezemelt = "default:sand",
	post_effect_color = {a=179, r=229, g=226, b=158},
	groups = {liquid=3, puts_out_fire=1, freezes=1}
})