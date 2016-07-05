
-- Ninja

mobs:register_mob("pmobs:ninja", {
	-- animal, monster, npc
	type = "monster",
	-- aggressive, shoots shuriken
	passive = false,
	damage = 3,
	attack_type = "shoot",
	shoot_interval = .5,
	arrow = "pmobs:shuriken",
	shoot_offset = 2,
	attacks_monsters = true,
	-- health & armor
	hp_min = 10, hp_max = 20, armor = 100,
	-- textures and model
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "character.b3d",
	drawtype = "front",
	textures = {
		{"mobs_ninja.png"},
	},
	visual_size = {x=1, y=1},
	-- sounds
	makes_footstep_sound = true,
	sounds = {},
	-- speed and jump
	walk_velocity = 3,
	run_velocity = 3,
	jump = true,
	-- drops shuriken when dead
	drops = {
		{name = "mobs:shuriken",
		chance = 1, min = 1, max = 5},
	},
	-- damaged by
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 0,
	view_range = 15,
	-- model animation
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
})

-- ninja spawn on top of trees
mobs:register_spawn("pmobs:ninja", {"default:leaves"}, 5, 0, 10000, 1, 31000)
mobs:register_egg("pmobs:ninja", "Ninja", "default_leaves.png", 1)

mobs:register_arrow("pmobs:shuriken", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"mobs_shuriken.png"},
	velocity = 6,
	drop = true,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
		full_punch_interval=1.0,
		damage_groups = {fleshy=1},
		}, 0)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
		full_punch_interval=1.0,
		damage_groups = {fleshy=1},
		}, 0)
	end,

	hit_node = function(self, pos, node)
	end,
})

-- shuriken throwing item

local shuriken_GRAVITY=9
local shuriken_VELOCITY=19

--Shoot shuriken
local mobs_shoot_shuriken=function (item, player, pointed_thing)
	local playerpos=player:getpos()
	local obj=minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, "pmobs:shuriken")
	local dir=player:get_look_dir()
	obj:get_luaentity().velocity = shuriken_VELOCITY -- needed for api internal timing
	obj:setvelocity({x=dir.x*shuriken_VELOCITY, y=dir.y*shuriken_VELOCITY, z=dir.z*shuriken_VELOCITY})
	obj:setacceleration({x=dir.x*-3, y=-shuriken_GRAVITY, z=dir.z*-3})
	item:take_item()
	return item
end

-- shuriken item
minetest.register_craftitem("pmobs:shuriken", {
description = "Shuriken",
	inventory_image = "mobs_shuriken.png",
	on_use = function(item, player)
		if mobs_shoot_shuriken(item, player, pointed_thing) then
			if not minetest.setting_getbool("creative_mode") then
				item:add_wear(65535/50)
			end
		end
		return item
	end,
})

-- recipe
minetest.register_craft({
	output = "pmobs:shuriken 16",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"", "default:steel_ingot", ""},
	}
})

