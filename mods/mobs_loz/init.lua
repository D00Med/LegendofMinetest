local path = minetest.get_modpath("mobs_loz")

--optional mobs(loz mode)
if minetest.setting_getbool("loz_mode") then
dofile(path.."/deku_scrub.lua") -- D00Med
dofile(path.."/goron.lua") -- D00Med
dofile(path.."/zora.lua") -- D00Med
dofile(path.."/chuchu.lua") -- D00Med
dofile(path.."/deku_baba.lua") -- D00Med
dofile(path.."/dodongo.lua") -- D00Med
dofile(path.."/stalchid.lua") -- D00Med
dofile(path.."/volvagia.lua") -- D00Med
dofile(path.."/bongobongo.lua") -- D00Med
dofile(path.."/ganon.lua") -- D00Med
dofile(path.."/midna.lua")
dofile(path.."/subrosian.lua") 
dofile(path.."/business_scrub.lua") 
dofile(path.."/hiploop.lua") 
dofile(path.."/redead.lua") 
dofile(path.."/tingle.lua")
dofile(path.."/peahat.lua") 
dofile(path.."/octorock.lua") 
dofile(path.."/poe.lua") 
dofile(path.."/madscrub.lua") 
dofile(path.."/mimic.lua") 
dofile(path.."/zol.lua") 
dofile(path.."/moldorm.lua") 
dofile(path.."/leever.lua")
dofile(path.."/armos.lua")
dofile(path.."/wolfos.lua")
dofile(path.."/darknut.lua")
dofile(path.."/tektite.lua")
dofile(path.."/biri.lua")
dofile(path.."/keese.lua")
dofile(path.."/skulltula.lua")
dofile(path.."/spawns.lua")
end

mobs_loz = {}

mobs_loz.say = function(entity, text)
	--if entity.nametag ~= nil and entity.nametag ~= "" then
	local nametag_old = entity.nametag or nil
	entity.object:set_properties({
		nametag = text,
		nametag_color = "#FFFFFF",
	})
	minetest.after(6, function()
	entity.object:set_properties({
		nametag = nametag_old,
		nametag_color = "#FFFFFF",
	})
	end)
	--end
end

mobs_loz.speech = function(entity, list)
	for _, row in ipairs(list) do
		if row[1] == entity.name then
			local collumn = math.random(2,7)
			if row[collumn] ~= nil then
			mobs_loz.say(entity, row[collumn])
			end
		end
	end
end

mobs_loz.mob_text = {
	--{"name", "text", "text", "text", "text", "text", "text"},
	{"mobs_loz:business_scrub_passive", "*whistle*", "Buy some stuff!", "If you pay me, I will give you something cool", "...", "...", "..."},
	{"mobs_loz:goron", "Watch out for bats", "I will trade rupees", "", "", ""},
	--{"mobs_loz:zora_male", "", "Buy some stuff!", "If you pay me, I will give you something cool", "...", "...", "..."},
	--{"mobs_loz:zora_female", "*whistle*", "Buy some stuff!", "If you pay me, I will give you something cool", "...", "...", "..."},
	{"mobs_loz:subrosian", "I will trade obsidian for ore", "I trade iron lumps for ore", "It's a little empty down here", "I wonder what I'm doing here", "*hums quietly*", "..."},
	{"mobs_loz:poe", "WhoOoOo", "*whisper*", "", "", "", ""},
	{"mobs_loz:tingle", "Tingle is looking for fairies", "Tingle's not usually the violent type... but he can learn!", "*giggle*", "Tingle, Tingle Kooloo-Limpa!", "Tingle has a special rupee", ";)"},
}

minetest.register_entity("mobs_loz:blade_x", {
	visual = "mesh",
	mesh = "blade.obj",
	textures = {
		"mobs_blade.png",
	},
	physical = true,
	collisionbox = {-0.3,-0.4,-0.3,0.3,0,0.3},
	hp_max = 1000,
	groups = {immortal=1},
	visual_size = {x=1,y=1},
	on_activate = function(self)
		self.object:set_velocity({x=-3,y=-6,z=0})
	end,
	on_rightclick = function(self, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:doompick" then
			self.object:remove()
		end
	end,
	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local velo = self.object:getvelocity().x
		if minetest.get_node({x=pos.x+0.6, y=pos.y, z=pos.z}).name ~= "air" or velo == 0 then
		self.object:set_velocity({x=-3,y=-6,z=0})
		minetest.sound_play("default_place_node_metal", {pos=pos, max_hear_distance=5, gain=0.5})
		elseif minetest.get_node({x=pos.x-0.6, y=pos.y, z=pos.z}).name ~= "air" then
		self.object:set_velocity({x=3,y=-6,z=0})
		minetest.sound_play("default_place_node_metal", {pos=pos, max_hear_distance=5, gain=0.5})
		end
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)	
			for k, obj in pairs(objs) do
				if obj:is_player() then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4},
						}, nil)
					self.object:set_velocity({x=-velo, y=-6, z=0})
					minetest.sound_play("default_place_node_metal", {pos=pos, max_hear_distance=5, gain=0.5})
				elseif obj:get_luaentity() ~= nil then
					local object = obj:get_luaentity()
					if object.name ~= "mobs_loz:blade_x" and object.name ~= "mobs_loz:blade_z" and object.name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4},
						}, nil)
					self.object:set_velocity({x=-velo, y=-6, z=0})
					minetest.sound_play("default_place_node_metal", {pos=pos, max_hear_distance=5, gain=0.5})
				end
			end
		end
	end
})

minetest.register_entity("mobs_loz:blade_z", {
	visual = "mesh",
	mesh = "blade.obj",
	textures = {
		"mobs_blade.png",
	},
	physical = true,
	collisionbox = {-0.3,-0.4,-0.3,0.3,0,0.3},
	hp_max = 1000,
	groups = {immortal=1},
	visual_size = {x=1,y=1},
	on_activate = function(self)
		self.object:set_velocity({x=0,y=-6,z=-3})
	end,
	on_rightclick = function(self, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:doompick" then
			self.object:remove()
		end
	end,
	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local velo = self.object:getvelocity().z
		if minetest.get_node({x=pos.x, y=pos.y, z=pos.z+0.6}).name ~= "air" or velo == 0 then
		self.object:set_velocity({x=0,y=-6,z=-3})
		minetest.sound_play("default_place_node_metal", {pos=pos, max_hear_distance=5, gain=0.5})
		elseif minetest.get_node({x=pos.x, y=pos.y, z=pos.z-0.6}).name ~= "air" then
		self.object:set_velocity({x=0,y=-6,z=3})
		minetest.sound_play("default_place_node_metal", {pos=pos, max_hear_distance=5, gain=0.5})
		end
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)	
			for k, obj in pairs(objs) do
				if obj:is_player() then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4},
						}, nil)
					self.object:set_velocity({x=0, y=-6, z=-velo})
					minetest.sound_play("default_place_node_metal", {pos=pos, max_hear_distance=5, gain=0.5})
				elseif obj:get_luaentity() ~= nil then
					local object = obj:get_luaentity()
					if object.name ~= "mobs_loz:blade_z" and object.name ~= "mobs_loz:blade_x" and object.name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=4},
						}, nil)
					self.object:set_velocity({x=0, y=-6, z=-velo})
					minetest.sound_play("default_place_node_metal", {pos=pos, max_hear_distance=5, gain=0.5})
				end
			end
		end
	end
})