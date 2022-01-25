minetest.register_craft({ 
	output = "dye:green",
	recipe = {
		{"xdecor:ivy",},
	} 
})

minetest.register_craft({ 
	output = "xdecor:baricade",
	recipe = {
		{"group:stick", "", "group:stick"},
		{"", "default:steel_ingot", ""},
		{"group:stick", "", "group:stick"}
	} 
})

minetest.register_craft({
	output = "xdecor:barrel",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"default:iron_lump", "", "default:iron_lump"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

-- minetest.register_craft({
	-- output = "xdecor:bowl 3",
	-- recipe = {
		-- {"group:wood", "", "group:wood"},
		-- {"", "group:wood", ""}
	-- }
-- })

-- minetest.register_craftitem("xdecor:bowl", {
	-- description = "Bowl",
	-- inventory_image = "xdecor_bowl.png",
	-- wield_image = "xdecor_bowl.png"
-- })

-- minetest.register_craftitem("xdecor:bowl_soup", {
	-- description = "Bowl of soup",
	-- inventory_image = "xdecor_bowl_soup.png",
	-- wield_image = "xdecor_bowl_soup.png",
	-- groups = {not_in_creative_inventory = 1},
	-- on_use = minetest.item_eat(30)
-- })

-- minetest.register_craftitem("xdecor:bucket_potion", {
	-- description = "heal potion",
	-- inventory_image = "xdecor_bucket_potion.png",
	-- wield_image = "xdecor_bucket_potion.png",
	-- groups = {not_in_creative_inventory = 0},
	-- on_use = function(itemstack, player)
	-- player:set_hp(25)
	-- itemstack:replace("bucket:bucket_empty")
	-- return itemstack
	-- end,
-- })

minetest.register_craft({ 
	output = "xdecor:candle",
	recipe = {
		{"default:torch"}
	} 
})

minetest.register_craft({
	output = "xdecor:cabinet",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"doors:trapdoor", "", "doors:trapdoor"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

minetest.register_craft({
	output = "xdecor:cabinet_half 2",
	recipe = {
		{"xdecor:cabinet"}
	}
})

minetest.register_craft({
	output = "xdecor:cushion 2",
	recipe = {
		{"wool:red", "wool:red"}
	}
})

-- minetest.register_craft({
	-- output = "xdecor:cauldron_empty",
	-- recipe = {
		-- {"default:iron_lump", "", "default:iron_lump"},
		-- {"default:iron_lump", "", "default:iron_lump"},
		-- {"default:iron_lump", "default:iron_lump", "default:iron_lump"}
	-- }
-- })

minetest.register_craft({
	output = "xdecor:chair",
	recipe = {
		{"group:stick", "", ""},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"}
	}
})

minetest.register_craft({
	output = "xdecor:coalstone_tile 4",
	recipe = {
		{"default:coalblock", "default:stone"},
		{"default:stone", "default:coalblock"}
	}
})
--[[]
minetest.register_craft({
	output = "xdecor:cobble_wall_ln 6",
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"}
	}
})
]]

minetest.register_craft({
	output = "xdecor:crate",
	recipe = {
		{"group:wood", "group:wood", "group:stick"},
		{"group:wood", "group:stick", "group:wood"},
		{"group:stick", "group:wood", "group:wood"}
	}
})

--[[
minetest.register_craft({
	output = "xdecor:mossycobble_wall_ln 6",
	recipe = {
		{"default:mossycobble", "default:mossycobble", "default:mossycobble"},
		{"default:mossycobble", "default:mossycobble", "default:mossycobble"}
	}
})
]]

minetest.register_craft({
	output = "xdecor:cobweb",
	recipe = {
		{"farming:cotton", "", "farming:cotton"},
		{"", "farming:cotton", ""},
		{"farming:cotton", "", "farming:cotton"}
	}
})

minetest.register_craft({
	output = "xdecor:desertstone_tile",
	recipe = {
		{"default:desert_cobble", "default:desert_cobble"},
		{"default:desert_cobble", "default:desert_cobble"}
	}
})
	
minetest.register_craft({
	output = "xdecor:empty_shelf",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"", "", ""},
		{"group:wood", "group:wood", "group:wood"}
	}
})

minetest.register_craft({
	output = "xdecor:enderchest",
	recipe = {
		{"", "default:obsidian", ""},
		{"default:obsidian", "default:chest", "default:obsidian"},
		{"", "default:obsidian", ""}
	}
})

minetest.register_craft({
	output = "xdecor:enchantment_table",
	recipe = {
		{"", "default:book", ""},
		{"default:diamond", "default:obsidian", "default:diamond"},
		{"default:obsidian", "default:obsidian", "default:obsidian"}
	}
})

minetest.register_craft({
	output = "xdecor:flint_steel",
	recipe = {
		{"default:obsidian_shard", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "xdecor:frame",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "default:paper", "group:stick"},
		{"group:stick", "group:stick", "group:stick"}
	}
})
	
minetest.register_craft({
	output = "xdecor:hammer",
	recipe = {
		{"default:steel_ingot", "group:stick", "default:steel_ingot"},
		{"", "group:stick", ""}
	}
})

minetest.register_craft({
	output = "xdecor:hard_clay",
	recipe = {
		{"default:clay", "default:clay"},
		{"default:clay", "default:clay"}
	}
})

minetest.register_craft({
	output = "xdecor:hive",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"default:paper", "default:paper", "default:paper"},
		{"group:stick", "group:stick", "group:stick"}
	}
})

minetest.register_craftitem("xdecor:honey", {
	description = "Honey",
	inventory_image = "xdecor_honey.png",
	wield_image = "xdecor_honey.png",
	groups = {not_in_creative_inventory=1},
	on_use = minetest.item_eat(2)
})

minetest.register_craft({
	output = "xdecor:ivy 4",
	recipe = {
		{"group:leaves"},
		{"group:leaves"}
	}
})

minetest.register_craft({
	output = "xdecor:japanese_door",
	recipe = {
		{"group:wood", "default:paper"},
		{"default:paper", "group:wood"},
		{"group:wood", "default:paper"}
	}
})
	
minetest.register_craft({
	output = "xdecor:lantern",
	recipe = {
		{"default:iron_lump"},
		{"default:torch"},
		{"default:iron_lump"}
	}
})

minetest.register_craft({
	output = "xdecor:lightbox",
	recipe = {
		{"group:stick", "default:torch", "group:stick"},
		{"group:stick", "default:glass", "group:stick"},
		{"group:stick", "default:torch", "group:stick"}
	}
})

minetest.register_craft({
	output = "xdecor:mailbox",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"dye:red", "default:paper", "dye:red"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "xdecor:multishelf",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:vessel", "group:book", "group:vessel"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

minetest.register_craft({
	output = "xdecor:packed_ice",
	recipe = {
		{"default:ice", "default:ice"},
		{"default:ice", "default:ice"}
	}
})

minetest.register_craft({
	output = "xdecor:painting_1",
	recipe = {
		{"default:sign_wall", "dye:blue"}
	}
})

minetest.register_craft({
	output = "xdecor:prison_door",
	recipe = {
		{"xpanes:bar", "xpanes:bar"},
		{"xpanes:bar", "xpanes:bar"},
		{"xpanes:bar", "xpanes:bar"}
	}
})

minetest.register_craft({
	output = "xdecor:prison_rust_door",
	recipe = {
		{"xpanes:rust_bar", "xpanes:rust_bar"},
		{"xpanes:rust_bar", "xpanes:rust_bar"},
		{"xpanes:rust_bar", "xpanes:rust_bar"}
	}
})

minetest.register_craft({
	output = "xdecor:rope",
	recipe = {
		{"farming:string"},
		{"farming:string"},
		{"farming:string"}
	}
})

minetest.register_craft({
	output = "xdecor:screen_door",
	recipe = {
		{"group:wood", "group:wood"},
		{"xpanes:chainlink", "xpanes:chainlink"},
		{"group:wood", "group:wood"}
	}
})

minetest.register_craft({
	output = "xdecor:slide_door",
	recipe = {
		{"default:paper", "default:paper"},
		{"default:paper", "default:paper"},
		{"group:wood", "group:wood"}
	}
})
	
minetest.register_craft({
	output = "xdecor:stone_tile 2",
	recipe = {
		{"default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble"}
	}
})
	
minetest.register_craft({
	output = "xdecor:stone_rune 4",
	recipe = {
		{"default:stone", "default:stone", "default:stone"},
		{"default:stone", "", "default:stone"},
		{"default:stone", "default:stone", "default:stone"}
	}
})

minetest.register_craft({
	output = "xdecor:stonepath 16",
	recipe = {
		{"stairs:slab_cobble", "", "stairs:slab_cobble"},
		{"", "stairs:slab_cobble", ""},
		{"stairs:slab_cobble", "", "stairs:slab_cobble"}
	}
})

minetest.register_craft({
	output = "xdecor:table",
	recipe = {
		{"stairs:slab_wood", "stairs:slab_wood", "stairs:slab_wood"},
		{"", "group:stick", ""},
		{"", "group:stick", ""}
	}
})

minetest.register_craft({ 
	output = "xdecor:tatami",
	recipe = {
		{"farming:wheat", "farming:wheat", "farming:wheat"}
	} 
})

minetest.register_craft({
	output = "xdecor:tv",
	recipe = {
		{"default:steel_ingot", "default:copper_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"default:steel_ingot", "default:copper_ingot", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "xdecor:worktable",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "default:steel_ingot", "group:wood"},
	}
})
	
minetest.register_craft({
	output = "xdecor:woodframed_glass",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "default:glass", "group:stick"},
		{"group:stick", "group:stick", "group:stick"}
	}
})

minetest.register_craft({
	output = "xdecor:wood_tile 2",
	recipe = {
		{"group:wood", "group:wood"},
		{"group:wood", "group:wood"}
	}
})

minetest.register_craft({
	output = "xdecor:woodglass_door",
	recipe = {
		{"default:glass", "default:glass"},
		{"group:wood", "group:wood"},
		{"group:wood", "group:wood"}
	}
})
