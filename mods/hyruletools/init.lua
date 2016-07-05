if minetest.setting_getbool("loz_mode") then	
minetest.register_craftitem("hyruletools:magic_powder", {
	description = "magicpowder",
	inventory_image = "hyruletools_powder.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local pos = placer:getpos()
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
			"hyruletools_powder4.png" --texture
		)
	end,
})

minetest.register_craft({
	output = "hyruletools:magic_powder 1",
	recipe = {
		{"icetools:ice_fragment", "default:diamond", "icetools:ice_fragment"},
		{"default:diamond", "default:mese_crystal", "default:diamond"},
		{"icetools:ice_fragment", "default:diamond",  "icetools:ice_fragment"}
	}
})

minetest.register_craftitem("hyruletools:heart", {
	description = "heart",
	inventory_image = "hyruletools_heart.png",
	on_use = function(itemstack, player)
	local health = player:get_hp();
	player:set_hp(health+2)
	itemstack:take_item()
	return itemstack
	end,
})


minetest.register_craftitem("hyruletools:triforce", {
	description = "triforce",
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
			"maptools_nyan_coin.png" --texture
		)
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	minetest.env:add_entity(pos, "experience:orb")
	end
})

minetest.register_craftitem("hyruletools:triforce_shard", {
	description = "triforce_shard",
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
	description = "ocarina",
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
	end
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
	description = "red ocarina",
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
		weather.state = "rain"
		else
		minetest.chat_send_player(player, "weather not enabled!")
		end
	end
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
	description = "yellow ocarina",
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
		local obj = minetest.env:add_entity({x=playerpos.x+1+dir.x,y=playerpos.y+1+dir.y,z=playerpos.z+1+dir.z}, "kpgmobs:horseh1")
	end
})

minetest.register_craft({
	output = "hyruletools:ocarina3",
	recipe = {
		{"", "", ""},
		{"", "dye:yellow", ""},
		{"", "hyruletools:ocarina",  ""}
	}
})

minetest.register_craftitem("hyruletools:ocarina4", {
	description = "green ocarina",
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
		local obj = minetest.env:add_entity({x=playerpos.x+1+dir.x,y=playerpos.y+1+dir.y,z=playerpos.z+1+dir.z}, "mobs:deku")
	end
})

minetest.register_craft({
	output = "hyruletools:ocarina4",
	recipe = {
		{"", "", ""},
		{"", "dye:green", ""},
		{"", "hyruletools:ocarina",  ""}
	}
})

minetest.register_node("hyruletools:fire", {
	description = "magical fire",
	drawtype = "plantlike",
	sunlight_propagates = true,
	paramtype = "light",
	light_source = 50,
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
	description = "lantern",
	inventory_image = "hyruletools_lantern.png",
	tool_capabilities = {
		groupcaps = { igniter = {uses=10, maxlevel=1} }
	},
	on_use = function(itemstack, user, pointed_thing)
		local player = user:get_player_name()
		if pointed_thing.type == "node" and
				minetest.get_node(pointed_thing.above).name == "air" then
			if not minetest.is_protected(pointed_thing.above, player) then
				minetest.set_node(pointed_thing.above, {name="fire:basic_flame"})
			else
				minetest.chat_send_player(player, "This area is protected.")
			end
		end

		itemstack:add_wear(1000)
		return itemstack
	end
})

minetest.register_craft({
	output = "hyruletools:lantern",
	recipe = {
		{"", "default:glass", ""},
		{"", "xdecor:candle", ""},
		{"", "default:glass",  ""}
	}
})

minetest.register_tool("hyruletools:mirror", {
	description = "magic mirror (use at your own risk!)",
	inventory_image = "hyruletools_mirror.png",
	tool_capabilities = {
		groupcaps = { igniter = {uses=10, maxlevel=1} }
	},
	on_use = function(itemstack, user, pointed_thing)
		local player = user:get_player_name()
		local pos = math.random(1-900)
		user:setpos({x= pos,y= 5,z= pos})
		itemstack:add_wear(1000)
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
	textures = {"hyruletools_spark.png"},
	velocity = 15,
	on_step = function (self, pos, node, dtime)
				local pos = self.object:getpos()
					local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2) 
                for k, obj in pairs(objs) do
                    if obj:is_player() then
                        return
                    else
                    obj:set_hp(obj:get_hp()-20)					
				    if obj:get_entity_name() ~= "hyruletools:spark" then
						if obj:get_hp()<=0 then 
							obj:remove()
						end
						--self.object:remove() 
					end						
				end
            end

					for dx=-1,1 do
						for dy=-1,1 do
							for dz=-1,1 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= "hyruletools:spark_entity" and n ~="default:stone" and n ~="default:desert_stone"  then	
									if minetest.registered_nodes[n].groups.liquid --[[or math.random(1, 100) <= 1]] then
										minetest.env:set_node(t, {name="default:ice"})
									else 
										minetest.env:set_node(t, {name="air"})
									end
								elseif n == "default:stone" or n =="default:desert_stone" then
									self.hit_node(self, pos, node)
									self.object:remove()
									return
								end
							end
						end
					end
	end,
	
	
	hit_node = function(self, pos, node)
--	local pos = self.object:getpos()
		for dx=-4,4 do
			for dy=-4,4 do
				for dz=-4,4 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(pos).name
					if math.random(1, 50) <= 35 then
						minetest.env:remove_node(p)
					end
					if minetest.registered_nodes[n].groups.flammable or math.random(1, 100) <=5 then
										minetest.env:set_node(t, {name="default:ice"})
					end
					local objects = minetest.env:get_objects_inside_radius(pos, 4)
											for _,obj in ipairs(objects) do
												if obj:is_player() or (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item") then
													local obj_p = obj:getpos()
													local vec = {x=obj_p.x-pos.x, y=obj_p.y-pos.y, z=obj_p.z-pos.z}
													local dist = (vec.x^2+vec.y^2+vec.z^2)^0.5
													local damage = (80*0.5^dist)*2
													obj:punch(obj, 1.0, {
													full_punch_interval=1.0,
													damage_groups={fleshy=damage},
													}, vec)
												end
										end
--[[
                    --This is the particle spawner, but it will slow your pc. If you have a powerful pc you can uncomment this section     
					minetest.add_particlespawner(
			1, --amount
			0.1, --time
			{x=pos.x-3, y=pos.y-3, z=pos.z-3}, --minpos
			{x=pos.x+3, y=pos.y+3, z=pos.z+3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=5,z=-0.5}, --minacc
			{x=0.5,y=5,z=0.5}, --maxacc
			0.1, --minexptime
			1, --maxexptime
			8, --minsize
			15, --maxsize
			false, --collisiondetection
			"tnt_smoke.png" --texture
		)
                        ]]--
				end
			end
		end
	end
})

minetest.register_tool("hyruletools:medallion", {
	description = "ether medallion",
	inventory_image = "hyruletools_medallion.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:spark")
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
		return itemstack
	end,
	light_source = 12,
})

minetest.register_craft({
	output = 'hyruletools:medallion',
	recipe = {
		{'', 'default:copper_ingot', ''},
		{'default:copper_ingot', 'hyruletools:magic_powder', 'default:copper_ingot'},
		{'', 'default:copper_ingot', ''},
	}
})


minetest.register_entity("hyruletools:spark2", {
	textures = {"hyruletools_spark2.png"},
	velocity = 15,
	on_step = function (self, pos, node, dtime)
				local pos = self.object:getpos()
					local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2) 
                for k, obj in pairs(objs) do
                    if obj:is_player() then
                        return
                    else
                    obj:set_hp(obj:get_hp()-20)					
				    if obj:get_entity_name() ~= "hyruletools:spark2" then
						if obj:get_hp()<=0 then 
							obj:remove()
						end
						--self.object:remove() 
					end						
				end
            end

					for dx=-1,1 do
						for dy=-1,1 do
							for dz=-1,1 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= "hyruletools:spark2_entity" and n ~="default:stone" and n ~="default:desert_stone"  then	
									if minetest.registered_nodes[n].groups.flammable --[[or math.random(1, 100) <= 1]] then
										minetest.env:set_node(t, {name="default:clay"})
									else 
										minetest.env:set_node(t, {name="dirt"})
									end
								elseif n == "default:stone" or n =="default:desert_stone" then
									self.hit_node(self, pos, node)
									self.object:remove()
									return
								end
							end
						end
					end
	end,
	
	
	hit_node = function(self, pos, node)
--	local pos = self.object:getpos()
		for dx=-4,4 do
			for dy=-4,4 do
				for dz=-4,4 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(pos).name
					if math.random(1, 50) <= 35 then
						minetest.env:remove_node(p)
					end
					if minetest.registered_nodes[n].groups.flammable or math.random(1, 100) <=5 then
										minetest.env:set_node(t, {name="lavabiome:dirt"})
					end
					local objects = minetest.env:get_objects_inside_radius(pos, 4)
											for _,obj in ipairs(objects) do
												if obj:is_player() or (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item") then
													local obj_p = obj:getpos()
													local vec = {x=obj_p.x-pos.x, y=obj_p.y-pos.y, z=obj_p.z-pos.z}
													local dist = (vec.x^2+vec.y^2+vec.z^2)^0.5
													local damage = (80*0.5^dist)*2
													obj:punch(obj, 1.0, {
													full_punch_interval=1.0,
													damage_groups={fleshy=damage},
													}, vec)
												end
										end
--[[
                    --This is the particle spawner, but it will slow your pc. If you have a powerful pc you can uncomment this section     
					minetest.add_particlespawner(
			1, --amount
			0.1, --time
			{x=pos.x-3, y=pos.y-3, z=pos.z-3}, --minpos
			{x=pos.x+3, y=pos.y+3, z=pos.z+3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=5,z=-0.5}, --minacc
			{x=0.5,y=5,z=0.5}, --maxacc
			0.1, --minexptime
			1, --maxexptime
			8, --minsize
			15, --maxsize
			false, --collisiondetection
			"tnt_smoke.png" --texture
		)
                        ]]--
				end
			end
		end
	end
})
--DO NOT point at the sky, make sure there is stone in the path of the spark or it will continue forever
minetest.register_tool("hyruletools:medallion2", {
	description = "quake medallion",
	inventory_image = "hyruletools_medallion2.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:spark2")
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
		return itemstack
	end,
	light_source = 12,
})

minetest.register_craft({
	output = 'hyruletools:medallion2',
	recipe = {
		{'', 'lavabiome:dirt', ''},
		{'lavabiome:dirt', 'hyruletools:magic_powder', 'lavabiome:dirt'},
		{'', 'lavabiome:dirt', ''},
	}
})


minetest.register_entity("hyruletools:spark3", {
	textures = {"hyruletools_spark3.png"},
	velocity = 15,
	on_step = function (self, pos, node, dtime)
				local pos = self.object:getpos()
					local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2) 
                for k, obj in pairs(objs) do
                    if obj:is_player() then
                        return
                    else
                    obj:set_hp(obj:get_hp()-20)					
				    if obj:get_entity_name() ~= "hyruletools:spark3" then
						if obj:get_hp()<=0 then 
							obj:remove()
						end
						--self.object:remove() 
					end						
				end
            end

					for dx=-1,1 do
						for dy=-1,1 do
							for dz=-1,1 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= "hyruletools:spark3_entity" and n ~="default:dirt_with_grass" and n ~="default:dirt_with_dry_grass" and n ~="default:stone"  then	
									if minetest.registered_nodes[n].groups.flammable --[[or math.random(1, 100) <= 1]] then
										minetest.env:set_node(t, {name="fire:basic_flame"})
									else 
										minetest.env:set_node(t, {name="air"})
									end
								elseif n == "default:stone" or n =="default:desert_stone" or n =="default:dirt_with_grass" or n =="default:dirt_with_dry_grass" then
									self.hit_node(self, pos, node)
									self.object:remove()
									return
								end
							end
						end
					end
	end,
	
	
	hit_node = function(self, pos, node)
--	local pos = self.object:getpos()
		for dx=-4,4 do
			for dy=-4,4 do
				for dz=-4,4 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(pos).name
					if math.random(1, 50) <= 35 then
						minetest.env:remove_node(p)
					end
					if minetest.registered_nodes[n].groups.flammable or math.random(1, 100) <=5 then
										minetest.env:set_node(t, {name="fire:basic_flame"})
					end
					local objects = minetest.env:get_objects_inside_radius(pos, 4)
											for _,obj in ipairs(objects) do
												if obj:is_player() or (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item") then
													local obj_p = obj:getpos()
													local vec = {x=obj_p.x-pos.x, y=obj_p.y-pos.y, z=obj_p.z-pos.z}
													local dist = (vec.x^2+vec.y^2+vec.z^2)^0.5
													local damage = (80*0.5^dist)*2
													obj:punch(obj, 1.0, {
													full_punch_interval=1.0,
													damage_groups={fleshy=damage},
													}, vec)
												end
										end

                    --This is the particle spawner, but it will slow your pc. If you have a powerful pc you can uncomment this section     
					minetest.add_particlespawner(
			1, --amount
			0.3, --time
			{x=pos.x-3, y=pos.y-3, z=pos.z-3}, --minpos
			{x=pos.x+3, y=pos.y+3, z=pos.z+3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=5,z=-0.5}, --minacc
			{x=0.5,y=5,z=0.5}, --maxacc
			0.1, --minexptime
			1, --maxexptime
			8, --minsize
			15, --maxsize
			false, --collisiondetection
			"lavabiome_spark.png" --texture
		)
                        
				end
			end
		end
	end
})

minetest.register_tool("hyruletools:medallion3", {
	description = "bombos medallion",
	inventory_image = "hyruletools_medallion3.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:spark3")
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
		return itemstack
	end,
	light_source = 12,
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
	description = "pendant of power",
	inventory_image = "hyruletools_pendant1.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			8, --minsize
			10, --maxsize
			false, --collisiondetection
			"hyruletools_powder2.png" --texture
		)
	end,
	light_source = 12,
})

minetest.register_tool("hyruletools:pendant2", {
	description = "pendant of courage",
	inventory_image = "hyruletools_pendant2.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			8, --minsize
			10, --maxsize
			false, --collisiondetection
			"hyruletools_powder3.png" --texture
		)
	end,
	light_source = 12,
})

minetest.register_tool("hyruletools:pendant3", {
	description = "pendant of wisdom",
	inventory_image = "hyruletools_pendant3.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			minetest.add_particlespawner(
			5, --amount
			0.1, --time
			{x=playerpos.x-1, y=playerpos.y, z=playerpos.z-1}, --minpos
			{x=playerpos.x+1, y=playerpos.y, z=playerpos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=4,z=-0.5}, --minacc
			{x=0.5,y=4,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			8, --minsize
			10, --maxsize
			false, --collisiondetection
			"hyruletools_powder4.png" --texture
		)
	end,
	light_source = 12,
})

--mobs redo arrow code, see mobs license

minetest.register_entity("hyruletools:swdspark", {
	textures = {"hyruletools_swdbeam.png"},
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
		local part = minetest.add_particlespawner(
			1, --amount
			0.3, --time
			{x=apos.x-0.3, y=apos.y-0.3, z=apos.z-0.3}, --minpos
			{x=apos.x+0.3, y=apos.y+0.3, z=apos.z+0.3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=-0.5,z=0}, --minacc
			{x=0.5,y=0.5,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"hyruletools_swdbeam_trail.png" --texture
		)
	end,
})

--master sword, an edit of Mese sword(see liscence for default)
minetest.register_tool("hyruletools:sword", {
	description = "Master Sword",
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
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+dir.x,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:swdspark")
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
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
		local part = minetest.add_particlespawner(
			1, --amount
			0.3, --time
			{x=apos.x-0.3, y=apos.y-0.3, z=apos.z-0.3}, --minpos
			{x=apos.x+0.3, y=apos.y+0.3, z=apos.z+0.3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=-0.5,z=0}, --minacc
			{x=0.5,y=0.5,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"hyruletools_swdbeam_trail_light.png" --texture
		)
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
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+dir.x,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:swdspark_light")
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
		return itemstack
	end,
})

minetest.register_craft({
	output = 'hyruletools:sword',
	recipe = {
		{'hyruletools:foreststone'},
		{'hyruletools:waterstone'},
		{'hyruletools:firestone'},
	}
})

minetest.register_craftitem("hyruletools:seed_satchel", {
	description = "seed satchet(empty)",
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

minetest.register_craftitem("hyruletools:seed_fire", {
	description = "seed satchet(ember)",
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
	description = "seed satchet(mystery)",
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
	description = "seed satchet(gasha)",
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
	description = "seed satchet(scent)",
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
	description = "seed satchet(pegasus)",
	inventory_image = "hyruletools_seedbag_green2.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(5)
		local spd = user:set_physics_override({

		speed = 3, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1.0, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		local reset = minetest.after(5, function()
			user:set_breath(11)
		end)
		item:take_item()
	return item
	end
})

minetest.register_craftitem("hyruletools:rocfeather", {
	description = "roc's feather",
	inventory_image = "hyruletools_feather.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath_change = user:set_breath(5)
		local spd = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1, -- multiplier to default value
		gravity = 0.2, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		local reset = minetest.after(6, function()
			user:set_breath(11)
			local spd = user:set_physics_override({

		speed = 1.0, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)
		item:take_item()
	return item
	end
})

minetest.register_craftitem("hyruletools:seed_gale", {
	description = "seed satchet(gale)",
	inventory_image = "hyruletools_seedbag_cyan.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		if minetest.setting_getbool("enable_weather") then	
		weather.state = "dust"
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
	textures = {"hyruletools_boomerp.png"},
	velocity = 15,
	acceleration = -5,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)		
		local remove = minetest.after(3, function() 
		self.object:remove()
		end)
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

minetest.register_tool("hyruletools:boomerang", {
	description = "Boomerang",
	inventory_image = "hyruletools_boomer.png",
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
			local add = minetest.after(3, function()
			local pos = placer:getpos()
			minetest.add_item(pos, {name = "hyruletools:boomerang"})
			end)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:boomer")
			local vec = {x=dir.x*8,y=dir.y*8,z=dir.z*8}
			obj:setvelocity(vec)
			local acc = {x=dir.x*-6,y=dir.y*-6,z=dir.z*-6}
			obj:setacceleration(acc)
				item:take_item()
			return item
	end,
})

minetest.register_entity("hyruletools:sboomer", {
	textures = {"hyruletools_boomerps.png"},
	velocity = 15,
	acceleration = -5,
	damage = 2,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, obj, pos)		
		local remove = minetest.after(4, function() 
		self.object:remove()
		end)
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
		local part = minetest.add_particlespawner(
			1, --amount
			0.3, --time
			{x=apos.x-0.3, y=apos.y-0.3, z=apos.z-0.3}, --minpos
			{x=apos.x+0.3, y=apos.y+0.3, z=apos.z+0.3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=-0.5,z=0}, --minacc
			{x=0.5,y=0.5,z=0.5}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			0.5, --minsize
			1, --maxsize
			false, --collisiondetection
			"hyruletools_star.png" --texture
		)
	end,
})

minetest.register_tool("hyruletools:boomerang_steel", {
	description = "Magic Boomerang",
	inventory_image = "hyruletools_boomer_steel.png",
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
			local add = minetest.after(4, function()
			local pos = placer:getpos()
			minetest.add_item(pos, {name = "hyruletools:boomerang_steel"})
			end)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:sboomer")
			local vec = {x=dir.x*10,y=dir.y*10,z=dir.z*10}
			obj:setvelocity(vec)
			local acc = {x=dir.x*-6,y=dir.y*-6,z=dir.z*-6}
			obj:setacceleration(acc)
				item:take_item()
			return item
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
	description = "decorative bomb",
	drawtype = "mesh",
	mesh = "hyruletools_bomb.b3d",
	tiles = {
		"hyruletools_bomb.png",
	},
	collisionbox = {
	type = "fixed",
	fixed = { -0.2, -0.2, -0.2, 0, 0, 0 }
	},
	paramtype = "light",
	groups = {cracky=1},

})

minetest.register_node("hyruletools:bomb_flower", {
	description = "decorative bomb flower",
	drawtype = "mesh",
	mesh = "hyruletools_bombflower.b3d",
	tiles = {
		"hyruletools_bombflower.png",
	},
	paramtype = "light",
	groups = {cracky=1},
	collisionbox = {
	type = "fixed",
	fixed = { -0.2, -0.2, -0.2, 0, 0, 0 }
}
})

-- minetest.register_entity("hyruletools:chain", {
	-- textures = {"hyruletools_hook.png"},
	-- velocity = 15,
	-- acceleration = -5,
	-- damage = 2,
	-- collisionbox = {0, 0, 0, 0, 0, 0},
	-- on_step = function(self, obj, pos, player)		
		-- local remove = minetest.after(1, function() 
		-- self.object:remove()
		-- end)
		-- local player = minetest.get_connected_players()
		-- local inv = player.get_inventory
		-- local pos = self.object:getpos()
		-- local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			-- for k, obj in pairs(objs) do
				-- if obj:get_luaentity() ~= nil then
					-- if obj:get_luaentity().name ~= "hyruletools:chain" and obj:get_luaentity().name ~= "__builtin:item" then
						-- obj:punch(self.object, 1.0, {
							-- full_punch_interval=1.0,
							-- damage_groups={fleshy=1},
						-- }, nil)
						-- self.object:remove()
					-- end
				-- end
				
				-- end
			
		-- local apos = self.object:getpos()
		
		-- local part = minetest.add_particlespawner(
			-- 1, --amount
			-- 0.3, --time
			-- {x=apos.x, y=apos.y, z=apos.z}, --minpos
			-- {x=apos.x, y=apos.y, z=apos.z}, --maxpos
			-- {x=0, y=0, z=0}, --minvel
			-- {x=0, y=0, z=0}, --maxvel
			-- {x=0,y=0,z=0}, --minacc
			-- {x=0,y=0,z=0}, --maxacc
			-- 1, --minexptime
			-- 1, --maxexptime
			-- 1, --minsize
			-- 1, --maxsize
			-- false, --collisiondetection
			-- "hyruletools_chain.png" --texture
		-- )
	-- end,
-- })

-- minetest.register_tool("hyruletools:hookshot", {
	-- description = "hookshot",
	-- inventory_image = "hyruletools_hookshot.png",
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
			-- local dir = placer:get_look_dir();
			-- local playerpos = placer:getpos();
			-- local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:chain")
			-- local vec = {x=dir.x*10,y=dir.y*10,z=dir.z*10}
			-- obj:setvelocity(vec)
			-- local acc = {x=dir.x*-6,y=dir.y*-6,z=dir.z*-6}
			-- obj:setacceleration(acc)
			-- return item
	-- end,
-- })





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

		if minetest.get_node(pos_under).name ~= "hyruletools:swordstand_emerald" then
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
	},
	paramtype = "light",
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
		end
	end,
})

minetest.register_craft({
	output = 'hyruletools:swordstand',
	recipe = {
		{'', '', ''},
		{'quartz:quartz', 'quartz:quartz', 'quartz:quartz'},
		{'quartz:quartz', 'quartz:quartz', 'quartz:quartz'},
	}
})

minetest.register_node("hyruletools:swordstand_used", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
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

minetest.register_node("hyruletools:swordstand_ruby", {
	drawtype = "nodebox",
	tiles = {
	"hyruletools_stand.png",
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