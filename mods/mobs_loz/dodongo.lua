--baby dodongo by D00Med
-- edit of Stone Monster by PilzAdam


mobs:register_mob("mobs_loz:bdodongo", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	damage = 1,
	hp_min = 12,
	hp_max = 25,
	armor = 160,
	collisionbox = {-0.2, -0.1, -0.2, 0.2, 0.4, 0.4},
	visual = "mesh",
	mesh = "bdodongo.b3d",
	textures = {
	{"mobs_bdodongo.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_stonemonster",
	},
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = 0,
	floats = 0,
	view_range = 5,
	drops = {
		{name = "hyruletools:blue_rupee",
		chance = 3, min = 3, max = 5},
		{name = "default:iron_lump",
		chance=5, min=1, max=2},
		{name = "default:coal_lump",
		chance=3, min=1, max=3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,4) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 5,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 10,
		speed_run = 15,
		stand_start = 3,
		stand_end = 3,
		walk_start = 3,
		walk_end = 21,
		run_start = 3,
		run_end = 21,
		punch_start = 3,
		punch_end = 21,
	},
	on_die = function(self, pos)
		minetest.set_node(pos, {name = "fire:basic_flame"})
	end,
})

mobs:register_egg("mobs_loz:bdodongo", "Baby Dodongo", "default_lava.png", 1)


mobs:register_mob("mobs_loz:dodongo", {
	type = "monster",
	passive = false,
	attack_type = "dogshoot",
	shoot_interval = 2.5,
	arrow = "mobs_loz:fire",
	shoot_offset = 2,
	reach = 2,
	damage = 2,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
	hp_min = 22,
	hp_max = 35,
	armor = 100,
	collisionbox = {-0.7, 0, -0.7, 0.7, 1.2, 0.7},
	visual = "mesh",
	mesh = "dodongo.b3d",
	textures = {
		{"mobs_dodongo.png"}
	},
	makes_footstep_sound = true,
	sounds = {
		random = "dinosaur_roar",
	},
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = 0,
	floats = 0,
	view_range = 13,
	drops = {
		{name = "hyruletools:blue_rupee",
		chance = 5, min = 3, max = 5},
		{name = "default:copper_lump",
		chance=10, min=1, max=2},
		{name = "default:coal_lump",
		chance=10, min=1, max=3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,5) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 5,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 14,
		speed_run = 18,
		stand_start = 25,
		stand_end = 45,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 45,
		punch_end = 65,
		shoot_start = 45,
		shoot_end = 65,
	},
	on_die = function(self, pos)
		minetest.set_node(pos, {name = "fire:basic_flame"})
	end,
})

mobs:register_egg("mobs_loz:dodongo", "Dodongo", "default_lava.png", 1)

mobs:register_arrow("mobs_loz:fire", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"mobs_loz_fire.png"},
	velocity = 4,
   tail = 1, -- enable tail
   tail_texture = "fire_basic_flame.png",
   
	hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 1},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 1},
      }, nil)
   end,

   hit_node = function(self, pos, node)
		minetest.set_node(pos, {name="fire:basic_flame"})
      self.object:remove()
   end,
})

mobs:register_mob("mobs_loz:dodongo_boss", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 82,
	hp_max = 125,
	armor = 80,
	collisionbox = {-2, 0, -2, 1.5, 4.5, 2},
	visual = "mesh",
	mesh = "dodongo.b3d",
	textures = {
		{"mobs_dodongo_boss.png"}
	},
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	sounds = {
		random = "dinosaur_roar",
	},
	walk_velocity = 2,
	run_velocity = 3.5,
	jump = 0,
	floats = 0,
	view_range = 14,
	drops = {
		{name = "hyruletools:foreststone",
		chance = 1, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
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
	water_damage = 5,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 25,
		stand_end = 45,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 45,
		punch_end = 65,
		shoot_start = 45,
		shoot_end = 65,
	},
})

--mobs:register_spawn("mobs_loz:dodongo_boss", {"hyrule_mapgen:dodongo_spawn"}, 20, 0, 7000, 1, 31000)

mobs:register_egg("mobs_loz:dodongo_boss", "Boss Dodongo", "default_lava.png", 1)