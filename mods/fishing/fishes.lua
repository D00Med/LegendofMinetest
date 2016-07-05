-------------------------------------------------------------------------------------------
-- Fishing - crabman77 version
-- Rewrited from original Fishing - Mossmanikin's version - Fishes 0.0.4
-- License (code & textures): WTFPL
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Fish
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("fishing:fish_raw", {
	description = fishing_setting.func.S("Fish"),
	groups = {},
	inventory_image = "fishing_fish_raw.png",
	 on_use = minetest.item_eat(2),
})
	-----------------------------------------------------
	-- Roasted Fish
	-----------------------------------------------------
	minetest.register_craftitem("fishing:fish_cooked", {
		description = fishing_setting.func.S("Roasted Fish"),
		groups = {},
		inventory_image = "fishing_fish_cooked.png",
		on_use = minetest.item_eat(4),
	})
	-----------------------------------------------------
	-- Sushi
	-----------------------------------------------------
	minetest.register_craftitem("fishing:sushi", {
		description = fishing_setting.func.S("Sushi (Hoso Maki)"),
		groups = {},
		inventory_image = "fishing_sushi.png",
		on_use = minetest.item_eat(6),
	})

-----------------------------------------------------------------------------------------------
-- clownfish
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("fishing:clownfish_raw", {
	description = fishing_setting.func.S("Clownfish"),
	groups = {},
	inventory_image = "fishing_clownfish_raw.png",
	 on_use = minetest.item_eat(2),
})

-----------------------------------------------------------------------------------------------
-- bluewhite
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("fishing:bluewhite_raw", {
	description = fishing_setting.func.S("Bluewhite"),
	groups = {},
	inventory_image = "fishing_bluewhite_raw.png",
	 on_use = minetest.item_eat(2),
})
-----------------------------------------------------------------------------------------------
-- exoticfish
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("fishing:exoticfish_raw", {
	description = fishing_setting.func.S("Exotic"),
	groups = {},
	inventory_image = "fishing_exoticfish_raw.png",
	 on_use = minetest.item_eat(2),
})

-----------------------------------------------------------------------------------------------
-- carp
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("fishing:carp_raw", {
	description = fishing_setting.func.S("Carp"),
	groups = {},
	inventory_image = "fishing_carp_raw.png",
	 on_use = minetest.item_eat(2),
})

-----------------------------------------------------------------------------------------------
-- perch
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("fishing:perch_raw", {
	description = fishing_setting.func.S("Perch"),
	groups = {},
	inventory_image = "fishing_perch_raw.png",
	 on_use = minetest.item_eat(2),
})

-----------------------------------------------------------------------------------------------
-- catfish
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("fishing:catfish_raw", {
	description = fishing_setting.func.S("Catfish"),
	groups = {},
	inventory_image = "fishing_catfish_raw.png",
	 on_use = minetest.item_eat(2),
})


-----------------------------------------------------------------------------------------------
-- Whatthef... it's a freakin' Shark!
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("fishing:shark_raw", {
	description = fishing_setting.func.S("Shark"),
	groups = {},
	inventory_image = "fishing_shark_raw.png",
	 on_use = minetest.item_eat(2),
})
	-----------------------------------------------------
	-- Roasted Shark
	-----------------------------------------------------
	minetest.register_craftitem("fishing:shark_cooked", {
		description = fishing_setting.func.S("Roasted Shark"),
		groups = {},
		inventory_image = "fishing_shark_cooked.png",
		on_use = minetest.item_eat(6),
	})

-----------------------------------------------------------------------------------------------
-- Pike
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("fishing:pike_raw", {
	description = fishing_setting.func.S("Northern Pike"),
	groups = {},
	inventory_image = "fishing_pike_raw.png",
	 on_use = minetest.item_eat(2),
})
	-----------------------------------------------------
	-- Roasted Pike
	-----------------------------------------------------
	minetest.register_craftitem("fishing:pike_cooked", {
		description = fishing_setting.func.S("Roasted Northern Pike"),
		groups = {},
		inventory_image = "fishing_pike_cooked.png",
		on_use = minetest.item_eat(6),
	})
