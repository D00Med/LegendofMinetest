
mobs:register_mob("mobs_loz:moldorm", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	damage = 1,
	hp_min = 10,
	hp_max = 15,
	armor = 100,
	collisionbox = {-0.5, -0, -0.5, 0.5, 1, 0.5},
	visual = "mesh",
	mesh = "moldorm.b3d",
	textures = {
		{"mobs_moldorm.png"},
	},
	visual_size = {x=2.5, y=2.5},
	blood_texture = "mobs_slime.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 0.8,
	run_velocity = 1.2,
	jumpheight = 5,
	drops = {
		{name = "hyruletools:green_rupee",
		chance = 4, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,4) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fear_height = 5,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 15,
		stand_end = 28,
		walk_start = 15,
		walk_end = 28,
		run_start = 1,
		run_end = 14,
		punch_start = 1,
		punch_end = 14,
	},
})

mobs:register_spawn("mobs_loz:moldorm", {"default:mossy_cobblestone", "default:dirt_with_dry_grass", "default:dirt_with_grass3", "hyrule_mapgen:dungeon_brick"}, 7, 0, 7000, 2, 31000)

mobs:register_egg("mobs_loz:moldorm", "Moldorm", "mobs_zol.png", 1)