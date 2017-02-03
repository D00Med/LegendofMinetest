local experience = nil
local expe = nil
local xp = nil

--License dwtfywt jordan4ibanez

level1 = 50
level1_drop = "bucket:bucket_empty 1"

level2 = 100
level2_drop = "default:steelblock 5"

level3 = 150
level3_drop = "default:goldblock 1"

level4 = 200
level4_drop = "default:ice 5"

level5 = 250
level5_drop = "bucket:bucket_empty 1"

level6 = 300
level6_drop = "default:gravel 10"

level7 = 350
level7_drop = "default:mese 1"

level8 = 400
level8_drop = "default:mese 1"

level9 = 450
level9_drop = "default:mese 1"

level10 = 500
level10_drop = "default:sword_mese 1"



--add an experience orb if player digs node from xp group
minetest.register_on_dignode(function(pos, oldnode, digger)
	namer = oldnode.name
	see_if_mineral = minetest.get_item_group(namer, "xp")
	if see_if_mineral > 0 then
		minetest.env:add_entity(pos, "experience:orb")
	end
end)
--give a new player some xp
minetest.register_on_newplayer(function(player)
	file = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience", "w")
	file:write("0")
	file:close()
end)
--set player's xp level to 0 if they die
minetest.register_on_dieplayer(function(player)
	file = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience", "w")
	file:write("0")
	file:close()
end)
local xp_hud = nil
--hudbar by D00Med
minetest.register_on_joinplayer(function(player)
xp = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience", "r")
				experience = xp:read("*l")
				xp:close()
local playername = player:get_player_name()
player:hud_add({
			hud_elem_type = "statbar",
			position = {x=0.5,y=1},
			size = {x=24, y=24},
			text = "experience_hud_bg.png",
			number = 50,
			alignment = {x=0,y=1},
			offset = {x=-300, y=-10},
			}
		)
xp_hud = player:hud_add({
			hud_elem_type = "statbar",
			position = {x=0.5,y=1},
			size = {x=24, y=24},
			text = "experience_hud.png",
			number = experience/20,
			alignment = {x=0,y=1},
			offset = {x=-300, y=-10},
			}
		)
end)

minetest.register_globalstep(function(dtime)
for _,player in ipairs(minetest.get_connected_players()) do
xp = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience", "r")
				experience = xp:read("*l")
				expe = experience/20
				xp:close()
player:hud_change(xp_hud, "xp_hud", expe)
end
end)

--Allow people to collect orbs
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local pos = player:getpos()
		pos.y = pos.y+0.5
		for _,object in ipairs(minetest.env:get_objects_inside_radius(pos, 1)) do
			if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "experience:orb" then
				--RIGHT HERE ADD IN THE CODE TO UPGRADE PLAYERS 
				object:setvelocity({x=0,y=0,z=0})
				object:get_luaentity().name = "STOP"
				minetest.sound_play("orb", {
					to_player = player:get_player_name(),
				})
				xp = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience", "r")
				experience = xp:read("*l")
				xp:close()
				if experience ~= nil and experience <= 1000 then
					new_xp = experience + 1
					xp_write = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience", "w")
					xp_write:write(new_xp)
					xp_write:close()
					if new_xp == level1 then
						minetest.env:add_item(pos, level1_drop)
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end
					if new_xp == level2 then
						minetest.env:add_item(pos, level2_drop)
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end
					if new_xp == level3 then
						minetest.env:add_item(pos, level3_drop)
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end	
					if new_xp == level4 then
						minetest.env:add_item(pos, level4_drop)
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end	
					if new_xp == level5 then
						minetest.env:add_item(pos, level5_drop)
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end	
					if new_xp == level6 then
						minetest.env:add_item(pos, level6_drop)
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end	
					if new_xp == level7 then
						minetest.env:add_item(pos, level7_drop)
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end	
					if new_xp == level8 then
						minetest.env:add_item(pos, level8_drop)
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end	
					if new_xp == level9 then
						minetest.env:add_item(pos, level9_drop)
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end	
					if new_xp == level10 then
						minetest.env:add_item(pos, level10_drop)
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end	
				end
				object:remove()
			end
		end
		for _,object in ipairs(minetest.env:get_objects_inside_radius(pos, 3)) do
			if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "experience:orb" then
				if object:get_luaentity().collect then
					local pos1 = pos
					pos1.y = pos1.y+0.2
					local pos2 = object:getpos()
					local vec = {x=pos1.x-pos2.x, y=pos1.y-pos2.y, z=pos1.z-pos2.z}
					vec.x = vec.x*3
					vec.y = vec.y*3
					vec.z = vec.z*3
					object:setvelocity(vec)
				end
			end
		end
	end
end)

minetest.register_entity("experience:orb", {
	physical = true,
	timer = 0,
	textures = {"orb.png"},
	visual_size = {x=0.3, y=0.3},
	collisionbox = {-0.17,-0.17,-0.17,0.17,0.17,0.17},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
		self.object:setvelocity({x=0, y=1, z=0})
		self.object:setacceleration({x=0, y=-10, z=0})
	end,
	collect = true,
	on_step = function(self, dtime)
		self.timer = self.timer + dtime
		if (self.timer > 100) then
			self.object:remove()
		end
		local p = self.object:getpos()
		local nn = minetest.env:get_node(p).name
		noder = minetest.env:get_node(p).name
		p.y = p.y - 0.3
		local nn = minetest.env:get_node(p).name
		if not minetest.registered_nodes[nn] or minetest.registered_nodes[nn].walkable then
			if self.physical_state then
				self.object:setvelocity({x=0, y=0, z=0})
				self.object:setacceleration({x=0, y=0, z=0})
				self.physical_state = false
				self.object:set_properties({
					physical = false
				})
			end
		else
			if not self.physical_state then
				self.object:setvelocity({x=0,y=0,z=0})
				self.object:setacceleration({x=0, y=-10, z=0})
				self.physical_state = true
				self.object:set_properties({
					physical = true
				})
			end
		end
	end,
})
