-- Deku_Baba by D00Med
-- edit of Dirt Monster by PilzAdam

mobs:register_mob("mobs_loz:deku_baba", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 3.5,
	damage = 2,
	hp_min = 10,
	hp_max = 27,
	armor = 130,
	collisionbox = {-0.3, 0, -0.2, 0.2, 1.2, 0.2},
	visual = "mesh",
	mesh = "dekubaba.b3d",
	textures = {
		{"mobs_dekubaba.png"},
		{"mobs_dekubaba2.png"},
	},
	blood_texture = "default_dry_grass.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 5,
	walk_velocity = 0.01,
	run_velocity = 0.05,
	jump = false,
	drops = {
		{name = "mobs_loz:nut",
		chance = 1, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = -1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 12,
		speed_run = 30,
		stand_start = 1,
		stand_end = 19,
		walk_start = 1,
		walk_end = 19,
		run_start = 35,
		run_end = 55,
		punch_start = 20,
		punch_end = 35,
	},
})

mobs:register_egg("mobs_loz:deku_baba", "Deku_Baba", "default_dry_grass.png", 1)