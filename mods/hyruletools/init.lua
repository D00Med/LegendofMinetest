if minetest.setting_getbool("loz_mode") then

--hud (rupee counter)
--[[
minetest.register_on_joinplayer(function(player)
local rupee = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.05, y = 0.9},
    scale = {
      x = 3,
      y = 3
    },
    text = "hyruletools_green_rupee.png"
	})
	
local arrow = player:hud_add({
    hud_elem_type = "image",
    position = {x = 0.05, y = 0.8},
    scale = {
      x = 3,
      y = 3
    },
    text = "bows_arrow_wood.png"
	})
	
local text1 = player:hud_add({
    hud_elem_type = "text",
    position = {x = 0.1, y = 0.8},
    scale = {
      x = 3,
      y = 3
    },
    text = "x ",
	number = 0xFFFFFF
	})
	
local text1 = player:hud_add({
    hud_elem_type = "text",
    position = {x = 0.09, y = 0.9},
    scale = {
      x = 3,
      y = 3
    },
    text = "x ",
	number = 0xFFFFFF
	})
end)
--]]

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

--shields

minetest.register_globalstep(function()
	for _, player in ipairs(minetest.get_connected_players()) do	
		local item = player:get_wielded_item():get_name()
		if item == "shields:shield_steel" and fr2 == nil or item == "shields:shield_admin" and fr2 == nil or item == "shields:shield_bronze" and fr2 == nil then
			local timeoday = minetest.get_timeofday()
			if timeoday >= 0.35 and timeoday <= 0.85 then
			fr2 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.9, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back.png"
			})
			else
			fr2 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.9, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back.png^[colorize:black:200"
			})
			end
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor+10})
		elseif item ~= "shields:shield_steel" and item ~= "shields:shield_admin" and item ~= "shields:shield_bronze" then
		if fr2 ~= nil then
		player:hud_remove(fr2)
		fr2 = nil
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor-10})
		end
		end
		
		if item == "shields:shield_cactus" and fr1 == nil or item == "shields:shield_cactus_enhanced" and fr1 == nil or item == "shields:shield_wood_enhanced" and fr1 == nil then
			local timeoday = minetest.get_timeofday()
			if timeoday >= 0.25 and timeoday <= 0.75 then
			fr1 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.9, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back_wood.png"
			})
			else
			fr1 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.9, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back_wood.png^[colorize:black:200"
			})
			end
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor+5})
		elseif item ~= "shields:shield_cactus" and item ~= "shields:shield_wood_enhanced" and item ~= "shields:shield_cactus_enhanced" then
		if fr1 ~= nil then
		player:hud_remove(fr1)
		fr1 = nil
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor-5})
		end
		end
		
		if item == "hyruletools:shield_classic" and fr0 == nil then
			local timeoday = minetest.get_timeofday()
			if timeoday >= 0.25 and timeoday <= 0.75 then
			fr0 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.9, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back_classic.png"
			})
			else
			fr0 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.9, y = 0.9},
			scale = {x = 15,y = 15},
			text = "hyruletools_shield_back_classic.png^[colorize:black:200"
			})
			end
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor+10})
		elseif item ~= "hyruletools:shield_classic" then
		if fr0 ~= nil then
		player:hud_remove(fr0)
		fr0 = nil
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor-10})
		end
		end
		
		if item == "shields:shield_wood" and fr4 == nil then
			local timeoday = minetest.get_timeofday()
			if timeoday >= 0.25 and timeoday <= 0.75 then
			fr4 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.9, y = 0.9},
			scale = {x = 21,y = 21},
			text = "hyruletools_shield_back_deku.png"
			})
			else
			fr4 = player:hud_add({
			hud_elem_type = "image",
			position = {x = 0.9, y = 0.9},
			scale = {x = 21,y = 21},
			text = "hyruletools_shield_back_deku.png^[colorize:black:200"
			})
			end
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor+5})
		elseif item ~= "shields:shield_wood" then
		if fr4 ~= nil then
		player:hud_remove(fr4)
		fr4 = nil
			local player_armor = player:get_armor_groups().fleshy
			player:set_armor_groups({fleshy=player_armor-5})
		end
		end
	end
end)


--tools


minetest.register_entity("hyruletools:block_dummy", {
	visual = "mesh",
	mesh = "node.b3d",
	textures = {"hyrule_mapgen_magnblock.png"},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	visual_size = {x=3.5, y=3.5},
	physical = true
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
		return itemstack
	end,
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
	groups = {oddly_breakable_by_hand=1, falling_node=1},
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
	groups = {oddly_breakable_by_hand=1, falling_node=1},
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
	output = "hyruletools:vase 5",
	recipe = {
		{ "default:clay_lump", "", "default:clay_lump" },
		{ "default:clay_lump", "dye:brown", "default:clay_lump" },
		{ "", "default:clay_lump", "" }
	}
})

minetest.register_craft( {
	output = "hyruletools:vase 5",
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

minetest.register_node("hyruletools:rock", {
	description = "Rock",
	tiles = {
		"default_stone.png",
		"default_stone.png",
		"default_stone.png",
		"default_stone.png",
		"default_stone.png",
		"default_stone.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=1, falling_node=1},
	drop = "hyruletools:green_rupee",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.4375, -0.4375, -0.3125, 0.375, -0.125, 0.25}, -- NodeBox2
			{-0.3125, -0.125, -0.375, 0.25, -0.0625, 0.3125}, -- NodeBox3
			{-0.3125, -0.4375, -0.4375, 0.25, -0.125, 0.375}, -- NodeBox4
			{-0.375, -0.4375, -0.375, 0.3125, -0.125, 0.3125}, -- NodeBox5
			{-0.25, -0.0625, -0.3125, 0.1875, 0, 0.25}, -- NodeBox6
			{-0.375, -0.125, -0.25, 0.3125, -0.0625, 0.1875}, -- NodeBox7
		}
	}
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

minetest.register_craftitem("hyruletools:key", {
	description = "Dungeon Key",
	inventory_image = "hyruletools_key.png",
})

minetest.register_craftitem("hyruletools:key_boss", {
	description = "Boss Key",
	inventory_image = "hyruletools_boss_key.png",
})

minetest.register_craftitem("hyruletools:red_rupee", {
	description = "Red Rupee",
	inventory_image = "hyruletools_red_rupee.png",
	stack_max = 1000,
})

minetest.register_craftitem("hyruletools:green_rupee", {
	description = "Green Rupee",
	inventory_image = "hyruletools_green_rupee.png",
	stack_max = 1000,
})

minetest.register_craftitem("hyruletools:blue_rupee", {
	description = "Blue Rupee",
	inventory_image = "hyruletools_blue_rupee.png",
	stack_max = 1000,
})

minetest.register_craftitem("hyruletools:nyan_rupee", {
	description = "Nyan Rupee",
	inventory_image = "hyruletools_nyan_rupee.png",
	stack_max = 1000,
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
	on_activate = function(self)
		minetest.after(10, function()
			self.object:remove()
			end)
	end,
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
	on_activate = function(self)
		minetest.after(10, function()
			self.object:remove()
			end)
	end,
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
	on_activate = function(self)
		minetest.after(10, function()
			self.object:remove()
			end)
	end,
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
		local velo = self.object:getvelocity()
		local part = minetest.add_particlespawner(
			1, --amount
			0.3, --time
			{x=apos.x-0, y=apos.y-0, z=apos.z-0}, --minpos
			{x=apos.x+0, y=apos.y+0, z=apos.z+0}, --maxpos
			{x=-velo.x/2, y=-velo.y/2, z=-velo.z/2}, --minvel
			{x=-velo.x/2, y=-velo.y/2, z=-velo.z/2}, --maxvel
			{x=0,y=-0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			0.1, --minexptime
			0.2, --maxexptime
			8, --minsize
			8, --maxsize
			false, --collisiondetection
			"hyruletools_swdbeam.png" --texture
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
			itemstack:add_wear(1000)
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
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+dir.x,y=playerpos.y+1.2+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:swdspark_classic")
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			obj:setyaw(placer:get_look_yaw() - math.pi / 2)
			itemstack:add_wear(1000)
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
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+dir.x,y=playerpos.y+1.5+dir.y,z=playerpos.z+0+dir.z}, "hyruletools:fireball")
			local vec = {x=dir.x*16,y=dir.y*16,z=dir.z*16}
			obj:setvelocity(vec)
			itemstack:add_wear(2000)
		return itemstack
	end,
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
	description = "bombflower",
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
	description = "decorative bomb flower",
	drawtype = "mesh",
	mesh = "hyruletools_bomb.b3d",
	tiles = {
		"hyruletools_bombflower_plant.png",
	},
	paramtype = "light",
	groups = {cracky=1},
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

minetest.register_entity("hyruletools:swordent_mese", {
	visual = "upright_sprite",
	visual_size = {x=1, y=1},
	collisionbox = {0},
	physical = false,
	textures = {"hyruletools_mesesword.png"},
	on_activate = function(self)
		local pos = self.object:getpos()
		local pos_under = {x=pos.x, y=pos.y-0.6, z=pos.z}

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
	on_place = function(item, player, pointed)
	local pos = player:getpos()
	if pointed ~= nil then
	 stack = minetest.place_node(pos, {name="default:ice"})
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