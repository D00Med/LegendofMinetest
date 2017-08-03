
-- zora by D00Med
-- an edit of mese monster by Zeg9

mobs:register_mob("mobs_loz:zora_male", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 80,
	collisionbox = {-0.4, -0, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "zora_male.b3d",
	textures = {
		{"mobs_zora_male.png"},
	},
	blood_texture = "hyruletools_ice_shard.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 2,
	run_velocity = 6,
	runaway = true,
	runaway_timer = 40,
	jump = false,
		stepheight = 0,
		fly = true,
		fly_in = "default:water_source",
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	drops = {
		{name = "hyruletools:ice_fragment",
		chance = 9, min = 1, max = 3},
		{name = "hyruletools:green_rupee",
		chance = 5, min = 1, max = 2},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,7) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 25,
		walk_end = 45,
		run_start = 25,
		run_end = 45,
	},
	do_custom = function(self)

		if not self.child
		and math.random(1, 50000) == 1 then

			local pos = self.object:getpos()

			minetest.add_item(pos, "mobs_loz:scale")
		end
	end,
})

mobs:register_egg("mobs_loz:zora_male", "Zora (male)", "default_ice.png", 1)

mobs:register_mob("mobs_loz:zora_female", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 80,
	collisionbox = {-0.4, -0, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "zora_female.b3d",
	textures = {
		{"mobs_zora_female.png"},
	},
	blood_texture = "hyruletools_ice_shard.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 3,
	run_velocity = 7,
	runaway = true,
	runaway_timer = 40,
	jump = false,
		stepheight = 0,
		fly = true,
		fly_in = "default:water_source",
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	drops = {
		{name = "hyruletools:ice_fragment",
		chance = 9, min = 1, max = 3},
		{name = "hyruletools:green_rupee",
		chance = 5, min = 1, max = 2},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,7) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 1,
		stand_end = 20,
		walk_start = 25,
		walk_end = 45,
		run_start = 25,
		run_end = 45,
	},
	do_custom = function(self)

		if not self.child
		and math.random(1, 50000) == 1 then

			local pos = self.object:getpos()

			minetest.add_item(pos, "mobs_loz:scale")
		end
	end,
})

mobs:register_egg("mobs_loz:zora_female", "Zora (female)", "default_ice.png^[colorize:red:70", 1)

playereffects.register_effect_type("potion_swim_lv1", "Fast Swim", nil, {"swim"}, 
	function(player)
		player:set_physics_override(4,nil,nil)
		physics_overriden = true
	end,
	
	function(effect, player)
		player:set_physics_override(1,nil,nil)
		physics_overriden = false
	end,
	false
)

minetest.register_craftitem("mobs_loz:scale", {
	description = "Zora scale",
	inventory_image = "mobs_scale.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath = user:get_breath()
		local pos = user:getpos()
		user:set_breath(breath+5)
	if minetest.get_node(pos).name == "default:water_source" or minetest.get_node(pos).name == "default:river_water_source" then
		playereffects.apply_effect_type("potion_swim_lv1", 4, user)
	end
	end,
})
