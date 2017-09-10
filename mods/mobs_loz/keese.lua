
mobs:register_mob("mobs_loz:keese", {
	type = "monster",
	reach = 1.5,
	damage = 1,
	attack_type = "dogfight",
	hp_min = 5,
	hp_max = 10,
	armor = 170,
	collisionbox = {-0.2, 0, -0.2, 0.2, 0.5, 0.2},
	visual = "mesh",
	mesh = "keese.b3d",
	textures = {
		{"mobs_keese.png"},
	},
	makes_footstep_sound = false,
	view_range = 10,
	walk_velocity = 2.5,
	run_velocity = 3.5,
	jump = false,
		stepheight = 1.3,
		fly = true,
		fly_in = "air",
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	drops = {
		{name = "hyruletools:green_rupee",
		chance = 12, min = 1, max = 2},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,9) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 30,
		speed_run = 35,
		stand_start = 1,
		stand_end = 20,
		walk_start = 1,
		walk_end = 20,
		run_start = 22,
		run_end = 42,
		punch_start = 22,
		punch_end = 42,
	},
})

mobs:register_egg("mobs_loz:keese", "Keese", "default_obsidian.png", 1)