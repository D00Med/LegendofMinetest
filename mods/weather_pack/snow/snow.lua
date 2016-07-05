snow = {}

snow.particles_count = 25

-- calculates coordinates and draw particles for snow weather 
snow.add_rain_particles = function(player, dtime)
  rain.last_rp_count = 0
  for i=snow.particles_count, 1,-1 do
    local random_pos_x, random_pos_y, random_pos_z = get_random_pos_by_player_look_dir(player)
    random_pos_y = math.random() + random_pos(player:getpos().y - 1, player:getpos().y + 7)
    if minetest.get_node_light({x=random_pos_x, y=random_pos_y, z=random_pos_z}, 0.5) == 15 then
      rain.last_rp_count = rain.last_rp_count + 1
      minetest.add_particle({
        pos = {x=random_pos_x, y=random_pos_y, z=random_pos_z},
        velocity = {x = math.random(-1,-0.5), y = math.random(-2,-1), z = math.random(-1,-0.5)},
        acceleration = {x = math.random(-1,-0.5), y=-0.5, z = math.random(-1,-0.5)},
        expirationtime = 0.6,
        size = math.random(0.5, 1),
        collisiondetection = true,
        vertical = true,
        texture = snow.get_texture(),
        playername = player:get_player_name()
      })
    end
  end
end

-- Simple random texture getter
snow.get_texture = function()
  local texture_name
  local random_number = math.random()
  if random_number > 0.5 then
    texture_name = "snow_snowflake1.png"
  else
    texture_name = "snow_snowflake2.png"
  end
  return texture_name;
end

minetest.register_globalstep(function(dtime)
  if weather.state ~= "snow" then 
    return false
  end
  
  for _, player in ipairs(minetest.get_connected_players()) do
    if (is_underwater(player)) then 
      return false
    end
    snow.add_rain_particles(player, dtime)
  end
end)

-- register snow weather
if weather.reg_weathers.snow == nil then
  weather.reg_weathers.snow = {
    chance = 10,
    clear = function() end
  }
end
