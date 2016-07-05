rain = {
  -- max rain particles created at time 
  particles_count = 35,

  -- flag to turn on/off extinguish fire for rain 
  extinguish_fire = true,
  
  -- flag useful when mixing weathers
  raining = false,
}

rain.sound_handler = function(player) 
  return minetest.sound_play("weather_rain", {
    object = player,
    max_hear_distance = 2,
    loop = true,
  })
end

-- set skybox based on time (darker if night lighter otherwise)
rain.set_sky_box = function(player)
  if (minetest.get_timeofday() < 0.8) then
    player:set_sky({r=65, g=80, b=100}, "plain", nil)
  else
    player:set_sky({r=10, g=10, b=15}, "plain", nil)
  end
end

-- creating manually parctiles instead of particles spawner because of easier to control
-- spawn position.
rain.add_rain_particles = function(player, dtime)
  rain.last_rp_count = 0
  for i=rain.particles_count, 1,-1 do
    local random_pos_x, random_pos_y, random_pos_z = get_random_pos_by_player_look_dir(player)
    if minetest.get_node_light({x=random_pos_x, y=random_pos_y, z=random_pos_z}, 0.5) == 15 then
      rain.last_rp_count = rain.last_rp_count + 1
      minetest.add_particle({
        pos = {x=random_pos_x, y=random_pos_y, z=random_pos_z},
        velocity = {x=0, y=-10, z=0},
        acceleration = {x=0, y=-30, z=0},
        expirationtime = 0.3,
        size = math.random(0.5, 3),
        collisiondetection = true,
        vertical = true,
        texture = rain.get_texture(),
        playername = player:get_player_name()
      })
    end
  end
end

-- Simple random texture getter
rain.get_texture = function()
  local texture_name
  local random_number = math.random()
  if random_number > 0.33 then
    texture_name = "rain_raindrop_1.png"
  elseif random_number > 0.66 then
    texture_name = "rain_raindrop_2.png"
  else
    texture_name = "rain_raindrop_3.png"
  end
  return texture_name;
end

-- register player for rain weather. 
-- basically needs for origin sky reference and rain sound controls.
rain.add_player = function(player)
  if weather.players[player:get_player_name()] == nil then
    local player_meta = {}
    player_meta.origin_sky = {player:get_sky()}
    rain.set_sky_box(player)
    weather.players[player:get_player_name()] = player_meta
  end
end

-- remove player from player list effected by rain.
-- be sure to remove sound before removing player otherwise soundhandler reference will be lost.
rain.remove_player = function(player)
  local player_meta = weather.players[player:get_player_name()]
  if player_meta ~= nil and player_meta.origin_sky ~= nil then
    player:set_sky(player_meta.origin_sky[1], player_meta.origin_sky[2], player_meta.origin_sky[3])
    weather.players[player:get_player_name()] = nil
  end
end

-- adds and removes rain sound depending how much rain particles around player currently exist.
-- have few seconds delay before each check to avoid on/off sound too often 
-- when player stay on 'edge' where sound should play and stop depending from random raindrop appearance.
rain.update_sound = function(player)
  local player_meta = weather.players[player:get_player_name()]
  if player_meta ~= nil then
    if player_meta.sound_updated ~= nil and player_meta.sound_updated + 5 > os.time() then
      return false
    end
  
    if player_meta.sound_handler ~= nil then
      if rain.last_rp_count == 0 then
        minetest.sound_stop(player_meta.sound_handler)
        player_meta.sound_handler = nil
      end
    elseif rain.last_rp_count > 0 then
      player_meta.sound_handler = rain.sound_handler(player)      
    end
    
    player_meta.sound_updated = os.time()
  end
end

-- rain sound removed from player.
rain.remove_sound = function(player)
  local player_meta = weather.players[player:get_player_name()]
  if player_meta ~= nil and player_meta.sound_handler ~= nil then
    minetest.sound_stop(player_meta.sound_handler)
    player_meta.sound_handler = nil
  end
end

-- callback function for removing rain
rain.clear = function() 
  rain.raining = false
  for _, player in ipairs(minetest.get_connected_players()) do
    rain.remove_sound(player)
    rain.remove_player(player)
  end
end

minetest.register_globalstep(function(dtime)
  if weather.state ~= "rain" then 
    return false
  end
  
  rain.make_weather()
end)

rain.make_weather = function()
  rain.raining = true
  for _, player in ipairs(minetest.get_connected_players()) do
    if (is_underwater(player)) then 
      return false
    end
    rain.add_player(player)
    rain.add_rain_particles(player, dtime)
    rain.update_sound(player)
  end
end

if weather.reg_weathers.rain == nil then
  weather.reg_weathers.rain = {
    chance = 15,
    clear = rain.clear
  }
end

-- ABM for extinguish fire
if weather.allow_abm then
  minetest.register_abm({
    nodenames = {"fire:basic_flame"},
    interval = 4.0,
    chance = 2,
    action = function(pos, node, active_object_count, active_object_count_wider)
      if rain.raining and rain.extinguish_fire then
        if weather.is_outdoor(pos) then
          minetest.remove_node(pos)
        end
      end
    end
  })
end