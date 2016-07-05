
-- Edit of Dirt Monster by PilzAdam

mobs:register_mob("mobs_loz:volvagia", {
	type = "monster",
	passive = false,
	attack_type = "dogshoot",
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
	shoot_interval = 2.5,
	arrow = "mobs_loz:fire",
	shoot_offset = 0,
	pathfinding = false,
	reach = 5,
	damage = 2,
	hp_min = 100,
	hp_max = 127,
	armor = 100,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 5, 0.4},
	visual_size = {x=4, y=4},
	visual = "mesh",
	mesh = "volvagia.b3d",
	textures = {
		{"volvagia.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 25,
	rotate = 180,
	walk_velocity = 0.01,
	run_velocity = 0.01,
	jump = false,
	drops = {
		{name = "hyruletools:firestone", chance = 1, min = 3, max = 5},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 20,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 40,
		punch_end = 60,
		shoot_start = 20,
		shoot_end = 40,
	},
	on_die = function(self, pos)
		mobs:explosion(pos, 2, 1, 1)
		minetest.add_particlespawner(
			10, --amount
			1, --time
			{x=pos.x-1, y=pos.y-1, z=pos.z-1}, --minpos
			{x=pos.x+1, y=pos.y-1, z=pos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=1,z=-0.5}, --minacc
			{x=0.5,y=1,z=0.5}, --maxacc
			1, --minexptime
			1.5, --maxexptime
			20, --minsize
			25, --maxsize
			false, --collisiondetection
			"mobs_loz_light.png" --texture
		)
	end,
})

--mobs:register_spawn("mobs_loz:volvagia",
--	{"hyrule_mapgen:volvagia_spawn"}, 20, 0, 7000, 1, 31000, false)

mobs:register_egg("mobs_loz:volvagia", "Boss Volvagia", "default_dirt.png", 1)

