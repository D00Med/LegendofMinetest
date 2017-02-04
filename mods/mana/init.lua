--[[
Mana
This mod adds mana to players, a special attribute

License: WTFPL
]]

--[===[
	Initialization
]===]

local S
if (minetest.get_modpath("intllib")) then
	S = intllib.Getter()
else
	S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

mana = {}
mana.playerlist = {}

mana.settings = {}
mana.settings.default_max = 200
mana.settings.default_regen = 1
mana.settings.regen_timer = 0.4

do
	local default_max = tonumber(minetest.setting_get("mana_default_max"))
	if default_max ~= nil then
		mana.settings.default_max = default_max
	end

	local default_regen = tonumber(minetest.setting_get("mana_default_regen"))
	if default_regen ~= nil then
		mana.settings.default_regen = default_regen
	end

	local regen_timer = tonumber(minetest.setting_get("mana_regen_timer"))
	if regen_timer ~= nil then
		mana.settings.regen_timer = regen_timer
	end
end


--[===[
	API functions
]===]

function mana.set(playername, value) 
	if value < 0 then
		minetest.log("info", "[mana] Warning: mana.set was called with negative value!")
		value = 0
	end
	value = mana.round(value)
	if value > mana.playerlist[playername].maxmana then
		value = mana.playerlist[playername].maxmana
	end
	if mana.playerlist[playername].mana ~= value then
		mana.playerlist[playername].mana = value
		--mana.hud_update(playername)
	end
end

function mana.setmax(playername, value)
	if value < 0 then
		value = 0
		minetest.log("info", "[mana] Warning: mana.setmax was called with negative value!")
	end
	value = mana.round(value)
	if mana.playerlist[playername].maxmana ~= value then
		mana.playerlist[playername].maxmana = value
		if(mana.playerlist[playername].mana > value) then
			mana.playerlist[playername].mana = value
		end
		--mana.hud_update(playername)
	end
end

function mana.setregen(playername, value)
	mana.playerlist[playername].regen = value
end

function mana.get(playername)
	return mana.playerlist[playername].mana
end

function mana.getmax(playername)
	return mana.playerlist[playername].maxmana
end

function mana.getregen(playername)
	return mana.playerlist[playername].regen
end

function mana.add_up_to(playername, value)
	local t = mana.playerlist[playername]
	value = mana.round(value)
	if(t ~= nil and value >= 0) then
		local excess
		if((t.mana + value) > t.maxmana) then
			excess = (t.mana + value) - t.maxmana
			t.mana = t.maxmana
		else
			excess = 0
			t.mana = t.mana + value
		end
		--mana.hud_update(playername)
		return true, excess
	else
		return false
	end
end

function mana.add(playername, value)
	local t = mana.playerlist[playername]
	value = mana.round(value)
	if(t ~= nil and ((t.mana + value) <= t.maxmana) and value >= 0) then
		t.mana = t.mana + value 
		--mana.hud_update(playername)
		return true
	else
		return false
	end
end

function mana.subtract(playername, value)
	local t = mana.playerlist[playername]
	value = mana.round(value)
	if(t ~= nil and t.mana >= value and value >= 0) then
		t.mana = t.mana -value 
		--mana.hud_update(playername)
		return true
	else
		return false
	end
end

function mana.subtract_up_to(playername, value)
	local t = mana.playerlist[playername]
	value = mana.round(value)
	if(t ~= nil and value >= 0) then
		local missing
		if((t.mana - value) < 0) then
			missing = math.abs(t.mana - value)
			t.mana = 0
		else
			missing = 0
			t.mana = t.mana - value
		end
		--mana.hud_update(playername)
		return true, missing
	else
		return false
	end
end





--[===[
	File handling, loading data, saving data, setting up stuff for players.
]===]


-- Load the playerlist from a previous session, if available.
do
	local filepath = minetest.get_worldpath().."/mana.mt"
	local file = io.open(filepath, "r")
	if file then
		minetest.log("action", "[mana] mana.mt opened.")
		local string = file:read()
		io.close(file)
		if(string ~= nil) then
			local savetable = minetest.deserialize(string)
			mana.playerlist = savetable.playerlist
			minetest.debug("[mana] mana.mt successfully read.")
		end
	end
end

function mana.save_to_file()
	local savetable = {}
	savetable.playerlist = mana.playerlist

	local savestring = minetest.serialize(savetable)

	local filepath = minetest.get_worldpath().."/mana.mt"
	local file = io.open(filepath, "w")
	if file then
		file:write(savestring)
		io.close(file)
		minetest.log("action", "[mana] Wrote mana data into "..filepath..".")
	else
		minetest.log("error", "[mana] Failed to write mana data into "..filepath..".")
	end
end


minetest.register_on_respawnplayer(function(player)
	local playername = player:get_player_name()
	mana.set(playername, 0)
	--mana.hud_update(playername)
end)


minetest.register_on_leaveplayer(function(player)
	local playername = player:get_player_name()
	if not minetest.get_modpath("hudbars") ~= nil then
		--mana.hud_remove(playername)
	end
	mana.save_to_file()
end)

minetest.register_on_shutdown(function()
	minetest.log("action", "[mana] Server shuts down. Rescuing data into mana.mt")
	mana.save_to_file()
end)
local mana_hud = nil
minetest.register_on_joinplayer(function(player)
	local playername = player:get_player_name()
	
	if mana.playerlist[playername] == nil then
		mana.playerlist[playername] = {}
		mana.playerlist[playername].mana = 0
		mana.playerlist[playername].maxmana = mana.settings.default_max
		mana.playerlist[playername].regen = mana.settings.default_regen
		mana.playerlist[playername].remainder = 0
	end
	mana.setmax(playername, 200)
	player:hud_add({
			hud_elem_type = "statbar",
			position = {x=0.842,y=0.02},
			size = {x=248, y=34},
			text = "hud_mana_bg.png",
			number = 2.1,
			alignment = {x=0,y=1},
			offset = {x=-300, y=-10},
			}
		)
	mana_hud = player:hud_add({
			hud_elem_type = "statbar",
			position = {x=0.847,y=0.02},
			size = {x=24, y=34},
			text = "hud_mana.png",
			number = mana.get(playername)/10,
			alignment = {x=0,y=1},
			offset = {x=-300, y=-10},
			}
		)
end)


--[===[
	Mana regeneration
]===]

mana.regen_timer = 0

minetest.register_globalstep(function(dtime)
	
	for _,player in ipairs(minetest.get_connected_players()) do
	local name = player:get_player_name()
	local num = mana.get(name)/10
	player:hud_change(mana_hud, "mana_hud", num)
	end
	mana.regen_timer = mana.regen_timer + dtime
	if mana.regen_timer >= mana.settings.regen_timer then
		local factor = math.floor(mana.regen_timer / mana.settings.regen_timer)
		local players = minetest.get_connected_players()
		for i=1, #players do
			local name = players[i]:get_player_name()
			if mana.playerlist[name] ~= nil then
				if players[i]:get_hp() > 0 then
					local plus = mana.playerlist[name].regen * factor
					-- Compability check for version <= 1.0.2 which did not have the remainder field
					if mana.playerlist[name].remainder ~= nil then
						plus = plus + mana.playerlist[name].remainder
					end
					local plus_now = math.floor(plus)
					local floor = plus - plus_now
					if plus_now > 0 then
						mana.add_up_to(name, plus_now)
					else
						mana.subtract_up_to(name, math.abs(plus_now))
					end
					mana.playerlist[name].remainder = floor
				end
			end
		end
		mana.regen_timer = mana.regen_timer % mana.settings.regen_timer
	end
end)
--[===[
	Helper functions
]===]
mana.round = function(x)
	return math.ceil(math.floor(x+0.5))
end
