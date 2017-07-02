

mobs:register_mob("mobs_loz:peahat", {
	type = "monster",
	passive = false,
	reach = 3,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 7,
	hp_max = 12,
	armor = 100,
	collisionbox = {-0.4, 0, -0.4, 0.4, 1.2, 0.4},
	visual = "mesh",
	mesh = "peahat.b3d",
	textures = {
		{"mobs_peahat.png"},
	},
	makes_footstep_sound = false,
	walk_velocity = 0,
	run_velocity = 2,
	jump = false,
	stepheight = 1.5,
	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	view_range = 25,
	drops = {
		{name = "hyruletools:blue_rupee",
		chance = 5, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,3) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	animation = {
		speed_normal = 7,
		speed_run = 12,
		walk_start = 20,
		walk_end = 40,
		stand_start = 20,
		stand_end = 40,
		run_start = 6,
		run_end = 14,
	},
})

mobs:register_egg("mobs_loz:peahat", "Peahat", "default_dry_grass.png", 1)