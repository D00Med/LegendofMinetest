function default.register_fence(itemstring, def)
	local fence_texture_1 = "default_fence_overlay.png^"
	local fence_texture_2 = "^default_fence_overlay.png^[makealpha:255,126,126"
	
	if not def.groups then
		def.groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fuel = 4}
	end
	if not def.sounds then
		def.sounds = default.node_sound_wood_defaults()
	end
	
	minetest.register_node(itemstring, {
		description = def.description,
		drawtype = "fencelike",
		tiles = {def.texture},
		inventory_image = fence_texture_1 .. def.texture .. fence_texture_2,
		wield_image = fence_texture_1 .. def.texture .. fence_texture_2,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
		},
		groups = def.groups,
		sounds = def.sounds,
	})
	
	
	minetest.register_craft({
		output = itemstring .. ' 4',
		recipe = {
			{'group:stick', def.material, 'group:stick'},
			{'group:stick', def.material, 'group:stick'},
		}
	})
end

default.register_fence("default:fence_wood", {
	description = "Wooden Fence",
	texture = "default_wood.png",
	material = "default:wood"
})

default.register_fence("default:fence_junglewood", {
	description = "Junglewood Fence",
	texture = "default_junglewood.png",
	material = "default:junglewood"
})

default.register_fence("default:fence_pinewood", {
	description = "Pine Wood Fence",
	texture = "default_pine_wood.png",
	material = "default:pinewood"
})

default.register_fence("default:fence_acaciawood", {
	description = "Acacia Wood Fence",
	texture = "default_acacia_wood.png",
	material = "default:acacia_wood"
})
