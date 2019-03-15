
-- seafish by D00Med

mobs:register_mob("mobs_loz:seafish", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 110,
	collisionbox = {-0.05, -0.05, -0.05, 0.05, 0.05, 0.05},
	visual = "mesh",
	mesh = "seafish.b3d",
	textures = {
		{"mobs_seafish.png"},
		{"mobs_seafish2.png"},
		{"mobs_seafish3.png"},
		{"mobs_seafish4.png"},
	},
	blood_texture = "bubble.png",
	makes_footstep_sound = false,
	view_range = 5,
	walk_velocity = 1,
	run_velocity = 3,
	runaway = true,
	runaway_timer = 40,
	jump = false,
	stepheight = 0,
	fly = true,
	fly_in = {"default:water_source", "moreplants:coral", "moreplants:seaweed1", "moreplants:seaweed2", "moreplants:seaweed3", "moreplants:seaweed4", "moreplants:coral2", "moreplants:coral3"},
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	drops = {
		{name = "fishing:fish_raw",
		chance = 5, min = 1, max = 1},
	},
	--[[on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,7) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,]]
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 19,
		speed_run = 20,
		normal_speed = 19,
		run_speed = 20,
		stand_start = 1,
		stand_end = 28,
		walk_start = 1,
		walk_end = 28,
		run_start = 1,
		run_end = 28,
	},
})

mobs:register_egg("mobs_loz:seafish", "Sea Fish", "wool_orange.png", 1)
