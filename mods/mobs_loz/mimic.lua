-- Mimic by D00Med
-- edit of Dirt Monster by PilzAdam

mobs:register_mob("mobs_loz:mimic", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 10,
	hp_max = 27,
	armor = 90,
	collisionbox = {-0.5, 0, -0.5, 0.5, 1, 0.5},
	visual = "mesh",
	mesh = "mimic.b3d",
	textures = {
		{"mobs_mimic.png"},
		{"mobs_mimic2.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 2.5,
	walk_velocity = 0.01,
	run_velocity = 1,
	jump = false,
	jump_height = 0,
	drops = {
		{name = "hyruletools:red_rupee",
		chance = 1, min = 1, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	on_rightclick = function(self, clicker)
		self.type = monster
	end,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 13,
		speed_run = 15,
		stand_start = 0,
		stand_end = 1,
		walk_start = 0,
		walk_end = 1,
		run_start = 0,
		run_end = 1,
		punch_start = 1,
		punch_end = 14,
	},
})

mobs:register_spawn("mobs_loz:mimic", {"default:cobblestone", "default:sandstone_brick", "default:stone_brick"}, 7, 0, 7000, 2, 31000)

mobs:register_egg("mobs_loz:mimic", "Mimic", "default_chest_front.png", 1)