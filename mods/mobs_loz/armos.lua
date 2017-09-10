
mobs:register_mob("mobs_loz:armos", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 10,
	hp_max = 27,
	armor = 100,
	collisionbox = {-0.5, 0, -0.5, 0.5, 1.5, 0.5},
	visual = "mesh",
	mesh = "armos.b3d",
	textures = {
		{"mobs_armos_frozen.png"},
	},
	visual_size = {x=5, y=5},
	makes_footstep_sound = true,
	view_range = 3.5,
	walk_velocity = 0.01,
	run_velocity = 1.5,
	jump = false,
	jump_height = 0,
	walk_chance = 0,
	drops = {
		{name = "hyruletools:red_rupee",
		chance = 5, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	on_rightclick = function(self, clicker)
		self.type = "monster"
	end,
	do_custom = function(self)
		if self.state == "attack" then
			if not self.textured then
				self.object:set_properties({textures = {"mobs_armos.png"}})
				self.textured = true
			end
		else
			if self.textured then
				self.object:set_properties({textures = {"mobs_armos_frozen.png"}})
				self.textured = false
			end
		end			
	end,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 13,
		speed_run = 15,
		stand_start = 1,
		stand_end = 1,
		walk_start = 1,
		walk_end = 15,
		run_start = 1,
		run_end = 15,
		punch_start = 1,
		punch_end = 15,
	},
})

mobs:register_egg("mobs_loz:armos", "Armos", "default_stone.png", 1)