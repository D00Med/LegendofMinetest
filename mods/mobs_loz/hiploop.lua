mobs:register_mob("mobs_loz:hiploop", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1.5,
	damage = 5,
	hp_min = 10,
	hp_max = 20,
	armor = 140,
	collisionbox = {-0.3, 0, -0.3, 0.3, 0.5, 0.3},
	visual = "mesh",
	mesh = "hiploop.b3d",
	textures = {
		{"mobs_hiploop.png"},
	},
	view_range = 10,
	walk_velocity = 2,
	run_velocity = 3,
	jumpheight = 3,
	drops = {
		{name = "hyruletools:green_rupee",
		chance = 5, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,4) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 35,
		stand_end = 55,
		walk_start = 1,
		walk_end = 17,
		run_start = 1,
		run_end = 17,
		punch_start = 17,
		punch_end = 32,
	},
})

mobs:register_egg("mobs_loz:hiploop", "Hiploop", "hyrule_mapgen_swampmud.png", 1)