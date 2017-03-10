--edit of skybox extended by emperor_genshin
--license of code WTFPL
--Credits: Kudos to Amaz for helping add a check timer code and paramat for reviewing the code.
--Version 0.2

local twilightsky = {
"sky_pos_y.png",
"sky_neg_y.png",
"sky_pos_z.png",
"sky_neg_z.png",
"sky_neg_x.png",
"sky_pos_x.png",
}

if minetest.setting_getbool("twilight") then
twilight_mode = true
else
twilight_mode = false
end

if minetest.setting_getbool("twilight") then
--Vignette overlay from Vignette mod by TriBlade9(license MIT)

minetest.register_on_joinplayer(function(player)
	weather.state = "twilight"
	minetest.after(0,function()
		player:override_day_night_ratio(0.41)
	end)
	player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "twilight_hud.png"
  })
end)
end

minetest.register_on_joinplayer(function(player)
local name = player:get_player_name()
   if minetest.setting_getbool("twilight") then
   player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
   player:set_sky({}, "skybox", twilightsky) -- Sets skybox
   --If the player is on Earth
   else
   player:set_physics_override(1, 1, 1) -- speed, jump, gravity [default]
   minetest.after(0.1, function()
   player:set_sky({}, "regular", {}) -- Sets skybox, in this case it sets the skybox to it's default setting if and only if the player's Y value is less than the value of space.
   end)
   end
   end)

minetest.register_on_leaveplayer(function(player)
local name = player:get_player_name()
   
   if name then
   player:set_sky({}, "regular", {})

         end
            end)

			
--weather, see weather pack

twilight = {}

twilight.particles_count = 25

-- calculates coordinates and draw particles for twilight weather 
twilight.add_rain_particles = function(player, dtime)
  rain.last_rp_count = 0
  for i=twilight.particles_count, 1,-1 do
    local random_pos_x, random_pos_y, random_pos_z = weather.get_random_pos_by_player_look_dir(player)
    random_pos_y = math.random() + math.random(player:getpos().y - 1, player:getpos().y + 7)
    if minetest.get_node_light({x=random_pos_x, y=random_pos_y, z=random_pos_z}, 0.5) == 15 then
      rain.last_rp_count = rain.last_rp_count + 1
      minetest.add_particle({
        pos = {x=random_pos_x, y=random_pos_y, z=random_pos_z},
        velocity = {x = math.random(-0.1,0.1), y = math.random(0.1,0.1), z = math.random(-0.1,0.1)},
        acceleration = {x = math.random(-0.1,0.1), y=0.1, z = math.random(-0.1,0.1)},
        expirationtime = 0.6,
        size = math.random(0.5, 1),
        collisiondetection = true,
        vertical = true,
        texture = twilight.get_texture(),
        playername = player:get_player_name()
      })
    end
  end
end



-- Simple random texture getter
twilight.get_texture = function()
  local texture_name
  local random_number = math.random()
  if random_number > 0.5 then
    texture_name = "twilight_twilight1.png"
  else
    texture_name = "twilight_twilight2.png"
  end
  return texture_name;
end

minetest.register_globalstep(function(dtime)
  if weather.state ~= "twilight" then 
    return false
  end
  
  for _, player in ipairs(minetest.get_connected_players()) do
    if (weather.is_underwater(player)) then 
      return false
    end
    twilight.add_rain_particles(player, dtime)
  end
end)

-- register twilight weather
if weather.reg_weathers.twilight == nil then
  weather.reg_weathers.twilight = {
    chance = 10,
    clear = function() end
  }
end

twilight_mode = false
--[[
default.player_register_model("wolfplayer.b3d", {
	animation_speed = 20,
	textures = {"wolfplayer.png"},
	animations = {
		-- Standard animations.
		stand     = { x=  0, y= 9, },
		lay       = { x=46, y=46, },
		walk      = { x=28, y=44, },
		mine      = { x=11, y=26, },
		walk_mine = { x=11, y=26, },
		swing     = { x= 223, y=239, },
		-- Extra animations (not currently used by the game).
		sit       = { x= 47, y=47, },
	},
})

local models = default.registered_player_models
model = false
--]]
local hud_changed = false
local glow = nil

minetest.register_globalstep(function(dtime)
if twilight_mode == true then 
	weather.state = "twilight"
	for _, player in ipairs(minetest.get_connected_players()) do
	player:set_sky({}, "skybox", twilightsky) -- Sets skybox
	player:override_day_night_ratio(0.41)
			local pname = player:get_player_name();
	local inv = minetest.get_inventory({type="player", name=pname});
			if inv:contains_item("main", "hyruletools:sword") then
			local remov = inv:remove_item("main", "hyruletools:sword")
			local add = inv:add_item("main", "hyruletools:sword_light")
	end
	if hud_changed == false then
	glow = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "twilight_hud.png"
  })
	hud_changed = true
	--player:set_properties({mesh = "wolfplayer.b3d", textures = {"wolfplayer.png"}})
	--player:set_eye_offset({x=0,y=0,z=0}, {x=0,y=3,z=-3})
	--player:set_local_animation({x=0, y=9}, {x=28, y=44}, {x=11, y=26}, {x=11, y=26}, 20)
	--player:set_physics_override({

	--	speed = 1.6, -- multiplier to default value
	--	jump = 1.6, -- multiplier to default value
	--	gravity = 1.0, -- multiplier to default value
	--	sneak = true, -- whether player can sneak
	--	sneak_glitch = false, -- whether player can use the sneak glitch 

	--	})
	end
end
else
	for _, player in ipairs(minetest.get_connected_players()) do
	if weather.state == "twilight" then
	player:set_sky({}, "regular", {}) -- Sets skybox
	player:override_day_night_ratio(nil)
	weather.state = "none"
	end
			local pname = player:get_player_name();
	local inv = minetest.get_inventory({type="player", name=pname});
			if inv:contains_item("main", "hyruletools:sword_light") then
			local remov = inv:remove_item("main", "hyruletools:sword_light")
			local add = inv:add_item("main", "hyruletools:sword")
	end
	--[[ model == true then
	model = false
	player:set_properties({mesh = "character.b3d", textures = {"character.png"}})
	player:set_eye_offset({x=0,y=0,z=0}, {x=0,y=10,z=-4})
	player:set_local_animation({x=0, y=79}, {x=168, y=187}, {x=189, y=198}, {x=200, y=219}, 30)
	player:set_physics_override({

		speed = 1, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1.0, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = true, -- whether player can use the sneak glitch

		})
	end--]]
	player:hud_remove(glow)
	hud_changed = false
	end
end
end)

minetest.register_craftitem("twilight:crystal", {
	description = "Shadow crystal",
	inventory_image = "twilight_crystal.png",
	on_use =  function(itemstack, placer)
	if twilight_mode == true then
	twilight_mode = false
	elseif twilight_mode == false then
	twilight_mode = true
	if not midna_spawned then
	local pos = placer:getpos()
	local obj = minetest.env:add_entity({x=pos.x, y=pos.y+2, z=pos.z}, "mobs_loz:midna")
	local midna = obj:get_luaentity()
	midna.owner = placer
	midna.tamed = true
	midna_spawned = true
	end
	return itemstack
	end
	end
})
