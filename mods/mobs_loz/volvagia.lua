
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
	armor = 70,
	collisionbox = {-1, -2, -1, 1, 2, 1},
	visual_size = {x=3, y=3},
	visual = "mesh",
	mesh = "volvagia.b3d",
	textures = {
		{"mobs_volvagia.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 25,
	rotate = 180,
	walk_velocity = 2,
	run_velocity = 5,
	jump = false,
	drops = {
		{name = "hyruletools:firestone", chance = 1, min = 3, max = 5},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
		minetest.env:add_entity(pos, "experience:orb")
		minetest.env:add_entity(pos, "experience:orb")
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 2,
		stand_end = 20,
		walk_start = 2,
		walk_end = 20,
		run_start = 2,
		run_end = 20,
		punch_start = 20,
		punch_end = 42,
		shoot_start = 20,
		shoot_end = 42,
	},
	fly = true,
	fly_in = "air",
	on_die = function(self, pos)
		mobs:explosion(pos, 2, 1, 1)
		for i=1,10 do
		minetest.after((i/10)+math.random(-9,9)/20, function()
		minetest.add_particle({
			pos = {x=pos.x+math.random(-1,1), y=pos.y, z=pos.z+math.random(-1,1)},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=math.random(-5,5)/10, y=1, z=math.random(-5,5)/10},
			expirationtime = math.random(10,15)/10,
			size = math.random(20,25),
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "mobs_loz_light.png",
			glow = 9
		})
		end)
		end
	end,
})

--mobs:register_spawn("mobs_loz:volvagia",
--	{"hyrule_mapgen:volvagia_spawn"}, 20, 0, 7000, 1, 31000, false)

mobs:register_egg("mobs_loz:volvagia", "Boss Volvagia", "default_dirt.png", 1)

