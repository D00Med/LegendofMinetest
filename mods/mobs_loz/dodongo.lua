--baby dodongo by D00Med
-- edit of Stone Monster by PilzAdam

local l_skins = {
		{"dodongo.png"},
	}

mobs:register_mob("mobs_loz:bdodongo", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	damage = 1,
	hp_min = 12,
	hp_max = 25,
	armor = 80,
	collisionbox = {-0.2, -0.2, -0.2, 0.2, 0.4, 0.4},
	visual = "mesh",
	mesh = "babydodongo.b3d",
	textures = l_skins,
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_stonemonster",
	},
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = false,
	floats = 0,
	view_range = 5,
	drops = {
		{name = "hyruletools:blue_rupee",
		chance = 2, min = 3, max = 5},
		{name = "default:iron_lump",
		chance=5, min=1, max=2},
		{name = "default:coal_lump",
		chance=3, min=1, max=3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
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
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 30,
		run_start = 0,
		run_end = 30,
		punch_start = 0,
		punch_end = 30,
	},
	on_die = function(self, pos)
		minetest.set_node(pos, {name = "fire:basic_flame"})
	end,
})

mobs:register_egg("mobs_loz:bdodongo", "Baby Dodongo", "default_lava.png", 1)


mobs:register_mob("mobs_loz:dodongo", {
	type = "monster",
	passive = false,
	attack_type = "shoot",
	shoot_interval = 2.5,
	arrow = "mobs_loz:fire",
	shoot_offset = 2,
	reach = 1,
	damage = 2,
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
		random = "mobs_stonemonster",
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
	armor = 60,
	collisionbox = {-2, 0, -2, 1.5, 4.5, 2},
	visual = "mesh",
	mesh = "dodongo.b3d",
	textures = {
		{"mobs_dodongo_boss.png"}
	},
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_stonemonster",
	},
	walk_velocity = 1,
	run_velocity = 2.5,
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
	on_die = function(self, pos)
		minetest.set_node(pos, {name = "fire:basic_flame"})
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

--mobs:register_spawn("mobs_loz:dodongo_boss", {"hyrule_mapgen:dodongo_spawn"}, 20, 0, 7000, 1, 31000)

mobs:register_egg("mobs_loz:dodongo_boss", "Boss Dodongo", "default_lava.png", 1)