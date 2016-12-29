
-- zora by D00Med
-- an edit of mese monster by Zeg9

mobs:register_mob("mobs_loz:zora", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 80,
	collisionbox = {-0.4, -0, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "zora.b3d",
	textures = {
		{"mobs_zora.png"},
	},
	blood_texture = "icetools_shard.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 2,
	run_velocity = 6,
	runaway = true,
	runaway_timer = 40,
	jump = false,
		stepheight = 1.5,
		fly = true,
		fly_in = "default:water_source",
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	drops = {
		{name = "icetools:ice_shard",
		chance = 9, min = 1, max = 3},
		{name = "hyruletools:green_rupee",
		chance = 5, min = 1, max = 2},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
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
		and math.random(1, 200) == 1 then

			local pos = self.object:getpos()

			minetest.add_item(pos, "mobs:scale")
		end
	end,
})

mobs:register_spawn("mobs_loz:zora", {"default:water_source",}, 20, 10, 15000, 2, 11000)

mobs:register_egg("mobs_loz:zora", "Zora", "default_ice.png", 1)

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
	if breath <= 10 then
		playereffects.apply_effect_type("potion_swim_lv1", 10, user)
	end
	end,
})