
-- Animals

dofile(minetest.get_modpath("pmobs").."/wolf.lua") -- KrupnoPavel
dofile(minetest.get_modpath("pmobs").."/dog.lua")

-- Monsters

--dofile(minetest.get_modpath("pmobs").."/ninja.lua") -- CProgrammingRU
dofile(minetest.get_modpath("pmobs").."/yeti.lua") -- TenPlus1

-- NPC
dofile(minetest.get_modpath("pmobs").."/npc.lua") -- TenPlus1
dofile(minetest.get_modpath("pmobs").."/guard.lua") -- CProgrammingRU

if minetest.setting_get("log_mods") then
	minetest.log("action", "pmobs loaded")
end

