-- Darknut by D00Med
-- edit of Dirt Monster by PilzAdam

mobs:register_mob("mobs_loz:darknut", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2.5,
	damage = 4,
	hp_min = 30,
	hp_max = 47,
	armor = 100,
	collisionbox = {-0.7, -0, -0.7, 0.7, 2, 0.7},
	visual_size = {x=1.3, y=1.3},
	visual = "mesh",
	mesh = "darknut.b3d",
	textures = {
		{"mobs_darknut.png"},
	},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 1,
	run_velocity = 1.5,
	drops = {
		{name = "default:steel_ingot",
		chance = 7, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,7) == 2 then
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
		stand_start = 15,
		stand_end = 25,
		walk_start = 30,
		walk_end = 50,
		run_start = 30,
		run_end = 50,
		punch_start = 1,
		punch_end = 15,
	},
})

mobs:register_egg("mobs_loz:darknut", "Darknut", "default_stone.png", 1)