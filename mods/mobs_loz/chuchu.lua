-- Chuchu by D00Med
-- edit of Dirt Monster by PilzAdam

mobs:register_mob("mobs_loz:chuchu", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 2,
	hp_min = 3,
	hp_max = 27,
	armor = 150,
	collisionbox = {-0.2, -0, -0.2, 0.2, 0.7, 0.2},
	visual_size = {x=1.5, y=1.5},
	visual = "mesh",
	mesh = "chuchu.b3d",
	textures = {
		{"mobs_chuchu.png"},
	},
	blood_texture = "hyruletools_yellowstar.png",
	makes_footstep_sound = false,
	view_range = 5,
	walk_velocity = 1,
	run_velocity = 1,
	jump = false,
	drops = {
		{name = "hyruletools:blue_rupee",
		chance = 10, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,4) == 2 then
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
		speed_run = 15,
		stand_start = 1,
		stand_end = 20,
		walk_start = 52,
		walk_end = 72,
		run_start = 52,
		run_end = 72,
		punch_start = 30,
		punch_end = 50,
	},
})

mobs:register_egg("mobs_loz:chuchu", "Chuchu", "hyruletools_spark.png", 1)