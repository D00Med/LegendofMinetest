
mobs:register_mob("mobs_loz:gibido", {
	type = "monster",
	passive = false,
	reach = 2,
	damage = 3,
	attack_type = "dogfight",
	hp_min = 20,
	hp_max = 30,
	armor = 100,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.7, 0.4},
	visual = "mesh",
	mesh = "character.b3d",
	drawtype = "front",
	textures = {
		{"mobs_gibido.png"},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,3) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 1.4,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 1,
	view_range = 5,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
})

mobs:register_egg("mobs_loz:gibido", "Gibido", "wool_grey.png", 1)