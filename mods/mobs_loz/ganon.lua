--bongobongo by D00Med
-- edit of Stone Monster by PilzAdam


mobs:register_arrow("mobs_loz:swdbm", {
	visual = "sprite",
	visual_size = {x = 2, y = 1},
	textures = {"mobs_loz_swdbeam.png"},
	velocity = 4,
   tail = 1, -- enable tail
   tail_texture = "mobs_loz_swdbeam.png",
   
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
		--minetest.set_node(pos, {name="fire:basic_flame"})
      self.object:remove()
   end,
})

mobs:register_mob("mobs_loz:ganon", {
	type = "monster",
	passive = false,
   attack_type = "dogshoot",
   shoot_interval = 1.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
   arrow = "mobs_loz:swdbm",
   shoot_offset = 1,
	reach = 6,
	damage = 3,
	hp_min = 202,
	hp_max = 225,
	armor = 80,
	collisionbox = {-1, 0, -1, 1, 2.5, 1},
	visual_size = {x=1.3, y=1.3},
	visual = "mesh",
	mesh = "ganon.b3d",
	textures = {
		{"mobs_ganon.png"}
	},
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_pig_angry_slow",
	},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	floats = 1,
	view_range = 28,
	drops = {
		{name = "hyruletools:triforce",
		chance = 1, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 16,
		speed_run = 19,
		stand_start = 36,
		stand_end = 56,
		walk_start = 60,
		walk_end = 80,
		run_start = 60,
		run_end = 80,
		punch_start = 1,
		punch_end = 20,
		shoot_start = 20, 
		shoot_end = 36,
	},
	on_die = function(self, pos)
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
	do_custom = function(self)
		local pos = self.object:getpos()
		if minetest.find_node_near(pos, 10, {"hyrule_mapgen:ganon_sphere"}) then
			if self.health <= 100 then
			self.health = 200
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
			texture = "mobs_loz_light.png^[colorize:red:100",
			glow = 9
		})
		end)
		end
			self.object:set_animation({x=85, y=105}, 12, 0)
			end
		end
	end
})

--mobs:register_spawn("mobs_loz:dodongo_boss", {"hyrule_mapgen:dodongo_spawn"}, 20, 0, 7000, 1, 31000)

mobs:register_egg("mobs_loz:ganon", "Boss Ganon", "default_dirt.png", 1)