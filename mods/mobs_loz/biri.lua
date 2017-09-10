
mobs:register_mob("mobs_loz:biri", {
	type = "monster",
	reach = 1.5,
	damage = 1,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 130,
	collisionbox = {-0.4, 0, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "biri.b3d",
	textures = {
		{"mobs_biri.png"},
		{"mobs_biri2.png"},
	},
	makes_footstep_sound = false,
	view_range = 5,
	walk_velocity = 1.5,
	run_velocity = 2.5,
	jump = false,
		stepheight = 1.3,
		fly = true,
		fly_in = "default:water_source",
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	drops = {
		{name = "hyruletools:green_rupee",
		chance = 5, min = 1, max = 2},
	},
	on_activate = function(self)
		local size = math.random(0.6, 1.4)
		self.object:set_properties({visual_size={x=size, y=size}})
	end,
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
		walk_start = 20,
		walk_end = 40,
		run_start = 42,
		run_end = 62,
		punch_start = 1,
		punch_end = 20,
	},
})

mobs:register_egg("mobs_loz:biri", "Biri", "wool_magenta.png", 1)