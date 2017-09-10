
mobs:register_mob("mobs_loz:moldorm", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	damage = 1,
	hp_min = 10,
	hp_max = 15,
	armor = 150,
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

mobs:register_egg("mobs_loz:moldorm", "Moldorm", "mobs_zol.png", 1)

mobs:register_mob("mobs_loz:great_moldorm", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	damage = 1,
	hp_min = 50,
	hp_max = 60,
	armor = 100,
	collisionbox = {-0.9, -0, -0.9, 0.9, 1.5, 0.9},
	visual = "mesh",
	mesh = "moldorm.b3d",
	textures = {
		{"mobs_great_moldorm.png"},
	},
	visual_size = {x=5.5, y=4.5},
	blood_texture = "mobs_slime.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 0.8,
	run_velocity = 1.9,
	jumpheight = 5,
	drops = {
		{name = "hyruletools:red_rupee",
		chance = 4, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		minetest.env:add_item(pos, "default:sword_bronze")
		minetest.env:add_entity(pos, "experience:orb")
		minetest.env:add_entity(pos, "experience:orb")
		minetest.env:add_entity(pos, "experience:orb")
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

mobs:register_egg("mobs_loz:great_moldorm", "Great Moldorm", "mobs_zol.png^[colorize:yellow:20", 1)