
-- Wolf by KrupnoPavel

mobs:register_mob("pmobs:wolf", {
	type = "animal",
	hp_max = 5,
	passive = false,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "mobs_wolf.x",
	textures = {
		{"mobs_wolf.png"},
		{"mobs_dog2.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		war_cry = "mobs_wolf_attack",
	},
	view_range = 7,
	walk_velocity = 2,
	run_velocity = 3,
	stepheight = 1.1,
	damage = 2,
	armor = 200,
	attack_type = "dogfight",
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs:meat_raw" then
			clicker:get_inventory():remove_item("main", "mobs:meat_raw")
			minetest.add_entity(self.object:getpos(), "pmobs:dog")
			self.object:remove()
		end
	end,
	animation = {
		speed_normal = 20,
		speed_run = 30,
		stand_start = 10,
		stand_end = 20,
		walk_start = 75,
		walk_end = 100,
		run_start = 100,
		run_end = 130,
		punch_start = 135,
		punch_end = 155,
	},
	jump = true,
	step = 0.5,
	blood_texture = "mobs_blood.png",
})
mobs:register_spawn("pmobs:wolf", {"default:dirt_with_grass","default:dirt","default:snow", "default:snowblock", "default:dirt_with_grass2", "default:dirt_with_grass3"}, 20, -1, 7000, 1, 31000)
mobs:register_egg("pmobs:wolf", "Wolf", "wool_grey.png", 1)
