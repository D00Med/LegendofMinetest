mobs:register_mob("mobs_loz:skulltula", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 28,
	hp_max = 37,
	armor = 150,
	collisionbox = {-0.3, 0, -0.3, 0.3, 1, 0.3},
	visual_size = {x=1.5, y=1.5},
	visual = "mesh",
	mesh = "skulltula.b3d",
	textures = {
		{"mobs_skulltula.png"},
	},
	makes_footstep_sound = false,
	view_range = 5,
	walk_velocity = 1.5,
	run_velocity = 2.5,
	jump = 1,
	jump_height = 5,
	drops = {
		{name = "hyruletools:green_rupee",
		chance = 5, min = 1, max = 3},
		{name = "farming:cotton",
		chance = 5, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 45,
		stand_end = 65,
		walk_start = 5,
		walk_end = 25,
		run_start = 5,
		run_end = 25,
		punch_start = 30,
		punch_end = 45,
	},
})

mobs:register_egg("mobs_loz:skulltula", "Skulltula", "wool_black.png", 1)