if minetest.setting_get("enable_weather") then
local weathers = {
	{"snow", "rain", "storm", "pollen", "dust", "insects", "none"},
}

local nodes = {
	{{"default:snow", "default:snowblock"}, nil, nil, {"default:dirt"}, {"default:desert_sand"}, {"group:flower", "moreplants:tallgrass"}, nil}
}

hyrule_weather = {}

minetest.register_node("hyrule_weather:ice", {
	description = "ice sheet",
	tiles = {
		"hyrule_weather_ice.png",
	},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox1
		}
	},
	drop = "",
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
})

local apply_weather = function(player, pos, weather_type)
	if weather_type == nil then return end
	--weather effects
	if weather_type == "snow" then
		if minetest.get_timeofday()*24000 >= 6000 and minetest.get_timeofday()*24000 <= 19000 then
		player:set_sky({r=208, g=223, b=238}, "plain", nil, true)
		end
		for i=1,8 do
		minetest.add_particle({
			pos = {x=pos.x+math.random(-10,10), y=pos.y+math.random(12,17), z=pos.z+math.random(-10,10)},
			velocity = {x=math.random(-5,5)/10, y=math.random(-4,-6), z=math.random(-5,5)/10},
			acceleration = {x=math.random(-1,1)/10, y=math.random(-5,-10)/10, z=math.random(-1,1)/10},
			expirationtime = 3,
			size = math.random(3,5),
			collisiondetection = true,
			collision_removal = true,
			vertical = false,
			texture = "hyrule_weather_snow_"..math.random(1,2)..".png",
			glow = 0
		})
		minetest.add_particle({
			pos = {x=pos.x+math.random(-10,10), y=pos.y+math.random(12,17), z=pos.z+math.random(-10,10)},
			velocity = {x=math.random(-5,5)/10, y=math.random(-4,-6), z=math.random(-5,5)/10},
			acceleration = {x=math.random(-1,1)/10, y=math.random(-5,-10)/10, z=math.random(-1,1)/10},
			expirationtime = 3,
			size = math.random(3,5),
			collisiondetection = true,
			collision_removal = true,
			vertical = false,
			texture = "hyrule_weather_snow_"..math.random(1,2)..".png",
			glow = 0
		})
		local water = minetest.find_node_near({x=pos.x+math.random(-7,7), y=pos.y+math.random(-4,4), z=pos.z+math.random(-7,7)}, 10, {"default:water_source", "default:river_water_source"}, true)
		if not water then return end
		water.y =  water.y+1
		if minetest.get_node(water).name == "air" then
			minetest.set_node(water, {name="hyrule_weather:ice"})
			if math.random(1,2) == 2 then
				minetest.sound_play("freeze", {pos=water, gain=1.2,  max_hear_distance = 5, loop=false})
			end
		end
		end
	elseif weather_type == "rain" then
		if minetest.get_timeofday()*24000 >= 6000 and minetest.get_timeofday()*24000 <= 19000 then
		player:set_sky({r=177, g=177, b=177}, "plain", nil, true)
		end
		for i=1,24 do
		minetest.after((math.random(1,10)/10), function(dtime)
		minetest.add_particle({
			pos = {x=pos.x+math.random(-10,10), y=pos.y+math.random(12,17), z=pos.z+math.random(-10,10)},
			velocity = {x=0, y=math.random(-15,-20), z=0},
			acceleration = {x=0, y=-1, z=0},
			expirationtime = 2,
			size = math.random(3,5),
			collisiondetection = true,
			collision_removal = true,
			vertical = true,
			texture = "hyrule_weather_rain_"..math.random(1,2)..".png",
			glow = 0
		})
		end)
		end
	elseif weather_type == "storm" then
		if minetest.get_timeofday()*24000 >= 6000 and minetest.get_timeofday()*24000 <= 19000 then
		player:set_sky({r=101, g=101, b=101}, "plain", nil, true)
		end
		for i=1,30 do
		minetest.after((math.random(1,10)/10), function(dtime)
		minetest.add_particle({
			pos = {x=pos.x+math.random(-10,10), y=pos.y+math.random(12,17), z=pos.z+math.random(-10,10)},
			velocity = {x=0, y=math.random(-30,-25), z=0},
			acceleration = {x=0, y=-1, z=0},
			expirationtime = 2,
			size = math.random(3,5),
			collisiondetection = true,
			collision_removal = true,
			vertical = true,
			texture = "hyrule_weather_rain_3.png",
			glow = 0
		})
		end)
		if math.random(1,2000) == 1 then
			lightning.strike()
		end
		end
	elseif weather_type == "pollen" then
		if minetest.get_timeofday()*24000 >= 6000 and minetest.get_timeofday()*24000 <= 19000 then
		player:set_sky({r=158, g=220, b=119}, "plain", nil, true)
		end
		for i=1,12 do
		minetest.add_particle({
			pos = {x=pos.x+math.random(-5,5), y=pos.y+math.random(0,5), z=pos.z+math.random(-5,5)},
			velocity = {x = math.random(-2,2)/10, y = math.random(2,3)/10, z = math.random(-2,2)/10},
			acceleration = {x = math.random(-2,2)/10, y=0.2, z = math.random(-2,2)/10},
			expirationtime = 0.6,
			size = math.random(12,15)/10,
			collisiondetection = true,
			collision_removal = true,
			vertical = false,
			texture = "hyrule_weather_pollen_"..math.random(1,2)..".png",
			glow = 5
		})
		end
	elseif weather_type == "dust" then
		if minetest.get_timeofday()*24000 >= 6000 and minetest.get_timeofday()*24000 <= 19000 then
		player:set_sky({r=215, g=156, b=91}, "plain", nil, true)
		end
		for i=1,12 do
		minetest.add_particle({
			pos = {x=pos.x+math.random(-10,10), y=pos.y+math.random(1,3)/10, z=pos.z+math.random(-10,10)},
			velocity = {x=1, y=math.random(1,2), z=1},
			acceleration = {x=4, y=math.random(2,3)/10, z=4},
			expirationtime = 0.5,
			size = math.random(3,5),
			collisiondetection = true,
			collision_removal = true,
			vertical = false,
			texture = "hyrule_weather_dust_1.png",
			glow = 0
		})
		end
	elseif weather_type == "insects" then
		player:set_sky(nil, "regular", nil, true)
	elseif weather_type == "none" then
		player:set_sky(nil, "regular", nil, true)
		return 
	end
end

minetest.register_on_joinplayer(function()
	if math.random(1,500) == 1 then
		for _, row in ipairs(weathers) do
			local num = math.random(1,7)
			hyrule_weather.current = num
			hyrule_weather.weather = row[num]
		end
	end
end)

local sound_ready = true

minetest.register_globalstep(function(dtime)
	if math.random(1,4) ~= 4 or hyrule_weather.weather == "twilight" then return end
	--select random weather (serverwide)
	if math.random(1,5000) == 1 then
		for _, row in ipairs(weathers) do
			local num = math.random(1,7)
			hyrule_weather.current = num
			hyrule_weather.weather = row[num]
		end
	end
	if minetest.get_day_count() <= 2 then
		hyrule_weather.current = 3
		hyrule_weather.weather = "storm"
	end
	--player specific
	for _, player in ipairs(minetest.get_connected_players()) do
		local pos = player:getpos()
		--check if weather should occur at current location
		local display_weather = false
		for _, row in ipairs(nodes) do
			if row[hyrule_weather.current] ~= nil and minetest.find_node_near(pos, 5, row[hyrule_weather.current]) then
				display_weather = true
			elseif row[hyrule_weather.current] == nil then
				display_weather = true
			else 
				display_weather = false
			end
		end
		if pos.y <= -20 then display_weather = false end
		--apply weather effect
		if display_weather then
			apply_weather(player, pos, hyrule_weather.weather)
			if sound_ready and hyrule_weather.weather ~= nil then 
				local weather_name = hyrule_weather.weather
				local plyr = player:get_player_name()
				minetest.sound_play(weather_name, {to_player=plyr, gain=1.5,  max_hear_distance = 3, loop=false})
				sound_ready = false
				minetest.after(33, function()
					sound_ready = true
				end)
			end
		else
			apply_weather(player, pos, "none")
		end
	end
end)


minetest.register_privilege("weather", {
  description = "Allows control of weather",
  give_to_singleplayer = false
})

minetest.register_chatcommand("change_weather", {
	params = "<weather_type>",
	description = "Sets weather to the given type",
	privs = {weather = true},
	func = function(name, param)
		hyrule_weather.weather = param
		for _, row in ipairs(weathers) do
			for i=1,7 do
				if row[i] == param then
					hyrule_weather.current = i
				end
			end
		end
	end,
})
end
