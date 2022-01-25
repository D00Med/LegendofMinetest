if minetest.setting_getbool("loz_mode") then

--hud (rupee counter)
--
local count = 0
local count2 = 0
local count3 = 0
local counter1 = nil
local counter2 = nil
local counter3 = nil

local players = {}

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	players[name] = true
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	players[name] = nil
end)

--[[
minetest.register_on_player_inventory_action(function(player, inventory, action, inventory_info)
	if action == "put" then
		minetest.sound_play("put", {to_player=player:get_player_name(), gain=1.2, loop=false})
	elseif action == "take" then
		minetest.sound_play("take", {to_player=player:get_player_name(), gain=1.2, loop=false})
	end
end)]]



minetest.register_entity("hyruletools:gliding_player", {
	visual = "mesh",
	mesh = "character_gliding.b3d",
	textures = {
		"character_gliding.png",
	},
	collisionbox = {-0, -0.5, -0, 0, 1.5, 0},
	physical = true,
	automatic_face_movement_dir = -90.0,
	on_activate = function(self)
		self.object:set_animation({x=33, y=40}, 20, 0)
		minetest.after(0.2, function()
			self.object:set_animation({x=1, y=21}, 10, 0)
		end)
	end,
	on_step = function(self, dtime)
		if dtime <= 0.02 then return end
		if self.player == nil then
		minetest.after(0.2, function()
		self.object:remove()
		end)
		return
		end
		
		local pos = self.object:getpos()
		local player = self.player
		local dir = player:get_look_dir()
		self.object:set_velocity({x=8*dir.x, y=-3, z=8*dir.z})
		
		if default.player_attached[player:get_player_name()] ~= true then
				player:set_properties({visual_size = {x=1, y=1}})
				player:set_eye_offset({x=0,y=0,z=0},{x=3,y=3,z=-1})
				default.player_attached[player:get_player_name()] = false
				player:set_detach()
			self.player = nil
			return
		elseif not player:get_player_control().aux1 then
			self.object:set_animation({x=40, y=47}, 20, 0)
			minetest.after(0.2, function()
				player:set_properties({visual_size = {x=1, y=1}})
				player:set_eye_offset({x=0,y=0,z=0},{x=3,y=3,z=-1})
				default.player_attached[player:get_player_name()] = false
				player:set_detach()
			end)
			self.player = nil
			return
		elseif player:get_wielded_item():get_name() ~= "hyruletools:paraglider" then
			self.object:set_animation({x=40, y=47}, 20, 0)
			minetest.after(0.2, function()
				player:set_properties({visual_size = {x=1, y=1}})
				player:set_eye_offset({x=0,y=0,z=0},{x=3,y=3,z=-1})
				default.player_attached[player:get_player_name()] = false
				player:set_detach()
			end)
			self.player = nil
			return
		elseif minetest.get_node({x=pos.x,y=pos.y-2,z=pos.z}).name ~= "air" then
			self.object:set_animation({x=40, y=47}, 20, 0)
			minetest.after(0.2, function()
				player:set_properties({visual_size = {x=1, y=1}})
				player:set_eye_offset({x=0,y=0,z=0},{x=3,y=3,z=-1})
				default.player_attached[player:get_player_name()] = false
				player:set_detach()
			end)
			self.player = nil
			return
		end
	end,
})

minetest.register_entity("hyruletools:sailing_player", {
	visual = "mesh",
	mesh = "character_gliding.b3d",
	textures = {
		"character_sailing.png",
	},
	collisionbox = {-0, -0.5, -0, 0, 1.5, 0},
	physical = true,
	automatic_face_movement_dir = -90.0,
	on_activate = function(self)
		self.object:set_animation({x=33, y=40}, 20, 0)
		minetest.after(0.2, function()
			self.object:set_animation({x=1, y=21}, 10, 0)
		end)
	end,
	on_step = function(self, dtime)
		if dtime <= 0.02 then return end
		if self.player == nil then
		minetest.after(0.2, function()
		self.object:remove()
		end)
		return
		end
		local player = self.player
		local velo = self.object:getvelocity()
		local dir = player:get_look_dir()
		local pos = self.object:getpos()
		
		self.object:set_velocity({x=2*dir.x, y=-9.8+velo.y*0.2, z=2*dir.z})
		if	default.player_attached[player:get_player_name()] ~= true then
				player:set_properties({visual_size = {x=1, y=1}})
				player:set_eye_offset({x=0,y=0,z=0},{x=3,y=3,z=-1})
				default.player_attached[player:get_player_name()] = false
				player:set_detach()
			self.player = nil
			return
		elseif not player:get_player_control().aux1 then
			self.object:set_animation({x=40, y=47}, 20, 0)
			minetest.after(0.2, function()
				player:set_properties({visual_size = {x=1, y=1}})
				player:set_eye_offset({x=0,y=0,z=0},{x=3,y=3,z=-1})
				default.player_attached[player:get_player_name()] = false
				player:set_detach()
			end)
			self.player = nil
			return
		elseif player:get_wielded_item():get_name() ~= "hyruletools:sail" then
			self.object:set_animation({x=40, y=47}, 20, 0)
			minetest.after(0.2, function()
				player:set_properties({visual_size = {x=1, y=1}})
				player:set_eye_offset({x=0,y=0,z=0},{x=3,y=3,z=-1})
				default.player_attached[player:get_player_name()] = false
				player:set_detach()
			end)
			self.player = nil
			return
		elseif minetest.get_node({x=pos.x,y=pos.y-2,z=pos.z}).name ~= "air" then
			self.object:set_animation({x=40, y=47}, 20, 0)
			minetest.after(0.2, function()
				player:set_properties({visual_size = {x=1, y=1}})
				player:set_eye_offset({x=0,y=0,z=0},{x=3,y=3,z=-1})
				default.player_attached[player:get_player_name()] = false
				player:set_detach()
			end)
			self.player = nil
			return
		end
	end,
})

minetest.register_tool("hyruletools:sail", {
	description = "Sail Cloth",
	inventory_image = "hyruletools_sail.png",
})

minetest.register_tool("hyruletools:paraglider", {
	description = "Paraglider",
	inventory_image = "hyruletools_paraglider.png",
})


minetest.register_globalstep(function(dtime)
	if dtime <= 0.02 then return end
	for name, _ in pairs(players) do
		local player = minetest.get_player_by_name(name)
		
		--bubbles
		if math.random(1,10) == 1 then
		local pos = player:getpos()
		local water = minetest.find_node_near({x=pos.x+math.random(-7,7), y=pos.y+math.random(-10,-7), z=pos.z+math.random(-7,7)}, 5, {"default:water_source",}, true)
		if water and minetest.get_node({x=water.x, y=water.y+6, z=water.z}).name == "default:water_source" then
		minetest.add_particle({
			pos = {x=water.x, y=water.y, z=water.z},
			velocity = {x=math.random(-5,5)/10, y=math.random(3,5), z=math.random(-5,5)/10},
			acceleration = {x=math.random(-1,1)/10, y=math.random(-10,-5)/10, z=math.random(-1,1)/10},
			expirationtime = 2,
			size = math.random(3,5),
			collisiondetection = true,
			collision_removal = true,
			vertical = false,
			texture = "bubble.png",
			glow = 5
		})
		local water2 = minetest.find_node_near({x=pos.x+math.random(-7,7), y=pos.y+math.random(-10,-7), z=pos.z+math.random(-7,7)}, 5, {"default:water_source", "default:river_water_source"}, true)
		if not water2 then return end
		minetest.add_particle({
			pos = {x=water2.x, y=water2.y, z=water2.z},
			velocity = {x=math.random(-5,5)/10, y=math.random(3,5), z=math.random(-5,5)/10},
			acceleration = {x=math.random(-1,1)/10, y=math.random(-10,-5)/10, z=math.random(-1,1)/10},
			expirationtime = 2,
			size = math.random(3,5),
			collisiondetection = true,
			collision_removal = true,
			vertical = false,
			texture = "bubble.png",
			glow = 5
		})
		end
		end
		
		if player:get_wielded_item():get_name() == "hyruletools:sail" then
			if player:get_player_control().aux1 then
			local item = player:get_wielded_item()
			item:add_wear(1)
			player:set_wielded_item(item)
			local pos = player:getpos()
			if player:get_attach() == nil and default.player_attached[player:get_player_name()] ~= true and minetest.get_node({x=pos.x,y=pos.y-2,z=pos.z}).name == "air" then
				local obj = minetest.env:add_entity({x=pos.x, y=pos.y+2, z=pos.z}, "hyruletools:sailing_player")
				local sail = obj:get_luaentity()
				if sail ~= nil then
				sail.player = player
				player:set_attach(sail.object, "head", {x=0,y=0,x=0}, {x=0,y=0,z=0})
				player:set_eye_offset({x=0,y=-5.5,z=2},{x=3,y=-3,z=-1})
				default.player_attached[player:get_player_name()] = true
				player:set_properties({visual_size = {x=0, y=0}})
				end
			end
		end
		end
		if player:get_wielded_item():get_name() == "hyruletools:paraglider" then
			if player:get_player_control().aux1 then
			local item = player:get_wielded_item()
			item:add_wear(1)
			player:set_wielded_item(item)
			local pos = player:getpos()
			if player:get_attach() == nil and default.player_attached[player:get_player_name()] ~= true and minetest.get_node({x=pos.x,y=pos.y-2,z=pos.z}).name == "air" then
				local obj = minetest.env:add_entity({x=pos.x, y=pos.y+2, z=pos.z}, "hyruletools:gliding_player")
				local glider = obj:get_luaentity()
				if glider ~= nil then
				glider.player = player
				player:set_attach(glider.object, "head", {x=0,y=0,x=0}, {x=0,y=0,z=0})
				player:set_eye_offset({x=0,y=-5.5,z=2},{x=3,y=-3,z=-1})
				default.player_attached[player:get_player_name()] = true
				player:set_properties({visual_size = {x=0, y=0}})
				end
			end
		end
		end
		if player:get_wielded_item():get_name() == "hyruletools:climbing_gloves" then
			local pos = player:getpos()
			local item = player:get_wielded_item()
			item:add_wear(5)
			player:set_wielded_item(item)
			local climbable = minetest.find_node_near(pos, 1, {"default:stone", "default:obsidian", "default:sandstone", "default:ice", "default:desert_stone", "default:cobble", "default:desert_cobblestone"})
			if climbable and minetest.get_node(pos).name == "air" then
				minetest.set_node(pos, {name="hyruletools:climbable"})
			end
			for i=1,2 do
			local remove_node = minetest.find_node_near(pos, 1, {"hyruletools:climbable"})
			if remove_node then
				minetest.remove_node(remove_node)
			end
			end
		elseif player:get_wielded_item():get_name() == "hyruletools:lantern" then
			local pos = player:getpos()
			pos.y = pos.y+1
			if minetest.get_node(pos).name == "air" then
			local item = player:get_wielded_item()
			item:add_wear(25)
			player:set_wielded_item(item)
				minetest.set_node(pos, {name="hyruletools:light"})
			end
			for i=1,2 do
			local remove_node = minetest.find_node_near(pos, 1, {"hyruletools:light"}, false)
			if remove_node then
				minetest.remove_node(remove_node)
			end
			end
		end
	end
	for _,player in ipairs(minetest.get_connected_players()) do
		if player:get_player_name() ~= "singleplayer" then return end
		count = 0
		count2 = 0
		count3 = 0
		local number = 0
		local number2 = 0
		local number3 = 0
		local playername = player:get_player_name()
		local inv = minetest.get_inventory({type="player", name=playername});
		for num=1,32,1 do
		local stack = inv:get_stack("main", num)
		if stack:get_name() == "hyruletools:green_rupee" then
			number = stack:get_count()
			count = count+number
		end
		if stack:get_name() == "hyruletools:blue_rupee" then
			number = stack:get_count()
			count = count+number*2
		end
		if stack:get_name() == "hyruletools:red_rupee" then
			number = stack:get_count()
			count = count+number*3
		end
		if stack:get_name() == "tnt:tnt" then
			number2 = stack:get_count()
			count2 = count2+number2
		end
		if stack:get_name() == "hyruletools:key" then
			number3 = stack:get_count()
			count3 = count3+number3
		end
		if stack:get_name() == "loot:key" then
			number3 = stack:get_count()
			count3 = count3+number3
		end
		if stack:get_name() == "hyruletools:retro_key" then
			number3 = stack:get_count()
			count3 = count3+number3
		end
		if stack:get_name() == "hyruletools:key_boss" then
			number3 = stack:get_count()
			count3 = count3+number3
		end
		end
		player:hud_change(counter1, "text", count)
		player:hud_change(counter2, "text", count2)
		player:hud_change(counter3, "text", count3)
		return count
		end
end)

minetest.register_on_joinplayer(function(player)
if player:get_player_name() ~= "singleplayer" then
return
end
local rupee = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.05, y = 0.9},
    scale = {
      x = 3,
      y = 3
    },
    text = "hyruletools_green_rupee.png"
	})
	
local bomb = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.05, y = 0.825},
    scale = {
      x = 3,
      y = 3
    },
    text = "hyruletools_bombico.png"
	})
local key = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.05, y = 0.75},
    scale = {
      x = 3,
      y = 3
    },
    text = "hyruletools_key.png"
	})
	
local text1 = player:hud_add({
    hud_elem_type = "text",
    position = {x = 0.075, y = 0.825},
    scale = {
      x = 3,
      y = 3
    },
    text = "x ",
	number = 0xFFFFFF
	})
	
local text1 = player:hud_add({
    hud_elem_type = "text",
    position = {x = 0.075, y = 0.9},
    scale = {
      x = 3,
      y = 3
    },
    text = "x ",
	number = 0xFFFFFF
	})
local text1 = player:hud_add({
    hud_elem_type = "text",
    position = {x = 0.075, y = 0.75},
    scale = {
      x = 3,
      y = 3
    },
    text = "x ",
	number = 0xFFFFFF
	})
counter1 = player:hud_add({
    hud_elem_type = "text",
    position = {x = 0.09, y = 0.9},
    scale = {
      x = 3,
      y = 3
    },
    text = count,
	number = 0xFFFFFF
	})
counter2 = player:hud_add({
    hud_elem_type = "text",
    position = {x = 0.09, y = 0.825},
    scale = {
      x = 3,
      y = 3
    },
    text = count2,
	number = 0xFFFFFF
	})
counter3 = player:hud_add({
    hud_elem_type = "text",
    position = {x = 0.09, y = 0.75},
    scale = {
      x = 3,
      y = 3
    },
    text = count3,
	number = 0xFFFFFF
	})
end)

--player effects

playereffects.register_effect_type("potion_speed_lv1", "High speed", nil, {"speed"}, 
	function(player)
		player:set_physics_override(3,nil,nil)
		physics_overriden = true
	end,
	
	function(effect, player)
		player:set_physics_override(1,nil,nil)
		physics_overriden = false
	end,
	false
)

playereffects.register_effect_type("potion_antigrav_lvx", "Light weight", nil, {"gravity"}, 
	function(player)
		player:set_physics_override(nil,nil,0.1)
		physics_overriden = true
	end,
	
	function(effect, player)
		player:set_physics_override(nil,nil,1)
		physics_overriden = false
	end,
	false
)

--shields (currently disabled since there is no way to detect if there is 3rd person view or not)
--[[
minetest.register_globalstep(function()
	for _, player in ipairs(minetest.get_connected_players()) do
		local playername = player:get_player_name()
		if not default.player_attached[playername] then
		local inv = minetest.get_inventory({type="player", name=playername});
		if inv:contains_item("armor", "shields:shield_steel") and fr2 == nil or inv:contains_item("armor", "shields:shield_admin") and fr2 == nil or inv:contains_item("armor", "shields:shield_bronze") and fr2 == nil then
			local timeoday = minetest.get_timeofday()
			if timeoday >= 0.35 and timeoday <= 0.85 then
			fr2 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.1, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back.png"
			})
			else
			fr2 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.1, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back.png^[colorize:black:200"
			})
			end
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor+10})
		elseif not inv:contains_item("armor", "shields:shield_steel") and not inv:contains_item("armor", "shields:shield_admin") and not inv:contains_item("armor", "shields:shield_bronze") then
		if fr2 ~= nil then
		player:hud_remove(fr2)
		fr2 = nil
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor-10})
		end
		end
		
		if inv:contains_item("armor", "shields:shield_cactus") and fr1 == nil or inv:contains_item("armor", "shields:shield_cactus_enhanced") and fr1 == nil or inv:contains_item("armor", "shields:shield_wood_enhanced") and fr1 == nil then
			local timeoday = minetest.get_timeofday()
			if timeoday >= 0.25 and timeoday <= 0.75 then
			fr1 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.1, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back_wood.png"
			})
			else
			fr1 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.1, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back_wood.png^[colorize:black:200"
			})
			end
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor+5})
		elseif not inv:contains_item("armor", "shields:shield_cactus") and not inv:contains_item("armor", "shields:shield_cactus_enhanced") and not inv:contains_item("armor", "shields:shield_wood_enhanced") then
		if fr1 ~= nil then
		player:hud_remove(fr1)
		fr1 = nil
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor-5})
		end
		end
		
		if inv:contains_item("armor", "hyruletools:shield_classic") and fr0 == nil then
			local timeoday = minetest.get_timeofday()
			if timeoday >= 0.25 and timeoday <= 0.75 then
			fr0 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.1, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back_classic.png"
			})
			else
			fr0 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.1, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back_classic.png^[colorize:black:200"
			})
			end
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor+10})
		elseif not inv:contains_item("armor", "hyruletools:shield_classic") then
		if fr0 ~= nil then
		player:hud_remove(fr0)
		fr0 = nil
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor-10})
		end
		end
		
		if inv:contains_item("armor", "shields:shield_wood") and fr4 == nil then
			local timeoday = minetest.get_timeofday()
			if timeoday >= 0.25 and timeoday <= 0.75 then
			fr4 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.1, y = 0.9},
			scale = {x = 21,y = 21},
			text = "hyruletools_shield_back_deku.png"
			})
			else
			fr4 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.1, y = 0.9},
			scale = {x = 21,y = 21},
			text = "hyruletools_shield_back_deku.png^[colorize:black:200"
			})
			end
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor+5})
		elseif not inv:contains_item("armor", "shields:shield_wood") then
		if fr4 ~= nil then
		player:hud_remove(fr4)
		fr4 = nil
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor-5})
		end
		end
		end
	end
end)
]]

--added height in 3rd person

minetest.register_on_joinplayer(function(player)
	player:set_eye_offset({x=0,y=0,z=0},{x=3,y=3,z=-1})
	minetest.after(0, player.hud_set_hotbar_itemcount, player, 8)
	player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "hyruletools_vignette.png"
  })
  
  local o1 = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "hyruletools_dark.png"
  })
  
  local o2 = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "hyruletools_dark.png"
  })
  
  local o3 = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "hyruletools_dark.png"
  })
  
  local o4 = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "hyruletools_dark.png"
  })
  
   local o5 = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "hyruletools_dark.png"
  })
  
  local o6 = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "hyruletools_dark.png"
  })
  
  local o7 = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "hyruletools_dark.png"
  })
  
  local o8 = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.5, y = 0.5},
    scale = {
      x = -100,
      y = -100
    },
    text = "hyruletools_dark.png"
  })
  
  minetest.after(1.2, function()
  player:hud_remove(o1)
  end)
  
  
  minetest.after(1.4, function()
  player:hud_remove(o2)
  end)
  
  
  minetest.after(1.8, function()
  player:hud_remove(o3)
  end)
  
  
  minetest.after(2, function()
  player:hud_remove(o4)
  end)
  
  minetest.after(2.2, function()
  player:hud_remove(o5)
  end)
  
  
  minetest.after(2.4, function()
  player:hud_remove(o6)
  end)
  
  
  minetest.after(2.6, function()
  player:hud_remove(o7)
  end)
  
  
  minetest.after(2.8, function()
  player:hud_remove(o8)
  end)
  
end)


--tools

minetest.register_entity("hyruletools:block_dummy", {
	visual = "mesh",
	mesh = "node.b3d",
	textures = {"hyrule_mapgen_magnblock.png"},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	visual_size = {x=3.5, y=3.5},
	physical = true,
	on_step = function(self)
		if self.particles then
			local vec = self.object:getvelocity()
			local apos = self.object:getpos()
			local part = minetest.add_particlespawner(
			5, --amount
			1, --time
			{x=apos.x-0.1, y=apos.y+0.3, z=apos.z-0.1}, --minpos
			{x=apos.x+0.1, y=apos.y+0.4, z=apos.z+0.1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=-vec.x,y=0,z=-vec.z}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			5, --minsize
			9, --maxsize
			false, --collisiondetection
			self.particletex --texture
		)
		end
	end
})

minetest.register_entity("hyruletools:heart_entity", {
	visual = "mesh",
	mesh = "heart.b3d",
	textures = {"hyruletools_heart.png"},
	collisionbox = {-0.1, -0.1, -0.1, 0.1, 0.1, 0.1},
	physical = true,
	visual_size = {x=1.5, y=1.5},
	on_activate = function(self)
		self.object:set_animation({x=2, y=18}, 5, 0)
		self.object:setacceleration({x=0, y=-4, z=0})
	end,
	on_step = function(self)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius(pos, 1)
		for _, obj in pairs(objs) do
			if obj:is_player() then
				local hp = obj:get_hp()
				obj:set_hp(hp+5)
				self.object:remove()
			end
		end
	end,
})

minetest.register_tool("hyruletools:magglv_n", {
	description = "Magnetic Glove (N)",
	inventory_image = "hyruletools_magglv_n.png",
	wield_image = "hyruletools_magglv_n.png",
	on_use = function(itemstack, placer, pointed_thing)
		local ctrl = placer:get_player_control()
		if ctrl.sneak then
		itemstack:replace("hyruletools:magglv_s")
		else
		if pointed_thing.type == "node" then
		local pos = pointed_thing.under
		local dir = placer:get_look_dir()
		if minetest.get_item_group(minetest.get_node(pos).name, "magnetic") ~= 0 and minetest.get_node_or_nil(pos) ~= nil then
		local node = minetest.get_node(pos).name
		minetest.remove_node(pos)
		local obj =  minetest.env:add_entity(pos, "hyruletools:block_dummy")
		obj:setvelocity({x=-dir.x*8, y=-4, z=-dir.z*8})
		obj:setacceleration({x=dir.x*2, y=-5, z=dir.z*2})
		minetest.after(0.5, function()
		local pos2 = obj:getpos()
		obj:remove()
		minetest.set_node(pos2, {name=node})
		end)
		end
		end
		end
		return itemstack
	end,
})

minetest.register_tool("hyruletools:magglv_s", {
	description = "Magnetic Glove (S)",
	inventory_image = "hyruletools_magglv_s.png",
	wield_image = "hyruletools_magglv_s.png",
	on_use = function(itemstack, placer, pointed_thing)
		local ctrl = placer:get_player_control()
		if ctrl.sneak then
		itemstack:replace("hyruletools:magglv_n")
		else
		if pointed_thing.type == "node" then
		local pos = pointed_thing.under
		local dir = placer:get_look_dir()
		if minetest.get_item_group(minetest.get_node(pos).name, "magnetic") ~= 0 and minetest.get_node_or_nil(pos) ~= nil then
		local node = minetest.get_node(pos).name
		minetest.remove_node(pos)
		local obj =  minetest.env:add_entity(pos, "hyruletools:block_dummy")
		obj:setvelocity({x=dir.x*8, y=-4, z=dir.z*8})
		obj:setacceleration({x=-dir.x*2, y=-5, z=-dir.z*2})
		minetest.after(0.5, function()
		local pos2 = obj:getpos()
		obj:remove()
		minetest.set_node(pos2, {name=node})
		end)
		end
		end
		end
		return itemstack
	end,
})


minetest.register_craftitem("hyruletools:dungeon_spawner", {
	description = "Dungeon Spawner",
	inventory_image = "hyruletools_dungeon_spawner.png",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing == nil then return end
		local node = minetest.get_node(pointed_thing.under).name
		local pos = pointed_thing.under
		pos.y = pos.y+1
		if node == "default:dirt_with_dry_grass" then
			minetest.place_schematic(pos, minetest.get_modpath("hyruletools").."/schematics/moldorms_lair.mts", 0, {}, true)
		end
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craftitem("hyruletools:dungeon_spawner2", {
	description = "Advanced Dungeon Spawner",
	inventory_image = "hyruletools_dungeon_spawner2.png",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing == nil then return end
		local node = minetest.get_node(pointed_thing.under).name
		local pos = pointed_thing.under
		pos.y = pos.y+1
		if node == "default:dirt_with_dry_grass" then
			minetest.place_schematic(pos, minetest.get_modpath("hyruletools").."/schematics/moldorms_lair.mts", 0, {}, true)
		end
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_node("hyruletools:beaconb", {
	description = "Beacon (red)",
	drawtype = "glasslike",
	tiles = {"hyruletools_beacon_boxb.png"},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = 5,
	groups = {cracky=1, oddly_breakable_by_hand=1},
	on_construct = function(pos, node, clicker, itemstack)
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
			minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name="hyruletools:beacon_lightb"})
		end
	end,
	on_destruct = function(pos, oldnode)
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "hyruletools:beacon_lightb" then
			minetest.remove_node({x=pos.x, y=pos.y+1, z=pos.z})
		end
	end,
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyruletools:beacon_lightb", {
	description = "Beacon Light",
	tiles = {"hyruletools_beaconb.png"},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	pointable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0.5, 0.3125}, -- NodeBox1
		}
	},
	light_source = 12,
	groups = {cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	walkable = false,
	drop = "",
	on_construct = function(pos, node)
	if pos.y >= 41000 then return end
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
			minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name="hyruletools:beacon_lightb"})
		end
	end,
	on_destruct = function(pos, oldnode)
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "hyruletools:beacon_lightb" then
			minetest.remove_node({x=pos.x, y=pos.y+1, z=pos.z})
		end
	end,
	sounds = default.node_sound_glass_defaults()
})

minetest.register_abm({
	nodenames = {"hyruletools:beaconb"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y+0.1, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 30,
			collisiondetection = false,
			collisionremoval = false,
			vertical = false,
			texture = "hyruletools_beacon_centerb.png",
			animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 0.30},
			glow = 9
		})
	end
})

minetest.register_node("hyruletools:beacon", {
	description = "Beacon (blue)",
	drawtype = "glasslike",
	tiles = {"hyruletools_beacon_box.png"},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = 5,
	groups = {cracky=1, oddly_breakable_by_hand=1},
	on_construct = function(pos, node, clicker, itemstack)
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
			minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name="hyruletools:beacon_light"})
		end
	end,
	on_destruct = function(pos, oldnode)
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "hyruletools:beacon_light" then
			minetest.remove_node({x=pos.x, y=pos.y+1, z=pos.z})
		end
	end,
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyruletools:beacon_light", {
	description = "Beacon Light",
	tiles = {"hyruletools_beacon.png"},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	pointable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0.5, 0.3125}, -- NodeBox1
		}
	},
	light_source = 12,
	groups = {cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	walkable = false,
	drop = "",
	on_construct = function(pos, node)
	if pos.y >= 41000 then return end
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
			minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name="hyruletools:beacon_light"})
		end
	end,
	on_destruct = function(pos, oldnode)
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "hyruletools:beacon_light" then
			minetest.remove_node({x=pos.x, y=pos.y+1, z=pos.z})
		end
	end,
	sounds = default.node_sound_glass_defaults()
})

minetest.register_abm({
	nodenames = {"hyruletools:beacon"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y+0.1, z=pos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 5,
			size = 30,
			collisiondetection = false,
			collisionremoval = false,
			vertical = false,
			texture = "hyruletools_beacon_center.png",
			animation = {type = "vertical_frames", aspect_w = 64, aspect_h = 64, length = 0.30},
			glow = 9
		})
	end
})

minetest.register_craft({
	output = 'hyruletools:beacon',
	recipe = {
		{'default:glass'},
		{'mobs_loz:soul'},
		{'hyruletools:blue_ore'},
	}
})

minetest.register_craft({
	output = 'hyruletools:beaconb',
	recipe = {
		{'default:glass'},
		{'mobs_loz:soul'},
		{'hyruletools:red_ore'},
	}
})

minetest.register_tool("hyruletools:shield_classic", {
	description = "Classic Shield",
	inventory_image = "shields_inv_shield_classic.png",
	wield_image = "3d_armor_trans.png",
	groups = {armor_shield=8, armor_heal=0, armor_use=1000},
	wear = 0,
})

minetest.register_node("hyruletools:shield", {
	description = "Wall Shield",
	drawtype = "signlike",
	tiles = {"hyruletools_swdshld.png"},
	inventory_image = "hyruletools_swdshld.png",
	wield_image = "hyruletools_swdshld.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1}})

minetest.register_craft( {
	output = "hyruletools:shield 1",
	recipe = {
		{ "default:steel_ingot", "", "default:steel_ingot" },
		{ "default:steel_ingot", "", "default:steel_ingot" },
		{ "", "default:sword_steel", "" }
	}
})

minetest.register_node("hyruletools:pot", {
	description = "Pot",
	tiles = {
		"hyruletools_vase_top.png",
		"hyruletools_vase_base.png",
		"hyruletools_vase.png",
		"hyruletools_vase.png",
		"hyruletools_vase.png",
		"hyruletools_vase.png"
	},
	drawtype = "nodebox",
	sounds = default.node_sound_glass_defaults(),
	drop = "",
	paramtype = "light",
	groups = {oddly_breakable_by_hand=1, cracky=1, dig_immediate=3, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.4375, -0.4375, -0.375, 0.4375, 0, 0.375}, -- NodeBox2
			{-0.375, -0.4375, -0.4375, 0.375, 0, 0.4375}, -- NodeBox3
			{-0.375, -0.0625, -0.3125, 0.375, 0.125, 0.3125}, -- NodeBox4
			{-0.3125, 0, -0.375, 0.3125, 0.125, 0.375}, -- NodeBox5
			{-0.25, 0.125, -0.25, 0.25, 0.25, -0.125}, -- NodeBox6
			{-0.25, 0.125, 0.125, 0.25, 0.25, 0.25}, -- NodeBox7
			{0.125, 0.125, -0.25, 0.25, 0.25, 0.25}, -- NodeBox8
			{-0.25, 0.125, -0.25, -0.125, 0.25, 0.25}, -- NodeBox9
			{-0.3125, 0.25, 0.25, 0.3125, 0.3125, 0.3125}, -- NodeBox10
			{-0.3125, 0.25, -0.3125, 0.3125, 0.3125, -0.25}, -- NodeBox11
			{0.25, 0.25, -0.3125, 0.3125, 0.3125, 0.3125}, -- NodeBox12
			{-0.3125, 0.25, -0.3125, -0.25, 0.3125, 0.3125}, -- NodeBox13
		}
	},
	on_destruct = function(pos, oldnode)
		local num = math.random(3,5)
		if num == 5 then
		minetest.env:add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:green_rupee")
		end
		if math.random(1,10) == 5 then
		minetest.env:add_entity(pos, "mobs_fairy:fairy")
		end
	end,
})

minetest.register_node("hyruletools:pot2", {
	description = "Blue Pot",
	tiles = {
		"hyruletools_vase_top2.png",
		"hyruletools_vase_base2.png",
		"hyruletools_vase2.png",
		"hyruletools_vase2.png",
		"hyruletools_vase2.png",
		"hyruletools_vase2.png"
	},
	drawtype = "nodebox",
	sounds = default.node_sound_glass_defaults(),
	drop = "",
	paramtype = "light",
	groups = {oddly_breakable_by_hand=1, cracky=1, dig_immediate=3, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.4375, -0.4375, -0.375, 0.4375, 0, 0.375}, -- NodeBox2
			{-0.375, -0.4375, -0.4375, 0.375, 0, 0.4375}, -- NodeBox3
			{-0.375, -0.0625, -0.3125, 0.375, 0.125, 0.3125}, -- NodeBox4
			{-0.3125, 0, -0.375, 0.3125, 0.125, 0.375}, -- NodeBox5
			{-0.25, 0.125, -0.25, 0.25, 0.25, -0.125}, -- NodeBox6
			{-0.25, 0.125, 0.125, 0.25, 0.25, 0.25}, -- NodeBox7
			{0.125, 0.125, -0.25, 0.25, 0.25, 0.25}, -- NodeBox8
			{-0.25, 0.125, -0.25, -0.125, 0.25, 0.25}, -- NodeBox9
			{-0.3125, 0.25, 0.25, 0.3125, 0.3125, 0.3125}, -- NodeBox10
			{-0.3125, 0.25, -0.3125, 0.3125, 0.3125, -0.25}, -- NodeBox11
			{0.25, 0.25, -0.3125, 0.3125, 0.3125, 0.3125}, -- NodeBox12
			{-0.3125, 0.25, -0.3125, -0.25, 0.3125, 0.3125}, -- NodeBox13
		}
	},
	on_destruct = function(pos, oldnode)
		local num = math.random(3,5)
		if num == 5 then
		minetest.env:add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:green_rupee")
		end
		if math.random(1,10) == 5 then
		minetest.env:add_entity(pos, "mobs_fairy:fairy")
		end
	end,
})

minetest.register_craft( {
	output = "hyruletools:pot 5",
	recipe = {
		{ "default:clay_lump", "", "default:clay_lump" },
		{ "default:clay_lump", "dye:brown", "default:clay_lump" },
		{ "", "default:clay_lump", "" }
	}
})

minetest.register_craft( {
	output = "hyruletools:pot2 5",
	recipe = {
		{ "default:clay_lump", "", "default:clay_lump" },
		{ "default:clay_lump", "dye:cyan", "default:clay_lump" },
		{ "", "default:clay_lump", "" }
	}
})

minetest.register_tool("hyruletools:axe_obsidian", {
	description = "Obsidian Axe",
	inventory_image = "hyruletools_tool_obaxe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_node("hyruletools:magic_powder", {
	description = "Magic Powder",
	inventory_image = "hyruletools_powder.png",
	on_use = function(itemstack, placer, pointed_thing)
		if pointed_thing == nil then return end
			local pos = pointed_thing.above
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=pos.x-1, y=pos.y, z=pos.z-1}, --minpos
			{x=pos.x+1, y=pos.y, z=pos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=2,z=-0.5}, --minacc
			{x=0.5,y=2,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			8, --minsize
			10, --maxsize
			false, --collisiondetection
			"hyruletools_powder3.png" --texture
		)
	end,
	tiles = {
		"hyruletools_powder_top.png",
		"hyruletools_powder_top.png",
		"hyruletools_powder.png",
		"hyruletools_powder.png",
		"hyruletools_powder.png",
		"hyruletools_powder.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, -0.4375, 0.125}, -- NodeBox1
			{-0.25, -0.4375, -0.1875, 0.25, -0.125, 0.1875}, -- NodeBox2
			{-0.1875, -0.4375, -0.25, 0.1875, -0.125, 0.25}, -- NodeBox3
			{-0.125, -0.125, -0.1875, 0.125, -0.0625, 0.1875}, -- NodeBox4
			{-0.1875, -0.125, -0.125, 0.1875, -0.0625, 0.125}, -- NodeBox5
			{-0.125, -0.0625, -0.125, 0.125, 0, 0.125}, -- NodeBox6
			{-0.1875, 0, -0.125, 0.1875, 0.0625, 0.125}, -- NodeBox7
			{-0.125, 0, -0.1875, 0.125, 0.0625, 0.1875}, -- NodeBox8
		}
	},
	groups = {crumbly=1,},
	sounds = default.node_sound_dirt_defaults()
})

minetest.register_craft({
	output = "hyruletools:magic_powder 1",
	recipe = {
		{"hyruletools:ice_fragment", "default:diamond", "hyruletools:ice_fragment"},
		{"default:diamond", "default:mese_crystal", "default:diamond"},
		{"hyruletools:ice_fragment", "default:diamond",  "hyruletools:ice_fragment"}
	}
})

minetest.register_craftitem("hyruletools:heart", {
	description = "Heart",
	inventory_image = "hyruletools_heart.png",
	on_use = function(itemstack, player)
	local health = player:get_hp();
	player:set_hp(health+2)
	itemstack:take_item()
	return itemstack
	end,
})


minetest.register_craftitem("hyruletools:triforce", {
	description = "Triforce",
	inventory_image = "hyruletools_triforce.png",
	on_use = function(pos, placer)
	local pos = placer:getpos();
	minetest.add_particlespawner(
			6, --amount
			0.1, --time
			{x=pos.x-1, y=pos.y+0.5, z=pos.z-1}, --minpos
			{x=pos.x+1, y=pos.y+1, z=pos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=2,z=-0.5}, --minacc
			{x=0.5,y=2,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"hyruletools_nyan_rupee.png" --texture
		)
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	end
})

minetest.register_node("hyruletools:key", {
	description = "Dungeon Key",
	inventory_image = "hyruletools_key.png",
	wield_image_image = "hyruletools_key.png",
	tiles = {
		"hyruletools_key_small.png",
		"hyruletools_key_small.png",
		"hyruletools_medallion_side.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, 0, 0, -0.4375, 0.25}, -- NodeBox1
			{0.0625, -0.5, 0, 0.125, -0.4375, 0.25}, -- NodeBox2
			{0, -0.5, 0.125, 0.0625, -0.4375, 0.1875}, -- NodeBox3
			{0, -0.5, -0.25, 0.0625, -0.4375, 0.0625}, -- NodeBox4
			{0.0625, -0.5, -0.25, 0.125, -0.4375, -0.1875}, -- NodeBox5
			{0.0625, -0.5, -0.125, 0.125, -0.4375, -0.0625}, -- NodeBox6
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1, attached_node=1},
	sounds = default.node_sound_metal_defaults()	
})

minetest.register_craftitem("hyruletools:retro_key", {
	description = "Retro Dungeon Key",
	inventory_image = "hyruletools_key_retro.png",
})

minetest.register_node("hyruletools:key_boss", {
	description = "Boss Key",
	inventory_image = "hyruletools_boss_key.png",
	wield_image_image = "hyruletools_boss_key.png",
	tiles = {
		"hyruletools_boss_key_small.png",
		"hyruletools_boss_key_small.png",
		"hyruletools_medallion_side.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, 0, 0, -0.4375, 0.25}, -- NodeBox1
			{0.0625, -0.5, 0, 0.125, -0.4375, 0.25}, -- NodeBox2
			{0, -0.5, 0.0625, 0.0625, -0.4375, 0.1875}, -- NodeBox3
			{0, -0.5, -0.25, 0.0625, -0.4375, 0.0625}, -- NodeBox4
			{0.0625, -0.5, -0.25, 0.125, -0.4375, -0.1875}, -- NodeBox5
			{0.0625, -0.5, -0.125, 0.125, -0.4375, -0.0625}, -- NodeBox6
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1, attached_node=1},
	sounds = default.node_sound_metal_defaults()	
})

minetest.register_craftitem("hyruletools:red_rupee", {
	description = "Red Rupee",
	inventory_image = "hyruletools_red_rupee.png",
	stack_max = 1000,
	groups = {rupee = 1}
})

minetest.register_craftitem("hyruletools:green_rupee", {
	description = "Green Rupee",
	inventory_image = "hyruletools_green_rupee.png",
	stack_max = 1000,
	groups = {rupee = 1}
})

minetest.register_craftitem("hyruletools:blue_rupee", {
	description = "Blue Rupee",
	inventory_image = "hyruletools_blue_rupee.png",
	stack_max = 1000,
	groups = {rupee = 1}
})

minetest.register_craftitem("hyruletools:nyan_rupee", {
	description = "Nyan Rupee",
	inventory_image = "hyruletools_nyan_rupee.png",
	stack_max = 1000,
	groups = {rupee = 1}
})

minetest.register_craftitem("hyruletools:red_ore", {
	description = "Red Ore",
	inventory_image = "hyruletools_red_ore.png",
	stack_max = 1000,
})


minetest.register_craftitem("hyruletools:blue_ore", {
	description = "Blue Ore",
	inventory_image = "hyruletools_blue_ore.png",
	stack_max = 1000,
})


minetest.register_craftitem("hyruletools:triforce_shard", {
	description = "Triforce Shard",
	inventory_image = "hyruletools_triforce_shard.png"
})

minetest.register_craft({
	output = "hyruletools:triforce",
	recipe = {
		{"", "hyruletools:triforce_shard", ""},
		{"", "", ""},
		{"hyruletools:triforce_shard", "",  "hyruletools:triforce_shard"}
	}
})


minetest.register_craft({
	output = "hyruletools:triforce_shard",
	recipe = {
		{"", "default:mese", ""},
		{"", "", ""},
		{"default:mese", "",  "default:mese"}
	}
})

minetest.register_craftitem("hyruletools:ocarina", {
	description = "Ocarina",
	inventory_image = "hyruletools_ocarina.png",
	on_use = function(pos, placer)
		minetest.sound_play("hyruletools_tune", {gain = 0.5, max_hear_distance = 15})
		local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"hyruletools_note.png" --texture
		)
	end,
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local dir = placer:get_look_dir()
		minetest.set_node(pos, {name="hyruletools:ocarina_placed", param2=minetest.dir_to_facedir(dir)})
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craft({
	output = "hyruletools:ocarina",
	recipe = {
		{"", "", ""},
		{"", "default:clay_lump", ""},
		{"default:clay_lump", "default:clay_lump",  "default:clay_lump"}
	}
})

minetest.register_craftitem("hyruletools:ocarina2", {
	description = "Red Ocarina",
	inventory_image = "hyruletools_ocarina_red.png",
	on_use = function(pos, placer)
		minetest.sound_play("hyruletools_trumpet", {gain = 0.5, max_hear_distance = 15})
		local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"hyruletools_note.png" --texture
		)
		local playerpos = placer:getpos();
		local dir = placer:get_look_dir();
		local player = placer:get_player_name()
		if minetest.setting_getbool("enable_weather") then	
		hyrule_weather.weather = "storm"
		hyrule_weather.current = 3
		else
		minetest.chat_send_player(player, "weather not enabled!")
		end
	end,
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local dir = placer:get_look_dir()
		minetest.set_node(pos, {name="hyruletools:ocarina_placed2", param2=minetest.dir_to_facedir(dir)})
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craft({
	output = "hyruletools:ocarina2",
	recipe = {
		{"", "", ""},
		{"", "dye:red", ""},
		{"", "hyruletools:ocarina",  ""}
	}
})

minetest.register_craftitem("hyruletools:ocarina3", {
	description = "Yellow Ocarina",
	inventory_image = "hyruletools_ocarina_yellow.png",
	on_use = function(pos, placer)
		minetest.sound_play("hyruletools_epona", {gain = 0.5, max_hear_distance = 15})
		local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"hyruletools_note.png" --texture
		)
		local playerpos = placer:getpos();
		local dir = placer:get_look_dir();
		local obj = minetest.env:add_entity({x=playerpos.x+1+dir.x,y=playerpos.y+1+dir.y,z=playerpos.z+1+dir.z}, "kpgmobs:horse")
	end,
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local dir = placer:get_look_dir()
		minetest.set_node(pos, {name="hyruletools:ocarina_placed3", param2=minetest.dir_to_facedir(dir)})
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craft({
	output = "hyruletools:ocarina3",
	recipe = {
		{"", "", ""},
		{"", "dye:yellow", ""},
		{"", "hyruletools:ocarina",  ""}
	}
})

minetest.register_craftitem("hyruletools:doompick", {
	description = "Pickaxe of Doom",
	inventory_image = "hyruletools_doompick.png",
	liquids_pointable = true,
	on_use = function(item, placer, pointed_thing)
		if pointed_thing.under == nil then
		return end
		if minetest.get_node(pointed_thing.under) ~= nil then
			minetest.remove_node(pointed_thing.under)
		end
	end,
})

minetest.register_craftitem("hyruletools:ocarina4", {
	description = "Green Ocarina",
	inventory_image = "hyruletools_ocarina_green.png",
	on_use = function(pos, placer, itemstack)
		minetest.sound_play("hyruletools_forest", {gain = 0.5, max_hear_distance = 15})
		local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"hyruletools_note.png" --texture
		)
		local playerpos = placer:getpos();
		local dir = placer:get_look_dir();
		local obj = minetest.env:add_entity({x=playerpos.x+1+dir.x,y=playerpos.y+1+dir.y,z=playerpos.z+1+dir.z}, "mobs_loz:business_scrub_passive")
	end,
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local dir = placer:get_look_dir()
		minetest.set_node(pos, {name="hyruletools:ocarina_placed4", param2=minetest.dir_to_facedir(dir)})
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craft({
	output = "hyruletools:ocarina4",
	recipe = {
		{"", "", ""},
		{"", "dye:green", ""},
		{"", "hyruletools:ocarina",  ""}
	}
})

minetest.register_node("hyruletools:ocarina_placed", {
	drop = "hyruletools:ocarina",
	tiles = {
		"hyruletools_ocarina_placed.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.4375, 0.125}, -- NodeBox1
			{-0.125, -0.4375, -0.125, 0.125, -0.375, 0.125}, -- NodeBox2
			{-0.0625, -0.4375, -0.1875, 0.0625, -0.375, 0.1875}, -- NodeBox3
			{-0.0625, -0.375, -0.0625, 0.0625, -0.3125, 0.125}, -- NodeBox4
			{0, -0.3125, 0.0625, 0.0625, -0.25, 0.125}, -- NodeBox5
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyruletools:ocarina_placed2", {
	drop = "hyruletools:ocarina2",
	tiles = {
		"hyruletools_ocarina_placed_red.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.4375, 0.125}, -- NodeBox1
			{-0.125, -0.4375, -0.125, 0.125, -0.375, 0.125}, -- NodeBox2
			{-0.0625, -0.4375, -0.1875, 0.0625, -0.375, 0.1875}, -- NodeBox3
			{-0.0625, -0.375, -0.0625, 0.0625, -0.3125, 0.125}, -- NodeBox4
			{0, -0.3125, 0.0625, 0.0625, -0.25, 0.125}, -- NodeBox5
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyruletools:ocarina_placed3", {
	drop = "hyruletools:ocarina3",
	tiles = {
		"hyruletools_ocarina_placed_yellow.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.4375, 0.125}, -- NodeBox1
			{-0.125, -0.4375, -0.125, 0.125, -0.375, 0.125}, -- NodeBox2
			{-0.0625, -0.4375, -0.1875, 0.0625, -0.375, 0.1875}, -- NodeBox3
			{-0.0625, -0.375, -0.0625, 0.0625, -0.3125, 0.125}, -- NodeBox4
			{0, -0.3125, 0.0625, 0.0625, -0.25, 0.125}, -- NodeBox5
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyruletools:ocarina_placed4", {
	drop = "hyruletools:ocarina4",
	tiles = {
		"hyruletools_ocarina_placed_green.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.4375, 0.125}, -- NodeBox1
			{-0.125, -0.4375, -0.125, 0.125, -0.375, 0.125}, -- NodeBox2
			{-0.0625, -0.4375, -0.1875, 0.0625, -0.375, 0.1875}, -- NodeBox3
			{-0.0625, -0.375, -0.0625, 0.0625, -0.3125, 0.125}, -- NodeBox4
			{0, -0.3125, 0.0625, 0.0625, -0.25, 0.125}, -- NodeBox5
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyruletools:fire", {
	description = "Magical Fire",
	drawtype = "plantlike",
	sunlight_propagates = true,
	paramtype = "light",
	light_source = 5,
	walkable = false,
	damage_per_second = 2,
	tiles = {{
		name = "hyruletools_fire.png",
		animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.00},
	}}
,
	inventory_image = "hyruletools_fire_inv.png",
	wield_image = "hyruletools_fire_inv.png",
	groups = {crumbly=1, dig_immediate = 3},
	selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		}
})

minetest.register_tool("hyruletools:lantern", {
	description = "Lantern",
	inventory_image = "hyruletools_lantern.png",
	tool_capabilities = {
		groupcaps = { igniter = {uses=10, maxlevel=1} }
	},
	on_use = function(itemstack, user, pointed_thing)
		local player = user:get_player_name()
		if mana.subtract(player, 15) then
		if pointed_thing.type == "node" and
				minetest.get_node(pointed_thing.above).name == "air" then
			if not minetest.is_protected(pointed_thing.above, player) then
				minetest.set_node(pointed_thing.above, {name="fire:basic_flame"})
			else
				minetest.chat_send_player(player, "This area is protected.")
			end
		end
		end

		--itemstack:add_wear(1000)
		return itemstack
	end
})

minetest.register_node("hyruletools:climbable", {
	drawtype = "airlike",
	groups = {not_in_creative_inventory=1},
	walkable = false,
	climbable = true,
	pointable = false,
	sunlight_propagates = true,
	paramtype = "light",
})

minetest.register_node("hyruletools:light", {
	drawtype = "airlike",
	groups = {not_in_creative_inventory=1},
	walkable = false,
	pointable = false,
	light_source = 10,
})

minetest.register_abm({
	nodenames = {"hyruletools:climbable", "hyruletools:light"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.remove_node(pos)
	end,
})

minetest.register_tool("hyruletools:climbing_gloves", {
	description = "Climbing Gloves",
	inventory_image = "hyruletools_climbing_gloves.png"
})

minetest.register_craft({
	output = "hyruletools:climbing_gloves",
	recipe = {
		{"default:stick", "", "default:stick"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"mobs:leather", "",  "mobs:leather"}
	}
})

--[[minetest.register_node("hyruletools:climbable2", {
	drawtype = "airlike",
	groups = {not_in_creative_inventory=1},
	walkable = true,
	pointable = false,
})

minetest.register_abm({
	nodenames = {"hyruletools:climbable2"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local objs = minetest.get_objects_inside_radius(pos, 1)
		local destroy = true
		for _,obj in ipairs(objs) do
		if obj:is_player() then
		destroy = false
		return destroy
		end
		end
		if destroy then
		minetest.remove_node(pos)
		end
	end,
})

minetest.register_tool("hyruletools:climbing_gloves2", {
	description = "Climbing Gloves 2",
	inventory_image = "hyruletools_climbing_gloves.png",
	range = 3,
	on_use = function(itemstack, clicker, pointed_thing)
		if not pointed_thing then return end
		local pos = pointed_thing.above
		local pos2 = clicker:getpos()
		pos2.y = pos2.y-1
		if minetest.get_node(pos2).name == "hyruletools:climbable2" then
			minetest.remove_node(pos2)
		end
		clicker:setpos(pos)
		pos.y = pos.y-1
		minetest.set_node(pos, {name="hyruletools:climbable2"})
		itemstack:add_wear(1000)
		return itemstack
	end,
})]]

minetest.register_tool("hyruletools:mirror", {
	description = "Magic Mirror (use at your own risk!)",
	inventory_image = "hyruletools_mirror.png",
	tool_capabilities = {
		groupcaps = { igniter = {uses=10, maxlevel=1} }
	},
	on_use = function(itemstack, user, pointed_thing)
		local player = user:get_player_name()
		if mana.subtract(player, 100) then
		local pos1 = user:getpos()
		local pos = math.random(1,50)
		local vertical = 0
		if pos1.y <= -20001 then
		vertical = 5
		else
		vertical = -21000
		end
		user:setpos({x= pos,y=vertical,z= pos})
		end
		return itemstack
end
})

minetest.register_craft({
	output = "hyruletools:mirror",
	recipe = {
		{"default:stick", "default:stick", "default:stick"},
		{"default:stick", "default:glass", "default:stick"},
		{"", "default:stick",  ""}
	}
})

--Kamehameha! (part of the notsosimplemobs modpack)
--Not so simple mods by NPX team

--Credits goes to:
-- - PilzAdam, for his wonderful simple-mobs mod;
-- - Sapier, for his hard word in making modding easier thanks to mobf;
-- - maikerumine, for his "Dirtmons";
-- - and obviously Celeron-55 and all the peolpe who contributed to Minetest and its community;


--Here is Sapier message:
-------------------------------------------------------------------------------
-- Mob Framework Mod by Sapier
--
-- You may copy, use, modify or do nearly anything except removing this
-- copyright notice.
-- And of course you are NOT allow to pretend you have written it.
--
--! @file init.lua
--! @brief cow implementation
--! @copyright Sapier
--! @author Sapier
--! @date 2013-01-27
--
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------
--License GPL v3

minetest.register_entity("hyruletools:spark", {
	textures = {"hyruletools_swdbeam_trail.png"},
	velocity = 15,
	on_activate = function(self)
		minetest.after(5, function()
			self.object:remove()
			end)
	end,
	on_step = function (self, pos, node, dtime)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:spark" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=12},
						}, nil)
					self.object:remove()
					end
				end
			end
	end,
})

minetest.register_node("hyruletools:medallion", {
	description = "Ether Medallion",
	inventory_image = "hyruletools_medallion.png",
	tiles = {
		"hyruletools_medallion_small.png",
		"hyruletools_medallion_small.png",
		"hyruletools_medallion_side.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_metal_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.4375, 0.125}, -- NodeBox1
			{-0.3125, -0.5, -0.25, 0.3125, -0.4375, 0.25}, -- NodeBox2
			{-0.25, -0.5, -0.3125, 0.25, -0.4375, 0.3125}, -- NodeBox3
			{-0.125, -0.5, -0.375, 0.125, -0.4375, 0.375}, -- NodeBox4
		}
	},
	on_use = function(itemstack, placer, pointed_thing)
			local player = placer:get_player_name()
			if mana.subtract(player, 100) then
			local playerpos = placer:getpos();
			--particles
			for i=1,5 do
			minetest.after(i*0.1, function()
			minetest.add_particle({
				pos = {x=playerpos.x, y=playerpos.y+1, z=playerpos.z},
				velocity = {x=0, y=4, z=0},
				acceleration = {x=0, y=1, z=0},
				expirationtime = 0.5,
				size = 30,
				collisiondetection = false,
				collisionremoval = false,
				vertical = true,
				texture = "hyruletools_lightning.png",
				glow = 9
			})
			end)
			end
			
			--objects
			minetest.after(1, function()
			minetest.sound_play("thunder", {pos = playerpos, gain = 0.4, max_hear_distance = 2*64})
			local obj = minetest.env:add_entity({x=playerpos.x+1,y=playerpos.y+1,z=playerpos.z+1}, "hyruletools:spark")
			local vec = {x=6,y=0,z=6}
			obj:setvelocity(vec)
			
			local obj = minetest.env:add_entity({x=playerpos.x-1,y=playerpos.y+1,z=playerpos.z-1}, "hyruletools:spark")
			local vec = {x=-6,y=0,z=-6}
			obj:setvelocity(vec)
			
			local obj = minetest.env:add_entity({x=playerpos.x+1,y=playerpos.y+1,z=playerpos.z-1}, "hyruletools:spark")
			local vec = {x=6,y=0,z=-6}
			obj:setvelocity(vec)
			
			local obj = minetest.env:add_entity({x=playerpos.x-1,y=playerpos.y+1,z=playerpos.z+1}, "hyruletools:spark")
			local vec = {x=-6,y=0,z=6}
			obj:setvelocity(vec)
			
			local obj = minetest.env:add_entity({x=playerpos.x-1,y=playerpos.y+1,z=playerpos.z}, "hyruletools:spark")
			local vec = {x=-6,y=0,z=0}
			obj:setvelocity(vec)
			
			local obj = minetest.env:add_entity({x=playerpos.x,y=playerpos.y+1,z=playerpos.z+1}, "hyruletools:spark")
			local vec = {x=0,y=0,z=6}
			obj:setvelocity(vec)
			
			local obj = minetest.env:add_entity({x=playerpos.x,y=playerpos.y+1,z=playerpos.z-1}, "hyruletools:spark")
			local vec = {x=0,y=0,z=-6}
			obj:setvelocity(vec)
			
			local obj = minetest.env:add_entity({x=playerpos.x+1,y=playerpos.y+1,z=playerpos.z}, "hyruletools:spark")
			local vec = {x=6,y=0,z=0}
			obj:setvelocity(vec)
			minetest.after(0.5, function()
			for i=1,5 do
				lightning.strike({x=playerpos.x+math.random(-6,6), y=playerpos.y, z=playerpos.z+math.random(-6,6)})
			end
			end)
			end)
			end
		return itemstack
	end,
})

minetest.register_craft({
	output = 'hyruletools:medallion',
	recipe = {
		{'', 'default:copper_ingot', ''},
		{'default:copper_ingot', 'hyruletools:magic_powder', 'default:copper_ingot'},
		{'', 'default:copper_ingot', ''},
	}
})


minetest.register_entity("hyruletools:stone", {
	visual = "cube",
	textures = {"default_stone.png", "default_stone.png^[colorize:black:50", "default_stone.png^[colorize:black:10", "default_stone.png^[colorize:black:10", "default_stone.png^[colorize:black:20", "default_stone.png^[colorize:black:20"},
	velocity = 15,
	collision_box = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	physical = true,
	on_activate = function(self)
		minetest.after(5, function()
			local pos = self.object:getpos()
			if pos ~= nil and minetest.get_node(pos).name == "air" then
				minetest.set_node(pos, {name="default:stone"})
			end
			self.object:remove()
		end)
	end,
	on_step = function (self, pos, node, dtime)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:stone" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=12},
						}, nil)
					self.object:remove()
					end
				end
			end
	end,
})


minetest.register_node("hyruletools:medallion2", {
	description = "Quake Medallion",
	inventory_image = "hyruletools_medallion2.png",
	tiles = {
		"hyruletools_medallion2_small.png",
		"hyruletools_medallion2_small.png",
		"hyruletools_medallion_side.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_metal_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.4375, 0.125}, -- NodeBox1
			{-0.3125, -0.5, -0.25, 0.3125, -0.4375, 0.25}, -- NodeBox2
			{-0.25, -0.5, -0.3125, 0.25, -0.4375, 0.3125}, -- NodeBox3
			{-0.125, -0.5, -0.375, 0.125, -0.4375, 0.375}, -- NodeBox4
		}
	},
	on_use = function(itemstack, placer, pointed_thing)
			local player = placer:get_player_name()
			if mana.subtract(player, 100) then
			local playerpos = placer:getpos();
			minetest.sound_play("earthquake", {pos = playerpos, gain = 0.5, max_hear_distance = 32})
			--particles
			for i=1,24 do
			minetest.after(i*0.1, function()
			minetest.add_particle({
				pos = {x=playerpos.x+math.random(-4,4), y=playerpos.y+math.random(8,10)/10, z=playerpos.z+math.random(-4,4)},
				velocity = {x=math.random(-1,1), y=math.random(1,4), z=math.random(-1,1)},
				acceleration = {x=0, y=1, z=0},
				expirationtime = 0.5,
				size = 10,
				collisiondetection = false,
				collisionremoval = false,
				vertical = false,
				texture = "hyruletools_lightning2.png",
				animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 0.20},
				glow = 9
			})
			end)
			end
			
			for i=1,20 do
			minetest.after(i*0.5, function()
			local obj = minetest.env:add_entity({x=playerpos.x+math.random(-5,5),y=playerpos.y+5,z=playerpos.z+math.random(-5,5)}, "hyruletools:stone")
			local vec = {x=0,y=-13,z=0}
			obj:setvelocity(vec)
			local obj = minetest.env:add_entity({x=playerpos.x+math.random(-5,5),y=playerpos.y+6,z=playerpos.z+math.random(-5,5)}, "hyruletools:stone")
			local vec = {x=0,y=-13,z=0}
			obj:setvelocity(vec)
			local obj = minetest.env:add_entity({x=playerpos.x+math.random(-5,5),y=playerpos.y+7,z=playerpos.z+math.random(-5,5)}, "hyruletools:stone")
			local vec = {x=0,y=-13,z=0}
			obj:setvelocity(vec)
			end)
			end
			
			end
		return itemstack
	end,
})

minetest.register_craft({
	output = 'hyruletools:medallion2',
	recipe = {
		{'', 'hyrule_mapgen:lavabiome_dirt', ''},
		{'hyrule_mapgen:lavabiome_dirt', 'hyruletools:magic_powder', 'hyrule_mapgen:lavabiome_dirt'},
		{'', 'hyrule_mapgen:lavabiome_dirt', ''},
	}
})

minetest.register_node("hyruletools:medallion3", {
	description = "Bombos Medallion",
	inventory_image = "hyruletools_medallion3.png",
	tiles = {
		"hyruletools_medallion3_small.png",
		"hyruletools_medallion3_small.png",
		"hyruletools_medallion_side.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_metal_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.125, 0.375, -0.4375, 0.125}, -- NodeBox1
			{-0.3125, -0.5, -0.25, 0.3125, -0.4375, 0.25}, -- NodeBox2
			{-0.25, -0.5, -0.3125, 0.25, -0.4375, 0.3125}, -- NodeBox3
			{-0.125, -0.5, -0.375, 0.125, -0.4375, 0.375}, -- NodeBox4
		}
	},
	on_use = function(itemstack, placer, pointed_thing)
			local player = placer:get_player_name()
			if mana.subtract(player, 100) then
			local playerpos = placer:getpos();
			minetest.sound_play("flamearrow", {pos=playerpos, gain=0.7, max_hear_distance=15})
			
			--particles
			
			for i=1,12 do
			minetest.after(i*0.1, function()
			minetest.add_particle({
				pos = {x=playerpos.x, y=playerpos.y+1, z=playerpos.z-3},
				velocity = {x=0, y=4, z=0},
				acceleration = {x=0, y=1, z=0},
				expirationtime = 1,
				size = 10,
				collisiondetection = false,
				collisionremoval = false,
				vertical = true,
				texture = "hyruletools_firestack.png",
			animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.00},
				glow = 9
			})
			minetest.add_particle({
				pos = {x=playerpos.x, y=playerpos.y+1, z=playerpos.z+3},
				velocity = {x=0, y=4, z=0},
				acceleration = {x=0, y=1, z=0},
				expirationtime = 1,
				size = 10,
				collisiondetection = false,
				collisionremoval = false,
				vertical = true,
				texture = "hyruletools_firestack.png",
			animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.00},
				glow = 9
			})
			minetest.add_particle({
				pos = {x=playerpos.x-3, y=playerpos.y+1, z=playerpos.z},
				velocity = {x=0, y=4, z=0},
				acceleration = {x=0, y=1, z=0},
				expirationtime = 1,
				size = 10,
				collisiondetection = false,
				collisionremoval = false,
				vertical = true,
				texture = "hyruletools_firestack.png",
			animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.00},
				glow = 9
			})
			minetest.add_particle({
				pos = {x=playerpos.x+3, y=playerpos.y+1, z=playerpos.z},
				velocity = {x=0, y=4, z=0},
				acceleration = {x=0, y=1, z=0},
				expirationtime = 1,
				size = 10,
				collisiondetection = false,
				collisionremoval = false,
				vertical = true,
				texture = "hyruletools_firestack.png",
			animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.00},
				glow = 9
			})
			end)
			end
			
			minetest.after(1, function()
			
			for i=1,30 do
			minetest.after(i*0.1, function()
			minetest.add_particle({
				pos = {x=playerpos.x+math.random(-4,4), y=playerpos.y+1, z=playerpos.z+math.random(-4,4)},
				velocity = {x=0, y=4, z=0},
				acceleration = {x=0, y=math.random(1,8), z=0},
				expirationtime = 0.3,
				size = math.random(5,9),
				collisiondetection = false,
				collisionremoval = false,
				vertical = true,
				texture = "hyruletools_bombeffect.png",
			animation = {type = "vertical_frames", aspect_w = 20, aspect_h = 20, length = 0.50},
				glow = 9
			})
			end)
			end
			
			tnt.boom({x=playerpos.x, y=playerpos.y+1, z=playerpos.z+4}, {damage_radius=3,radius=1,ignore_protection=false, disable_playerdamage=true})
			minetest.after(0.2, function()
			tnt.boom({x=playerpos.x, y=playerpos.y+1, z=playerpos.z-4}, {damage_radius=3,radius=1,ignore_protection=false, disable_playerdamage=true})
			end)
			minetest.after(0.4, function()
			tnt.boom({x=playerpos.x+4, y=playerpos.y+1, z=playerpos.z}, {damage_radius=3,radius=1,ignore_protection=false, disable_playerdamage=true})
			end)
			minetest.after(0.6, function()
			tnt.boom({x=playerpos.x-4, y=playerpos.y+1, z=playerpos.z}, {damage_radius=3,radius=1,ignore_protection=false, disable_playerdamage=true})
			end)
			end)
			
			end
		return itemstack
	end,
})

minetest.register_craft({
	output = 'hyruletools:medallion3',
	recipe = {
		{'', 'tnt:gunpowder', ''},
		{'tnt:gunpowder', 'hyruletools:magic_powder', 'tnt:gunpowder'},
		{'', 'tnt:gunpowder', ''},
	}
})

minetest.register_tool("hyruletools:pendant1", {
	description = "Pendant of Power",
	inventory_image = "hyruletools_pendant1.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
		for i=1,5 do
			minetest.after(i*0.02, function()
			minetest.add_particle({
				pos = {x=playerpos.x+math.random(-1,1), y=playerpos.y, z=playerpos.z+math.random(-1,1)},
				velocity = {x=0, y=0, z=0},
				acceleration = {x=math.random(-5,5)/10, y=4, z=math.random(-5,5)/10},
				expirationtime = math.random(5,10)/10,
				size = math.random(8,10),
				collisiondetection = false,
				collisionremoval = false,
				vertical = false,
				texture = "hyruletools_powder2.png",
				glow = 9
			})
			end)
		end
	end,
	tiles = {
		"hyruletools_pendant_1s.png",
		"hyruletools_pendant_1s.png",
		"hyruletools_ocarina_placed.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.499, 0.5}, -- NodeBox1
			{-0.0625, -0.5, -0.375, 0.125, -0.4375, -0.1875}, -- NodeBox2
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.375, 0.125, -0.4375, -0.1875}, -- NodeBox2
		}
	},
	light_source = 2,
	groups = {cracky=1, oddly_breakable_by_hand=1, dig_immediate=3},
})

minetest.register_node("hyruletools:pendant2", {
	description = "Pendant of Courage",
	inventory_image = "hyruletools_pendant2.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
		for i=1,5 do
			minetest.after(i*0.02, function()
			minetest.add_particle({
				pos = {x=playerpos.x+math.random(-1,1), y=playerpos.y, z=playerpos.z+math.random(-1,1)},
				velocity = {x=0, y=0, z=0},
				acceleration = {x=math.random(-5,5)/10, y=4, z=math.random(-5,5)/10},
				expirationtime = math.random(5,10)/10,
				size = math.random(8,10),
				collisiondetection = false,
				collisionremoval = false,
				vertical = false,
				texture = "hyruletools_powder3.png",
				glow = 9
			})
			end)
		end
	end,
	tiles = {
		"hyruletools_pendant_2s.png",
		"hyruletools_pendant_2s.png",
		"hyruletools_ocarina_placed_green.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.499, 0.5}, -- NodeBox1
			{-0.0625, -0.5, -0.375, 0.125, -0.4375, -0.1875}, -- NodeBox2
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.375, 0.125, -0.4375, -0.1875}, -- NodeBox2
		}
	},
	light_source = 2,
	groups = {cracky=1, oddly_breakable_by_hand=1, dig_immediate=3},
})

minetest.register_node("hyruletools:pendant3", {
	description = "Pendant of Wisdom",
	inventory_image = "hyruletools_pendant3.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
		for i=1,5 do
			minetest.after(i*0.02, function()
			minetest.add_particle({
				pos = {x=playerpos.x+math.random(-1,1), y=playerpos.y, z=playerpos.z+math.random(-1,1)},
				velocity = {x=0, y=0, z=0},
				acceleration = {x=math.random(-5,5)/10, y=4, z=math.random(-5,5)/10},
				expirationtime = math.random(5,10)/10,
				size = math.random(8,10),
				collisiondetection = false,
				collisionremoval = false,
				vertical = false,
				texture = "hyruletools_powder4.png",
				glow = 9
			})
			end)
			end
	end,
	tiles = {
		"hyruletools_pendant_3s.png",
		"hyruletools_pendant_3s.png",
		"hyruletools_ocarina_placed_red.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.499, 0.5}, -- NodeBox1
			{-0.0625, -0.5, -0.375, 0.125, -0.4375, -0.1875}, -- NodeBox2
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.375, 0.125, -0.4375, -0.1875}, -- NodeBox2
		}
	},
	light_source = 2,
	groups = {cracky=1, oddly_breakable_by_hand=1, dig_immediate=3},
})

minetest.register_node("hyruletools:chomper", {
	description = "Wood Chomper",
	tiles = {
		"hyruletools_chomper_top.png",
		"hyruletools_chomper_bottom.png",
		"hyruletools_chomper.png",
		"hyruletools_chomper.png",
		"hyruletools_chomper_front.png",
		"hyruletools_chomper.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.1875, -0.5, 0.5, 0.5, -0.3125}, -- NodeBox1
			{0.3125, 0.5, 0.3125, 0.4375, 0.625, 0.4375}, -- NodeBox2
			{-0.4375, 0.5, 0.3125, -0.3125, 0.625, 0.4375}, -- NodeBox3
			{-0.4375, 0.5, -0.4375, -0.3125, 0.625, -0.3125}, -- NodeBox4
			{0.3125, 0.5, -0.4375, 0.4375, 0.625, -0.3125}, -- NodeBox5
			{0.3125, 0.5, -0.0625, 0.4375, 0.625, 0.0625}, -- NodeBox6
			{-0.4375, 0.5, -0.0625, -0.3125, 0.625, 0.0625}, -- NodeBox7
			{-0.0625, 0.5, -0.4375, 0.0625, 0.625, -0.3125}, -- NodeBox8
			{-0.0625, 0.5, 0.3125, 0.0625, 0.625, 0.4375}, -- NodeBox9
			{-0.5, 0.1875, 0.3125, 0.5, 0.5, 0.5}, -- NodeBox10
			{0.3125, 0.1875, -0.5, 0.5, 0.5, 0.5}, -- NodeBox11
			{-0.5, 0.1875, -0.5, -0.3125, 0.5, 0.5}, -- NodeBox12
		}
	},
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky=1, oddly_breakable_by_hand=1},
	on_construct = function(pos)
		local pos_above = {x=pos.x, y=pos.y+1, z=pos.z}
		local node = minetest.get_node(pos)
		local node_above = minetest.get_node(pos_above)
		if minetest.get_item_group(node_above.name, "choppy") >= 1 then
			minetest.after(0.5, function()
				if node ~= nil and node_above ~= nil and pos_above ~= nil then
					minetest.remove_node(pos)
					minetest.add_item(pos, node_above.name)
					minetest.set_node(pos_above, {name="hyruletools:chomper", param2=node.param2})
					minetest.sound_play("hunger_eat", {pos=pos, gain=0.7})
				end
			end)
		else
			minetest.add_item(pos, "hyruletools:chomper")
			minetest.sound_play("gulp", {pos=pos, gain=2})
			minetest.remove_node(pos)
		end
	end,
})

minetest.register_craft({
	output = 'hyruletools:chomper',
	recipe = {
		{'mobs_loz:scale', "mobs_loz:scale", "mobs_loz:scale"},
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
	}
})

--mobs redo arrow code, see mobs license

minetest.register_entity("hyruletools:swdspark", {
	textures = {"hyrule_mapgen_trans.png"},
	velocity = 15,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)		
		local remove = minetest.after(2, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:swdspark" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4},
						}, nil)
					self.object:remove()
					end
				end
			end
		local apos = self.object:getpos()
		local velo = self.object:getvelocity()
		minetest.add_particle({
			pos = {x=apos.x, y=apos.y, z=apos.z},
			velocity = {x=-velo.x/2, y=-velo.y/2, z=-velo.z/2},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 0.1,
			size = 8,
			collisiondetection = false,
			collisionremoval = false,
			vertical = false,
			texture = "hyruletools_swdbeam_trail.png",
			glow = 9
		})
	end,
})

--master sword, an edit of Mese sword(see liscence for default)
minetest.register_tool("hyruletools:sword", {
	description = "True Master Sword",
	inventory_image = "mastersword_sword.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	on_use = function(itemstack, placer, pointed_thing)
			local name = placer:get_player_name()
			local dir = placer:get_look_dir()
			local playerpos = placer:getpos()
			local obj = minetest.env:add_entity({x=playerpos.x+dir.x,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:swdspark")
			local vec = {x=dir.x*7,y=dir.y*7,z=dir.z*7}
			obj:setvelocity(vec)
		return itemstack
	end,
})

minetest.register_craftitem("hyruletools:crest", {
	description = "Hylian Crest",
	inventory_image = "hyruletools_crest.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
})

minetest.register_node("hyruletools:crest_block", {
	description = "Obsidian Crest Block",
	tiles = {
		"hyruletools_crest_block.png",
		"hyruletools_crest_block.png",
		"hyruletools_crest_block_side.png",
		"hyruletools_crest_block_side.png",
		"hyruletools_crest_block.png",
		"hyruletools_crest_block.png",
	},
	paramtype2 = "facedir",
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyruletools:crest_block2", {
	description = "Gold Crest Block",
	tiles = {
		"hyruletools_crest_block2.png",
		"hyruletools_crest_block2.png",
		"hyruletools_crest_block2_side.png",
		"hyruletools_crest_block2_side.png",
		"hyruletools_crest_block2.png",
		"hyruletools_crest_block2.png",
	},
	paramtype2 = "facedir",
	groups = {cracky=1},
	sounds = default.node_sound_metal_defaults()
})

minetest.register_tool("hyruletools:sword_incomplete", {
	description = "Master Sword",
	inventory_image = "hyruletools_mastersword_incomplete.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	on_use = function(itemstack, placer, pointed_thing)
			local name = placer:get_player_name()
			if mana.subtract(name, 5) then
			local dir = placer:get_look_dir()
			local playerpos = placer:getpos()
			local obj = minetest.env:add_entity({x=playerpos.x+dir.x,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:swdspark")
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			end
		return itemstack
	end,
})

--mobs redo arrow code, see mobs license

minetest.register_entity("hyruletools:swdspark_light", {
	textures = {"hyruletools_swdbeam_light.png"},
	velocity = 15,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)		
		local remove = minetest.after(2, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:swdspark_light" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=6},
						}, nil)
					self.object:remove()
					end
				end
			end
		local apos = self.object:getpos()
		local velo = self.object:getvelocity()
		for i=1,5 do
		minetest.after(i*0.1, function()
		minetest.add_particle({
			pos = {x=apos.x, y=apos.y, z=apos.z},
			velocity = {x=-velo.x/2, y=-velo.y/2, z=-velo.z/2},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 0.1,
			size = 8,
			collisiondetection = false,
			collisionremoval = false,
			vertical = false,
			texture = "hyruletools_swdbeam_light.png",
			glow = 9
		})
		end)
		end
	end,
})

--master sword, an edit of Mese sword(see liscence for default)
minetest.register_tool("hyruletools:sword_light", {
	description = "Master Sword",
	inventory_image = "mastersword_sword_light.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
			local name = placer:get_player_name()
			if mana.subtract(name, 10) then
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+dir.x,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:swdspark_light")
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			end
		return itemstack
	end,
})

minetest.register_entity("hyruletools:swdspark_classic", {
	visual = "mesh",
	mesh = "flatplane.b3d",
	textures = {"hyruletools_classicsword.png"},
	visual_size = {x=2.5, y=2.5},
	physical = true,
	velocity = 15,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)		
		local remove = minetest.after(2, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:swdspark_classic" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=2},
						}, nil)
					self.object:remove()
					end
				end
			end
		if minetest.get_node(pos).name ~= "air" then
		self.object:setvelocity({x=0, y=0, z=0})
		end
	end,
})

--classic sword, an edit of Mese sword(see liscence for default)
minetest.register_tool("hyruletools:classic_sword", {
	description = "Classic Sword",
	inventory_image = "hyruletools_classicsword.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	on_use = function(itemstack, placer, pointed_thing)
			local player = placer:get_player_name()
			if mana.subtract(player, 10) then
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+dir.x,y=playerpos.y+1.2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:swdspark_classic")
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			obj:setyaw(placer:get_look_yaw() - math.pi / 2)
			end
		return itemstack
	end,
})

minetest.register_craft({
	output = 'hyruletools:sword_incomplete',
	recipe = {
		{'hyruletools:foreststone'},
		{'hyruletools:waterstone'},
		{'hyruletools:firestone'},
	}
})

minetest.register_craft({
	output = 'hyruletools:sword',
	recipe = {
		{'hyruletools:crest'},
		{'hyruletools:sword_incomplete'},
	}
})

minetest.register_craftitem("hyruletools:seed_satchel", {
	description = "Seed Bag(empty)",
	inventory_image = "hyruletools_seedbag.png"
})

minetest.register_craft({
	output = 'hyruletools:seed_satchel',
	recipe = {
		{'', 'default:paper', ''},
		{'default:paper', '', 'default:paper'},
		{'', 'default:paper', ''},
	}
})

minetest.register_entity("hyruletools:fireball", {
	textures = {"hyruletools_flame.png"},
	velocity = 15,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)		
		local remove = minetest.after(2, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:fireball" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=2},
						}, nil)
					self.object:remove()
					end
				end
			end
			for dx=0,0.5 do
						for dy=0,0.5 do
							for dz=0,0.5 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= "hyruletools:fireball" and n ~="default:dirt_with_grass" and n ~="default:dirt_with_dry_grass" and n ~="default:stone"  then	
									if minetest.registered_nodes[n].groups.flammable then
										minetest.env:set_node(t, {name="fire:basic_flame"})
									self.object:remove()
									return
									end
								end
							end
						end
					end
	end,
})

--master sword, an edit of Mese sword(see liscence for default)
minetest.register_tool("hyruletools:flame_rod", {
	description = "Flame Rod",
	inventory_image = "hyruletools_flamerod.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	on_use = function(itemstack, placer, pointed_thing)
		local player = placer:get_player_name()
		if mana.subtract(player, 30) then
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+dir.x,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:fireball")
			local vec = {x=dir.x*16,y=dir.y*16,z=dir.z*16}
			obj:setvelocity(vec)
			minetest.sound_play("flamearrow", {to_player=player, gain=0.7})
		end
		return itemstack
	end,
})

minetest.register_craftitem("hyruletools:seed_fire", {
	description = "Seed Bag (Ember)",
	inventory_image = "hyruletools_seedbag_red.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		if pointed_thing.type == "node" and
				minetest.get_node(pointed_thing.above).name == "air" then
			if not minetest.is_protected(pointed_thing.above, player) then
				minetest.set_node(pointed_thing.above, {name="hyruletools:fire"})
			else
				minetest.chat_send_player(player, "This area is protected.")
			end
		end

		item:take_item()
	return item
	end
})

minetest.register_craftitem("hyruletools:seed_mystery", {
	description = "Seed Bag (Mystery)",
	inventory_image = "hyruletools_seedbag_green.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local ppos = user:getpos()
		if pointed_thing.type == "node" and
				minetest.get_node(pointed_thing.above).name == "air" then
			if not minetest.is_protected(pointed_thing.above, player) then
			if math.random(1, 3) == 1 then
				minetest.set_node(pointed_thing.above, {name="default:stone"})
				else
				if math.random(1, 3) == 2 then
				minetest.set_node(pointed_thing.above, {name="default:ice"})
				else
				if math.random(1, 3) == 1 then
				minetest.set_node(ppos, {name="fire:basic_flame"})
				end
				end
				end
			else
				minetest.chat_send_player(player, "This area is protected.")
			end
		end

		item:take_item()
	return item
	end
})

minetest.register_craftitem("hyruletools:seed_gasha", {
	description = "Seed Bag (Gasha)",
	inventory_image = "hyruletools_seedbag_blue.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		if pointed_thing.type == "node" and
				minetest.get_node(pointed_thing.above).name == "air" then
			if not minetest.is_protected(pointed_thing.above, player) then
				minetest.set_node(pointed_thing.above, {name="default:sapling"})
			else
				minetest.chat_send_player(player, "This area is protected.")
			end
		end

		item:take_item()
	return item
	end
})

minetest.register_craftitem("hyruletools:seed_scent", {
	description = "Seed Bag (Scent)",
	inventory_image = "hyruletools_seedbag_orange.png",
	on_use = function(item, placer)
		local playerpos = placer:getpos();
		local dir = placer:get_look_dir();
		local obj = minetest.env:add_entity({x=playerpos.x+3+dir.x,y=playerpos.y+3+dir.y,z=playerpos.z+3+dir.z}, "mobs:deku_baba")

		item:take_item()
	return item
	end
})

minetest.register_craftitem("hyruletools:seed_pegasus", {
	description = "Seed Bag (Pegasus)",
	inventory_image = "hyruletools_seedbag_green2.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		playereffects.apply_effect_type("potion_speed_lv1", 5, user)
		item:take_item()
	return item
	end
})

minetest.register_craftitem("hyruletools:rocfeather", {
	description = "roc's feather",
	inventory_image = "hyruletools_feather.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		playereffects.apply_effect_type("potion_antigrav_lvx", 10, user)
		item:take_item()
	return item
	end
})

minetest.register_craftitem("hyruletools:seed_gale", {
	description = "Seed Bag (Gale)",
	inventory_image = "hyruletools_seedbag_cyan.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		if minetest.setting_getbool("enable_weather") then	
		hyrule_weather.weather = "pollen"
		hyrule_weather.current = 4
		else
		minetest.chat_send_player(player, "weather not enabled!")
		end
		item:take_item()
	return item
	end
})

minetest.register_craft({
	output = 'hyruletools:seed_mystery',
	recipe = {
		{'', '', ''},
		{'', 'flowers:waterlily', ''},
		{'', 'hyruletools:seed_satchel', ''},
	}
})

minetest.register_craft({
	output = 'hyruletools:seed_fire',
	recipe = {
		{'', '', ''},
		{'', 'flowers:rose', ''},
		{'', 'hyruletools:seed_satchel', ''},
	}
})

minetest.register_craft({
	output = 'hyruletools:seed_gasha',
	recipe = {
		{'', '', ''},
		{'', 'flowers:geranium', ''},
		{'', 'hyruletools:seed_satchel', ''},
	}
})

minetest.register_craft({
	output = 'hyruletools:seed_gale',
	recipe = {
		{'', '', ''},
		{'', 'flowers:tulip', ''},
		{'', 'hyruletools:seed_satchel', ''},
	}
})

minetest.register_craft({
	output = 'hyruletools:seed_pegasus',
	recipe = {
		{'', '', ''},
		{'', 'flowers:viola', ''},
		{'', 'hyruletools:seed_satchel', ''},
	}
})

minetest.register_craft({
	output = 'hyruletools:seed_scent',
	recipe = {
		{'', '', ''},
		{'', 'flowers:dandelion_yellow', ''},
		{'', 'hyruletools:seed_satchel', ''},
	}
})

minetest.register_entity("hyruletools:boomer", {
	visual = "mesh",
	mesh = "boomerang.b3d",
	textures = {"hyruletools_boomerang_tex.png"},
	physical = true,
	velocity = 15,
	acceleration = -5,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_activate = function(self)		
		local remove = minetest.after(3, function() 
		self.object:remove()
		end)
		self.object:set_animation({x=2, y=19}, 30, 0)
		-- returning from experience mod by jordan4ibanez (dwtfywt)
		minetest.after(1.5, function()
			if self.thrower ~= nil then
			local pos2 = self.object:getpos()
			local pos1 = self.thrower:getpos()
			if pos1 ~= nil and pos2 ~= nil then
			local vec = {x=pos1.x-pos2.x, y=pos1.y-pos2.y, z=pos1.z-pos2.z}
			vec.x = vec.x/1.5
			vec.y = vec.y/1.5
			vec.z = vec.z/1.5
			self.object:setvelocity(vec)
			end
			end
		end)
	end,
	on_step = function(self, obj, pos)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:boomer" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=1},
						}, nil)
						self.object:remove()
					end
				end
			end
	end,
})

minetest.register_node("hyruletools:boomerang", {
	description = "Boomerang",
	inventory_image = "hyruletools_boomer.png",
	wield_image = "hyruletools_boomer.png",
	tiles = {
		"hyruletools_boomer.png",
		"hyruletools_boomer.png",
		"hyruletools_boomerang_tex.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.25, 0.5, -0.4375, 0.3125}, -- NodeBox1
			{-0.4375, -0.5, 0.3125, 0.4375, -0.4375, 0.375}, -- NodeBox2
			{-0.5, -0.5, 0.375, 0.375, -0.4375, 0.4375}, -- NodeBox3
			{-0.5, -0.5, 0.4375, 0.3125, -0.4375, 0.5}, -- NodeBox4
			{0.1875, -0.5, 0.1875, 0.25, -0.4375, 0.25}, -- NodeBox5
			{0.25, -0.5, -0.375, 0.3125, -0.4375, 0.25}, -- NodeBox6
			{0.3125, -0.5, -0.4375, 0.375, -0.4375, 0.25}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, -0.4375, 0.25}, -- NodeBox8
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	on_use = function(item, placer, pointed_thing)
			local add = minetest.after(3, function()
			local pos = placer:getpos()
			minetest.add_item(pos, {name = "hyruletools:boomerang"})
			end)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:boomer")
			local vec = {x=dir.x*8,y=dir.y*8,z=dir.z*8}
			obj:setvelocity(vec)
			local acc = {x=dir.x*-6,y=dir.y*-6,z=dir.z*-6}
			--obj:setacceleration(acc)
			local object = obj:get_luaentity()
			object.thrower = placer
				item:take_item()
			return item
	end,
})

minetest.register_entity("hyruletools:sboomer", {
	visual = "mesh",
	mesh = "boomerang.b3d",
	textures = {"hyruletools_boomerang_tex2.png"},
	velocity = 15,
	acceleration = -5,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_activate = function(self)
		self.object:set_animation({x=2, y=19}, 30, 0)
		-- returning from experience mod by jordan4ibanez (dwtfywt)
		minetest.after(2.6, function()
			if self.thrower ~= nil then
			self.returning = true
			local pos2 = self.object:getpos()
			local pos1 = self.thrower:getpos()
			if pos1 ~= nil and pos2 ~= nil then
			local vec = {x=pos1.x-pos2.x, y=pos1.y-pos2.y, z=pos1.z-pos2.z}
			vec.x = vec.x/1.5
			vec.y = vec.y/1.5
			vec.z = vec.z/1.5
			self.object:setvelocity(vec)
			end
			end
		end)
	end,
	on_step = function(self, obj, pos)		
		local remove = minetest.after(4, function() 
		self.object:remove()
		end)
		if self.thrower ~= nil and not self.returning then
		local dir = self.thrower:get_look_dir();
		local vec = {x=dir.x*5,y=dir.y*5,z=dir.z*5}
		local yaw = self.thrower:get_look_yaw();
		self.object:setyaw(yaw+math.pi/2)
		self.object:setvelocity(vec)
		end
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:sboomer" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=2},
						}, nil)
						self.object:remove()
					end
				end
			end
		local apos = self.object:getpos()
		for i=1,3 do
		minetest.after(i*0.1, function()
		minetest.add_particle({
			pos = {x=apos.x, y=apos.y, z=apos.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=math.random(-5,5)/10, z=0},
			expirationtime = math.random(5,10)/10,
			size = math.random(5,10)/10,
			collisiondetection = false,
			collisionremoval = false,
			vertical = false,
			texture = "hyruletools_star.png",
			glow = 9
		})
		end)
		end
	end,
})

minetest.register_node("hyruletools:boomerang_steel", {
	description = "Magic Boomerang",
	inventory_image = "hyruletools_boomer_steel.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	wield_image = "hyruletools_boomer_steel.png",
	tiles = {
		"hyruletools_boomer_steel.png",
		"hyruletools_boomer_steel.png",
		"hyruletools_boomerang_tex2.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.25, 0.5, -0.4375, 0.3125}, -- NodeBox1
			{-0.4375, -0.5, 0.3125, 0.4375, -0.4375, 0.375}, -- NodeBox2
			{-0.5, -0.5, 0.375, 0.375, -0.4375, 0.4375}, -- NodeBox3
			{-0.5, -0.5, 0.4375, 0.3125, -0.4375, 0.5}, -- NodeBox4
			{0.1875, -0.5, 0.1875, 0.25, -0.4375, 0.25}, -- NodeBox5
			{0.25, -0.5, -0.375, 0.3125, -0.4375, 0.25}, -- NodeBox6
			{0.3125, -0.5, -0.4375, 0.375, -0.4375, 0.25}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, -0.4375, 0.25}, -- NodeBox8
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
	on_use = function(item, placer, pointed_thing)
			local add = minetest.after(4, function()
			local pos = placer:getpos()
			minetest.add_item(pos, {name = "hyruletools:boomerang_steel"})
			end)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:sboomer")
			local vec = {x=dir.x*10,y=dir.y*10,z=dir.z*10}
			obj:setvelocity(vec)
			local acc = {x=dir.x*-6,y=dir.y*-6,z=dir.z*-6}
			obj:setacceleration(acc)
			local object = obj:get_luaentity()
			object.thrower = placer
				item:take_item()
			return item
	end,
})

minetest.register_entity("hyruletools:gboomer", {
	visual = "mesh",
	mesh = "boomerang.b3d",
	textures = {"hyruletools_boomerang_tex3.png"},
	physical = true,
	velocity = 15,
	acceleration = -5,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_activate = function(self)		
		local remove = minetest.after(3, function() 
		self.object:remove()
		if self.thrower ~= nil then
		local pos3 = self.thrower:getpos()
				local obj2 = minetest.env:add_entity(pos3, "__builtin:item")
				obj2:get_luaentity():set_item(self.item)
		end
		end)
		self.object:set_animation({x=2, y=19}, 30, 0)
		-- returning from experience mod by jordan4ibanez (dwtfywt)
		minetest.after(1.5, function()
			if self.thrower ~= nil then
			local pos2 = self.object:getpos()
			local pos1 = self.thrower:getpos()
			if pos1 ~= nil and pos2 ~= nil then
			local vec = {x=pos1.x-pos2.x, y=pos1.y-pos2.y, z=pos1.z-pos2.z}
			vec.x = vec.x/1.5
			vec.y = vec.y/1.5
			vec.z = vec.z/1.5
			self.object:setvelocity(vec)
			end
			end
		end)
	end,
	on_step = function(self, obj, pos)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:gboomer" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=1},
						}, nil)
						self.object:remove()
					elseif obj:get_luaentity().name == "__builtin:item" then
						self.item = obj:get_luaentity().itemstring
						obj:remove()
						self.object:remove()
					end
				end
			end
		local apos = self.object:getpos()
		local part = minetest.add_particlespawner(
			1, --amount
			0.3, --time
			{x=apos.x-0.1, y=apos.y-0.1, z=apos.z-0.1}, --minpos
			{x=apos.x+0.1, y=apos.y+0.1, z=apos.z+0.1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=-0.5,z=0}, --minacc
			{x=0.5,y=0.5,z=0.5}, --maxacc
			0.2, --minexptime
			0.5, --maxexptime
			0.5, --minsize
			1, --maxsize
			false, --collisiondetection
			"hyruletools_wind.png" --texture
		)
	end,
})

minetest.register_tool("hyruletools:gboomerang", {
	description = "Gale Boomerang",
	inventory_image = "hyruletools_boomer_gale.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
		local name = placer:get_player_name()
		if mana.subtract(name, 15) then
			local add = minetest.after(3, function()
			local pos = placer:getpos()
			minetest.add_item(pos, {name = "hyruletools:gboomerang"})
			end)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:gboomer")
			local vec = {x=dir.x*8,y=dir.y*8,z=dir.z*8}
			obj:setvelocity(vec)
			local acc = {x=dir.x*-6,y=dir.y*-6,z=dir.z*-6}
			--obj:setacceleration(acc)
			local object = obj:get_luaentity()
			object.thrower = placer
				item:take_item()
			return item
		end
	end,
})

minetest.register_craft({
	output = 'hyruletools:boomerang',
	recipe = {
		{'', '', 'default:diamond'},
		{'', '', 'default:diamond'},
		{'default:diamond', 'default:diamond', 'default:diamond'},
	}
})

minetest.register_craft({
	output = 'hyruletools:boomerang_steel',
	recipe = {
		{'', '', 'default:diamond'},
		{'', 'hyruletools:magic_powder', 'default:diamond'},
		{'default:diamond', 'default:diamond', 'default:diamond'},
	}
})

-- minetest.register_entity("hyruletools:gboomer", {
	-- textures = {"hyruletools_tornado.png"},
	-- velocity = 20,
	-- acceleration = -15,
	-- damage = 2,
	-- collisionbox = {0, 0, 0, 0, 0, 0},
	-- on_step = function(self, obj, pos, player)		
		-- local remove = minetest.after(4, function() 
		-- self.object:remove()
		-- end)
		-- local player = minetest.get_connected_players()
		-- local inv = player.get_inventory
		-- local pos = self.object:getpos()
		-- local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			-- for k, obj in pairs(objs) do
				-- if obj:get_luaentity() and obj:get_luaentity().name == "__builtin:item" then
					-- if inv and inv:room_for_item("main", ItemStack(obj:get_luaentity().itemstring)) then
						-- minetest.after(5, function() inv:add_item("main", ItemStack(obj:get_luaentity().itemstring))
						-- if obj:get_luaentity().itemstring ~= "" then
							-- minetest.sound_play("item_drop_pickup", {pos = pos, gain = 0.3, max_hear_distance = 16})
						-- end
						-- obj:get_luaentity().itemstring = ""
						-- obj:remove()
					-- end)
					-- end
				-- end
				
				-- end
			
		-- local apos = self.object:getpos()
		-- local part = minetest.add_particlespawner(
			-- 2, --amount
			-- 0.3, --time
			-- {x=apos.x-0.3, y=apos.y-0.3, z=apos.z-0.3}, --minpos
			-- {x=apos.x+0.3, y=apos.y+0.3, z=apos.z+0.3}, --maxpos
			-- {x=-0, y=-0, z=-0}, --minvel
			-- {x=0, y=0, z=0}, --maxvel
			-- {x=0,y=-0.5,z=0}, --minacc
			-- {x=0.5,y=0.5,z=0.5}, --maxacc
			-- 0.5, --minexptime
			-- 1, --maxexptime
			-- 1, --minsize
			-- 1.5, --maxsize
			-- false, --collisiondetection
			-- "hyruletools_wind.png" --texture
		-- )
	-- end,
-- })

-- minetest.register_tool("hyruletools:boomerang_gale", {
	-- description = "Gale Boomerang",
	-- inventory_image = "hyruletools_boomer_gale.png",
	-- wield_scale = {x = 1.5, y = 1.5, z = 1},
	-- tool_capabilities = {
		-- full_punch_interval = 0.7,
		-- max_drop_level=1,
		-- groupcaps={
			-- snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		-- },
		-- damage_groups = {fleshy=1},
	-- },
	-- on_use = function(item, placer, pointed_thing)
			-- local add = minetest.after(4, function()
			-- local pos = placer:getpos()
			-- minetest.add_item(pos, {name = "hyruletools:boomerang_gale"})
			-- end)
			-- local dir = placer:get_look_dir();
			-- local playerpos = placer:getpos();
			-- local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:gboomer")
			-- local vec = {x=dir.x*10,y=dir.y*10,z=dir.z*10}
			-- obj:setvelocity(vec)
			-- local acc = {x=dir.x*-6,y=dir.y*-6,z=dir.z*-6}
			-- obj:setacceleration(acc)
				-- item:take_item()
			-- return item
	-- end,
-- })


minetest.register_node("hyruletools:bomb", {
	description = "Decorative Bomb",
	drawtype = "mesh",
	mesh = "hyruletools_bomb.b3d",
	tiles = {
		"hyruletools_bomb.png",
	},
	collision_box = {
	type = "fixed",
	fixed = { -0.3, -0.5, -0.3, 0.3, 0.2, 0.3 }
	},
	selection_box = {
	type = "fixed",
	fixed = { -0.3, -0.5, -0.3, 0.3, 0.2, 0.3 }
	},
	paramtype = "light",
	groups = {cracky=1},

})

--[[
minetest.register_node("hyruletools:bomb_flower", {
	description = "decorative bomb flower",
	drawtype = "mesh",
	mesh = "hyruletools_bomb.b3d",
	tiles = {
		"hyruletools_bombflower.png",
	},
	paramtype = "light",
	groups = {cracky=1},
	collisionbox = {
	type = "fixed",
	fixed = { -0.1, -0.1, -0.1, 0.1, 0.1, 0.1 }
},
	selectionbox = {
	type = "fixed",
	fixed = { -0.1, -0.1, -0.1, 0.1, 0.1, 0.1 }
}
})
--]]

tnt.register_tnt({
	name = "hyruletools:bomb_flower",
	description = "Bomb Flower",
	drawtype = "mesh",
	mesh = "hyruletools_bomb.b3d",
	tiles = {
		"hyruletools_bombflower.png",
	},
	collision_box = {
	type = "fixed",
	fixed = { -0.3, -0.5, -0.3, 0.3, 0.2, 0.3 }
	},
	selection_box = {
	type = "fixed",
	fixed = { -0.3, -0.5, -0.3, 0.3, 0.2, 0.3 }
	},
	radius = 2,
	--on_construct = function(pos, node)
		--minetest.env:set_node(pos, {name="hyruletools:bomb_flower_burning"})
	--end,
	on_rightclick = function(pos, node)
		minetest.env:set_node(pos, {name="hyruletools:bomb_plant"})
		minetest.env:add_item(pos, "tnt:tnt")
	end,
})

minetest.register_node("hyruletools:bomb_plant", {
	description = "Decorative Bomb Flower",
	drawtype = "mesh",
	mesh = "hyruletools_bomb.b3d",
	tiles = {
		"hyruletools_bombflower_plant.png",
	},
	paramtype = "light",
	groups = {snappy=1, oddly_breakable_by_hand=1},
	collision_box = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 0.5, -0.5, 0.5 }
},
	selection_box = {
	type = "fixed",
	fixed = { -0.2, -0.5, -0.2, 0.2, -0.4, 0.2 }
}
})

minetest.register_abm({
	nodenames = {"hyruletools:bomb_plant"},
	interval = 30,
	chance = 5,
	action = function(pos, node)
		minetest.env:set_node(pos, {name="hyruletools:bomb_flower"})
	end
})

--[[
minetest.register_entity("hyruletools:chain", {
	textures = {"hyruletools_hook.png"},
	velocity = 15,
	acceleration = -5,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self)		
		local remove_ent = minetest.after(1, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius(pos, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:chain" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=2.0,
							damage_groups={fleshy=1},
						}, nil)
					end
				end
				
				end
		
		if minetest.get_item_group(minetest.get_node(pos).name, "hook") ~= 0 or minetest.get_item_group(minetest.get_node(pos).name, "choppy") ~= 0 then 
			if minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name == "air" then
				self.launcher:setpos({x=pos.x+1, y=pos.y, z=pos.z})
				self.object:remove()
			elseif minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name == "air" then
				self.launcher:setpos({x=pos.x-1, y=pos.y, z=pos.z})
				self.object:remove()
			elseif minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name == "air" then
				self.launcher:setpos({x=pos.x, y=pos.y, z=pos.z+1})
				self.object:remove()
			elseif minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name == "air" then
				self.launcher:setpos({x=pos.x, y=pos.y, z=pos.z-1})
				self.object:remove()
			end
		end
		
		local part = minetest.add_particlespawner(
			5, --amount
			0.2, --time
			{x=pos.x, y=pos.y, z=pos.z}, --minpos
			{x=pos.x, y=pos.y, z=pos.z}, --maxpos
			{x=0, y=0, z=0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			1, --minexptime
			1, --maxexptime
			1, --minsize
			1, --maxsize
			false, --collisiondetection
			"hyruletools_chain.png" --texture
		)
	end,
})

minetest.register_entity("hyruletools:chain_2", {
	textures = {"hyruletools_hook_gold.png"},
	velocity = 15,
	acceleration = -5,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self)		
		local remove_ent = minetest.after(2, function() 
		self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius(pos, 2)	
			for _, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyruletools:chain_2" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=2.0,
							damage_groups={fleshy=2},
						}, nil)
					end
				end
				
				end
		
		if minetest.get_item_group(minetest.get_node(pos).name, "hook") ~= 0 or minetest.get_item_group(minetest.get_node(pos).name, "choppy") ~= 0 then 
			if minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name == "air" then
				self.launcher:setpos({x=pos.x+1, y=pos.y, z=pos.z})
				self.object:remove()
			elseif minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name == "air" then
				self.launcher:setpos({x=pos.x-1, y=pos.y, z=pos.z})
				self.object:remove()
			elseif minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name == "air" then
				self.launcher:setpos({x=pos.x, y=pos.y, z=pos.z+1})
				self.object:remove()
			elseif minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name == "air" then
				self.launcher:setpos({x=pos.x, y=pos.y, z=pos.z-1})
				self.object:remove()
			end
		end
		
		local part = minetest.add_particlespawner(
			10, --amount
			0.2, --time
			{x=pos.x, y=pos.y, z=pos.z}, --minpos
			{x=pos.x, y=pos.y, z=pos.z}, --maxpos
			{x=0, y=0, z=0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			1, --minexptime
			1, --maxexptime
			1, --minsize
			1, --maxsize
			false, --collisiondetection
			"hyruletools_chain.png" --texture
		)
	end,
})

minetest.register_tool("hyruletools:hookshot", {
	description = "Clawshot",
	inventory_image = "hyruletools_hookshot.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:chain")
			local vec = {x=dir.x*10,y=dir.y*10,z=dir.z*10}
			obj:setvelocity(vec)
			local acc = {x=dir.x*-6,y=dir.y*-6,z=dir.z*-6}
			obj:setacceleration(acc)
			local object = obj:get_luaentity()
			object.launcher = placer
			return item
	end,
})

minetest.register_tool("hyruletools:hookshot_2", {
	description = "Gold Clawshot",
	inventory_image = "hyruletools_hookshot_gold.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:chain_2")
			local vec = {x=dir.x*12,y=dir.y*12,z=dir.z*12}
			obj:setvelocity(vec)
			local acc = {x=dir.x*-6,y=dir.y*-6,z=dir.z*-6}
			obj:setacceleration(acc)
			local object = obj:get_luaentity()
			object.launcher = placer
			return item
	end,
})
]]


--Modified from enchanting table (xdecor) Copyright (c) 2015-2016 kilbith GPLv3
minetest.register_entity("hyruletools:swordent", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_sword.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}
		local facedir = minetest.get_node(pos_under).param2
		local dir = minetest.facedir_to_dir(facedir)
		local yaw = math.atan(dir.x/dir.z)
		self.object:setyaw(yaw)

		
		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_used" then
			self.object:remove()
		end
		if minetest.get_node(pos_under).name == "hyruletools:swordstand" then
			self.object:remove()
		end
	end
})
minetest.register_entity("hyruletools:ruby", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_firestone.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}
		local facedir = minetest.get_node(pos_under).param2
		local dir = minetest.facedir_to_dir(facedir)
		local yaw = math.atan(dir.x/dir.z)
		self.object:setyaw(yaw)

		
		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_ruby" then
			self.object:remove()
		end
		if minetest.get_node(pos_under).name == "hyruletools:swordstand" then
			self.object:remove()
		end
	end
})
minetest.register_entity("hyruletools:sapphire", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_waterstone.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}
		local facedir = minetest.get_node(pos_under).param2
		local dir = minetest.facedir_to_dir(facedir)
		local yaw = math.atan(dir.x/dir.z)
		self.object:setyaw(yaw)


		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_sapphire" then
			self.object:remove()
		end
		if minetest.get_node(pos_under).name == "hyruletools:swordstand" then
			self.object:remove()
		end
	end
})
minetest.register_entity("hyruletools:emerald", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_foreststone.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}
		local facedir = minetest.get_node(pos_under).param2
		local dir = minetest.facedir_to_dir(facedir)
		local yaw = math.atan(dir.x/dir.z)
		self.object:setyaw(yaw)


		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_emerald" then
			self.object:remove()
		end
		if minetest.get_node(pos_under).name == "hyruletools:swordstand" then
			self.object:remove()
		end
	end
})

minetest.register_entity("hyruletools:swordent_mese", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_mesesword.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}
		local facedir = minetest.get_node(pos_under).param2
		local dir = minetest.facedir_to_dir(facedir)
		local yaw = math.atan(dir.x/dir.z)
		self.object:setyaw(yaw)

		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_mese" then
			self.object:remove()
		end
		if minetest.get_node(pos_under).name == "hyruletools:swordstand" then
			self.object:remove()
		end
	end
})

minetest.register_entity("hyruletools:swordent_bronze", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_bronzesword.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}
		local facedir = minetest.get_node(pos_under).param2
		local dir = minetest.facedir_to_dir(facedir)
		local yaw = math.atan(dir.x/dir.z)
		self.object:setyaw(yaw)


		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_bronze" then
			self.object:remove()
		end
		if minetest.get_node(pos_under).name == "hyruletools:swordstand" then
			self.object:remove()
		end
	end
})

minetest.register_entity("hyruletools:swordent_diamond", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_diamondsword.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}
		local facedir = minetest.get_node(pos_under).param2
		local dir = minetest.facedir_to_dir(facedir)
		local yaw = math.atan(dir.x/dir.z)
		self.object:setyaw(yaw)


		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_diamond" then
			self.object:remove()
		end
		if minetest.get_node(pos_under).name == "hyruletools:swordstand" then
			self.object:remove()
		end
	end
})

minetest.register_entity("hyruletools:swordent_steel", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_steelsword.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}
		local facedir = minetest.get_node(pos_under).param2
		local dir = minetest.facedir_to_dir(facedir)
		local yaw = math.atan(dir.x/dir.z)
		self.object:setyaw(yaw)


		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_steel" then
			self.object:remove()
		end
		if minetest.get_node(pos_under).name == "hyruletools:swordstand" then
			self.object:remove()
		end
	end
})

minetest.register_entity("hyruletools:swordent_stone", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_stonesword.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}
		local facedir = minetest.get_node(pos_under).param2
		local dir = minetest.facedir_to_dir(facedir)
		local yaw = math.atan(dir.x/dir.z)
		self.object:setyaw(yaw)


		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_stone" then
			self.object:remove()
		end
		if minetest.get_node(pos_under).name == "hyruletools:swordstand" then
			self.object:remove()
		end
	end
})

minetest.register_entity("hyruletools:swordent_wood", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_woodsword.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}
		local facedir = minetest.get_node(pos_under).param2
		local dir = minetest.facedir_to_dir(facedir)
		local yaw = math.atan(dir.x/dir.z)
		self.object:setyaw(yaw)


		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_wood" then
			self.object:remove()
		end
		if minetest.get_node(pos_under).name == "hyruletools:swordstand" then
			self.object:remove()
		end
	end
})



minetest.register_node("hyruletools:swordstand", {
	description = "mastersword stand",
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:sword" then
			minetest.set_node(pos, {name="hyruletools:swordstand_used", param2=node.param2})
			minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent")
			item:take_item()
		elseif wield_item == "hyruletools:firestone" then
			minetest.set_node(pos, {name="hyruletools:swordstand_ruby", param2=node.param2})
			minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:ruby") 
			item:take_item()
		elseif wield_item == "hyruletools:waterstone" then
			minetest.set_node(pos, {name="hyruletools:swordstand_sapphire", param2=node.param2})
			minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:sapphire")
			item:take_item()
		elseif wield_item == "hyruletools:foreststone" then
			minetest.set_node(pos, {name="hyruletools:swordstand_emerald", param2=node.param2})
			minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:emerald")
			item:take_item()
		elseif wield_item == "default:sword_steel" then
			minetest.set_node(pos, {name="hyruletools:swordstand_steel", param2=node.param2})
			minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_steel")
			item:take_item()
		elseif wield_item == "default:sword_bronze" then
			minetest.set_node(pos, {name="hyruletools:swordstand_bronze", param2=node.param2})
			minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_bronze")
			item:take_item()
		elseif wield_item == "default:sword_mese" then
			minetest.set_node(pos, {name="hyruletools:swordstand_mese", param2=node.param2})
			minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_mese")
			item:take_item()
		elseif wield_item == "default:sword_diamond" then
			minetest.set_node(pos, {name="hyruletools:swordstand_diamond", param2=node.param2})
			minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_diamond")
			item:take_item()
		elseif wield_item == "default:sword_stone" then
			minetest.set_node(pos, {name="hyruletools:swordstand_stone", param2=node.param2})
			minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_stone")
			item:take_item()
		elseif wield_item == "default:sword_wood" then
			minetest.set_node(pos, {name="hyruletools:swordstand_wood", param2=node.param2})
			minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_wood")
			item:take_item()
		end
	end,
})

minetest.register_craft({
	output = 'hyruletools:swordstand',
	recipe = {
		{'', '', ''},
		{'quartz:quartz_crystal', 'quartz:quartz_crystal', 'quartz:quartz_crystal'},
		{'quartz:quartz_crystal', 'quartz:quartz_crystal', 'quartz:quartz_crystal'},
	}
})

minetest.register_node("hyruletools:swordstand_used", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_construct = function(pos)
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent")
	end,
	on_destruct = function(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "hyruletools:swordent" then
			obj:remove()
		end
	end
	end,
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:sword")
			minetest.set_node(pos, {name="hyruletools:swordstand", param2=node.param2})
	end
})

minetest.register_node("hyruletools:swordstand_mese", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_construct = function(pos)
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_mese")
	end,
	on_destruct = function(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "hyruletools:swordent_mese" then
			obj:remove()
		end
	end
	end,
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "default:sword_mese")
			minetest.set_node(pos, {name="hyruletools:swordstand", param2=node.param2})
	end
})

minetest.register_node("hyruletools:swordstand_diamond", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_construct = function(pos)
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_diamond")
	end,
	on_destruct = function(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "hyruletools:swordent_diamond" then
			obj:remove()
		end
	end
	end,
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "default:sword_diamond")
			minetest.set_node(pos, {name="hyruletools:swordstand", param2=node.param2})
	end
})

minetest.register_node("hyruletools:swordstand_steel", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_construct = function(pos)
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_steel")
	end,
	on_destruct = function(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "hyruletools:swordent_steel" then
			obj:remove()
		end
	end
	end,
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "default:sword_steel")
			minetest.set_node(pos, {name="hyruletools:swordstand", param2=node.param2})
	end
})

minetest.register_node("hyruletools:swordstand_bronze", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_construct = function(pos)
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_bronze")
	end,
	on_destruct = function(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "hyruletools:swordent_bronze" then
			obj:remove()
		end
	end
	end,
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "default:sword_bronze")
			minetest.set_node(pos, {name="hyruletools:swordstand", param2=node.param2})
	end
})

minetest.register_node("hyruletools:swordstand_stone", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_construct = function(pos)
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_stone")
	end,
	on_destruct = function(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "hyruletools:swordent_stone" then
			obj:remove()
		end
	end
	end,
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "default:sword_stone")
			minetest.set_node(pos, {name="hyruletools:swordstand", param2=node.param2})
	end
})

minetest.register_node("hyruletools:swordstand_wood", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_construct = function(pos)
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:swordent_wood")
	end,
	on_destruct = function(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "hyruletools:swordent_wood" then
			obj:remove()
		end
	end
	end,
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "default:sword_wood")
			minetest.set_node(pos, {name="hyruletools:swordstand", param2=node.param2})
	end
})

minetest.register_node("hyruletools:swordstand_ruby", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_construct = function(pos)
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:ruby")
	end,
	on_destruct = function(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "hyruletools:ruby" then
			obj:remove()
		end
	end
	end,
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:firestone")
			minetest.set_node(pos, {name="hyruletools:swordstand", param2=node.param2})
	end
})

minetest.register_node("hyruletools:swordstand_sapphire", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_construct = function(pos)
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:sapphire")
	end,
	on_destruct = function(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "hyruletools:sapphire" then
			obj:remove()
		end
	end
	end,
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:waterstone")
			minetest.set_node(pos, {name="hyruletools:swordstand", param2=node.param2})
	end
})

minetest.register_node("hyruletools:swordstand_emerald", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
	"hyruletools_stand.png",
	"hyruletools_stand_side.png",
	},
	paramtype = "light",
	node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	on_construct = function(pos)
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:emerald")
	end,
	on_destruct = function(pos)
	for _, obj in pairs(minetest.get_objects_inside_radius(pos, 0.9)) do
		if obj and obj:get_luaentity() and
				obj:get_luaentity().name == "hyruletools:emerald" then
			obj:remove()
		end
	end
	end,
	groups = {cracky=1},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:foreststone")
			minetest.set_node(pos, {name="hyruletools:swordstand", param2=node.param2})
	end
})

minetest.register_craftitem("hyruletools:waterstone", {
	description = "Zora's Sapphire",
	inventory_image = "hyruletools_waterstone.png"
})

minetest.register_craftitem("hyruletools:foreststone", {
	description = "Kokiri's Emerald",
	inventory_image = "hyruletools_foreststone.png"
})

minetest.register_craftitem("hyruletools:firestone", {
	description = "Goron's Ruby",
	inventory_image = "hyruletools_firestone.png"
})

--armour

minetest.register_tool("hyruletools:zora_tunic", {
		description = "Zora Tunic",
		inventory_image = "hyruletools_inv_zora_tunic.png",
		groups = {armor_torso=10, armor_heal=0, armor_use=1000, physics_jump=1.5},
		wear = 0,
	})
	
	minetest.register_tool("hyruletools:goron_tunic", {
		description = "Goron Tunic",
		inventory_image = "hyruletools_inv_goron_tunic.png",
		groups = {armor_torso=10, armor_heal=0, armor_use=1000, armor_fire=1},
		wear = 0,
	})


minetest.register_craft({
	output = 'hyruletools:zora_tunic',
	recipe = {
		{'', 'group:wool', ''},
		{'farming:cotton', 'mobs_loz:scale', 'farming:cotton'},
		{'', 'group:wool', ''},
	}
})
	
minetest.register_craft({
	output = 'hyruletools:goron_tunic',
	recipe = {
		{'', 'group:wool', ''},
		{'farming:cotton', 'default:obsidian_shard', 'farming:cotton'},
		{'', 'group:wool', ''},
	}
})
--eye of truth


minetest.register_craftitem("hyruletools:eye", {
	description = "Eye of Truth",
	inventory_image = "hyruletools_eye.png",
})

minetest.register_craft({
	output = 'hyruletools:eye',
	recipe = {
		{'', 'default:glass', ''},
		{'', 'default:mese_crystal_fragment', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_node("hyruletools:dirt_with_grass_hole", {
	description = "Dirt with Grass (hole)",
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = 'default:dirt',
	walkable = false,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:eye" then
			minetest.set_node(pos, {name="hyruletools:dirt_with_grass_invisible", param2=node.param2})
		end
	end
})

minetest.register_node("hyruletools:dirt_with_grass_invisible", {
	drawtype = "allfaces_optional",
	tiles = {"3d_armor_trans.png",},
	groups = {crumbly = 3, soil = 1},
	drop = 'default:dirt',
	walkable = false,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:eye" then
			minetest.set_node(pos, {name="hyruletools:dirt_with_grass_hole", param2=node.param2})
		end
	end
})

minetest.register_craft({
	output = "hyruletools:dirt_with_grass_hole 1",
	type = "shapeless",
	recipe = {"default:dirt"}
})

end

--icetools



minetest.register_craftitem("hyruletools:ice_fragment", {
	description = "Ice Fragment",
	inventory_image = "hyruletools_ice_shard.png"
})

minetest.register_craft({
	output = "hyruletools:ice_fragment 9",
	type = "shapeless",
	recipe = {"default:ice"}
})

minetest.register_craft({
	output = "default:ice 1",
	recipe = {
		{"hyruletools:ice_fragment", "hyruletools:ice_fragment", "hyruletools:ice_fragment"},
		{"hyruletools:ice_fragment", "hyruletools:ice_fragment", "hyruletools:ice_fragment"},
		{"hyruletools:ice_fragment", "hyruletools:ice_fragment",  "hyruletools:ice_fragment"}
	}
})

minetest.register_tool("hyruletools:wand", {
	description = "Ice Rod",
	inventory_image = "hyruletools_ice_wand.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=10, maxlevel=3},
		},
		damage_groups = {fleshy=0},
	},
	on_use = function(item, placer, pointed_thing)
	local pos = placer:getpos()
	if pointed_thing ~= nil then
		local name = placer:get_player_name()
		if mana.subtract(name, 30) then
		local dir = placer:get_look_dir()
		local obj =  minetest.env:add_entity({x=pos.x+dir.x, y=pos.y+dir.y+0.5, z=pos.z+dir.z}, "hyruletools:block_dummy")
		obj:setvelocity({x=dir.x*8, y=dir.y*8, z=dir.z*8})
		obj:set_properties({textures = {"default_ice.png"},})
		obj:setacceleration({x=-dir.x*2, y=-8, z=-dir.z*2})
		local ice = obj:get_luaentity()
		ice.particles = true
		ice.particletex = "hyruletools_ice_effect.png"
		minetest.after(1, function()
		local pos2 = obj:getpos()
		obj:remove()
		minetest.set_node(pos2, {name="default:ice"})
		end)
		end
	 end
end
})

minetest.register_craft({
	output = 'hyruletools:wand',
	recipe = {
		{'default:diamond'},
		{'hyruletools:ice_fragment'},
		{'hyruletools:ice_fragment'},
	}
})

minetest.register_tool("hyruletools:ice_sword", {
	description = "Ice Sword",
	inventory_image = "hyruletools_ice_sword.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	}
})

minetest.register_tool("hyruletools:ice_axe", {
	description = "Ice Axe",
	inventory_image = "hyruletools_ice_axe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_craft({
	output = 'hyruletools:ice_sword',
	recipe = {
		{'hyruletools:ice_fragment'},
		{'hyruletools:ice_fragment'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'hyruletools:ice_axe',
	recipe = {
		{'hyruletools:ice_fragment', 'hyruletools:ice_fragment'},
		{'hyruletools:ice_fragment', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_tool("hyruletools:obsidian_sword", {
	description = "Dark Sword",
	inventory_image = "hyruletools_obsidian_sword.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=20, maxlevel=4},
		},
		damage_groups = {fleshy=5},
	}
})

minetest.register_craft({
	output = 'hyruletools:obsidian_sword',
	recipe = {
		{'default:obsidian_shard'},
		{'default:obsidian_shard'},
		{'default:stick'},
	}
})

--letters from default books Originally by celeron55, Perttu Ahola <celeron55@gmail.com> (LGPL 2.1)
--Various Minetest developers and contributors (LGPL 2.1)

local lpp = 14 -- Lines per book's page
local function book_on_use(itemstack, user)
	local player_name = user:get_player_name()
	local data = minetest.deserialize(itemstack:get_metadata())
	local title, text, owner = "", "", player_name
	local page, page_max, lines, string = 1, 1, {}, ""

	if data then
		title = data.title
		text = data.text
		owner = data.owner

		for str in (text .. "\n"):gmatch("([^\n]*)[\n]") do
			lines[#lines+1] = str
		end

		if data.page then
			page = data.page
			page_max = data.page_max

			for i = ((lpp * page) - lpp) + 1, lpp * page do
				if not lines[i] then break end
				string = string .. lines[i] .. "\n"
			end
		end
	end

	local formspec
	if owner == player_name then
		formspec = "size[8,8]" .. default.gui_bg ..
			"background[0,0;8,8;hyruletools_paper.png]" ..
			"field[0.5,1;7.5,0;title;Title:;" ..
				minetest.formspec_escape(title) .. "]" ..
			"textarea[0.5,1.5;7.5,7;text;Contents:;" ..
				minetest.formspec_escape(text) .. "]" ..
			"button_exit[2.5,7.5;3,1;save;Save]"
	else
		formspec = "size[8,8]" .. default.gui_bg ..
			"hyruletools_paper.png" ..
			"label[0.5,0.5;by " .. owner .. "]" ..
			"tablecolumns[color;text]" ..
			"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
			"table[0.4,0;7,0.5;title;#FFFF00," .. minetest.formspec_escape(title) .. "]" ..
			"textarea[0.5,1.5;7.5,7;;" ..
				minetest.formspec_escape(string ~= "" and string or text) .. ";]" ..
			"button[2.4,7.6;0.8,0.8;book_prev;<]" ..
			"label[3.2,7.7;Page " .. page .. " of " .. page_max .. "]" ..
			"button[4.9,7.6;0.8,0.8;book_next;>]"
	end

	minetest.show_formspec(player_name, "hyruletools:letter", formspec)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "hyruletools:letter" then return end
	local inv = player:get_inventory()
	local stack = player:get_wielded_item()

	if fields.save and fields.title ~= "" and fields.text ~= "" then
		local new_stack, data
		if stack:get_name() ~= "hyruletools:letter_written" then
			local count = stack:get_count()
			if count == 1 then
				stack:set_name("hyruletools:letter_written")
			else
				stack:set_count(count - 1)
				new_stack = ItemStack("hyruletools:letter_written")
			end
		else
			data = minetest.deserialize(stack:get_metadata())
		end

		if not data then data = {} end
		data.title = fields.title
		data.text = fields.text
		data.text_len = #data.text
		data.page = 1
		data.page_max = math.ceil((#data.text:gsub("[^\n]", "") + 1) / lpp)
		data.owner = player:get_player_name()
		local data_str = minetest.serialize(data)

		if new_stack then
			new_stack:set_metadata(data_str)
			if inv:room_for_item("main", new_stack) then
				inv:add_item("main", new_stack)
			else
				minetest.add_item(player:getpos(), new_stack)
			end
		else
			stack:set_metadata(data_str)
		end

	elseif fields.book_next or fields.book_prev then
		local data = minetest.deserialize(stack:get_metadata())
		if not data or not data.page then
			return
		end

		if fields.book_next then
			data.page = data.page + 1
			if data.page > data.page_max then
				data.page = 1
			end
		else
			data.page = data.page - 1
			if data.page == 0 then
				data.page = data.page_max
			end
		end

		local data_str = minetest.serialize(data)
		stack:set_metadata(data_str)
		book_on_use(stack, player)
	end

	player:set_wielded_item(stack)
end)

minetest.register_craftitem("hyruletools:letter", {
	description = "Letter",
	inventory_image = "hyruletools_letter_inv.png",
	groups = {book = 1, flammable = 3},
	on_use = book_on_use,
})

minetest.register_craftitem("hyruletools:letter_written", {
	description = "Letter With Text",
	inventory_image = "hyruletools_letter_inv.png",
	groups = {book = 1, not_in_creative_inventory = 1, flammable = 3},
	stack_max = 1,
	on_use = book_on_use,
})

minetest.register_craft({
	output = 'hyruletools:letter',
	recipe = {
		{'default:paper', 'default:paper'},
	}
})


minetest.register_craftitem("hyruletools:gameboy", {
	description = "Gameboy",
	inventory_image = "hyruletools_gameboy.png",
	groups = {not_in_creative_inventory=1}
})