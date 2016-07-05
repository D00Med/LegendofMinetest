-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into game_api.txt

-- Definitions made by this mod that other mods can use too
default = {}
default.LIGHT_MAX = 14

-- The hand
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x = 1, y = 1, z = 2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2] = 3.00, [3] = 0.70}, uses = 0, maxlevel = 1},
			snappy = {times={[3] = 0.40}, uses = 0, maxlevel = 1},
			oddly_breakable_by_hand = {times={[1] = 3.50, [2] = 2.00, [3] = 0.70}, uses = 0}
		},
		damage_groups = {fleshy = 1},
	}
})

-- Load files
local modpath = minetest.get_modpath("default")
local mg_name = minetest.get_mapgen_params().mgname or ""

dofile(modpath .. "/gui.lua")

dofile(modpath .. "/functions.lua")
dofile(modpath .. "/environment.lua")

dofile(modpath .. "/nodes.lua")
	-- loads files in ./nodes/
dofile(modpath .. "/items.lua")
	-- loads files in ./items/

dofile(modpath .. "/crafting.lua")

dofile(modpath .. "/mapgen.lua")
if mg_name == "v6" then
	dofile(modpath .. "/mapgenv6.lua")
else
	dofile(modpath .. "/mapgenv57.lua")
end
dofile(modpath .. "/trees.lua")

dofile(modpath .. "/player.lua")

dofile(modpath .. "/aliases.lua")
dofile(modpath .. "/legacy.lua")

dofile(modpath .. "/chat_cmds.lua")
