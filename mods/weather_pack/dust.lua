dust = {}

dust.particles_count = 25
dust.init_done = false

-- calculates coordinates and draw particles for dust weather 
dust.add_rain_particles = function(player, dtime)
  dust.last_rp_count = 0
  for i=dust.particles_count, 1,-1 do
    local random_pos_x, random_pos_y, random_pos_z = weather.get_random_pos_by_player_look_dir(player)
    random_pos_y = math.random() + math.random(player:getpos().y - 1, player:getpos().y + 7)
    if minetest.get_node_light({x=random_pos_x, y=random_pos_y, z=random_pos_z}, 0.5) >= 10 then
      dust.last_rp_count = dust.last_rp_count + 1
      minetest.add_particle({
        pos = {x=random_pos_x, y=random_pos_y, z=random_pos_z},
        velocity = {x = math.random(-0.2,0.2), y = math.random(0.2,0.3), z = math.random(-0.2,0.2)},
        acceleration = {x = math.random(-0.2,0.2), y=0.2, z = math.random(-0.2,0.2)},
        expirationtime = 0.6,
        size = math.random(0.5, 1),
        collisiondetection = true,
        vertical = true,
        texture = dust.get_texture(),
        playername = player:get_player_name()
      })
    end
  end
end

-- Simple random texture getter
dust.get_texture = function()
  local texture_name
  local random_number = math.random()
  if random_number > 0.5 then
    texture_name = "dust_dust1.png"
  else
    texture_name = "dust_dust2.png"
  end
  return texture_name;
end

dust.set_sky_box = function()
  skycolor.add_layer(
    "weather-pack-dust-sky",
    {{r=137, g=226, b=164},
    {r=137, g=226, b=164},
    {r=0, g=0, b=0}}
  )
  skycolor.active = true
end

dust.clear = function() 
  skycolor.remove_layer("weather-pack-dust-sky")
  dust.init_done = false
end

minetest.register_globalstep(function(dtime)
  if weather.state ~= "dust" then 
    return false
  end
  
  if dust.init_done == false then
    dust.set_sky_box()
    dust.init_done = true
  end
  
  for _, player in ipairs(minetest.get_connected_players()) do
    if (weather.is_underwater(player)) then 
      return false
    end
    dust.add_rain_particles(player, dtime)
  end
end)



-- register dust weather
if weather.reg_weathers.dust == nil then
  weather.reg_weathers.dust = {
    chance = 10,
    clear = dust.clear
  }
end
