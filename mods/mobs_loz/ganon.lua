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
	collisionbox = {-1, -1.5, -1, 1, 1.5, 1},
	visual = "mesh",
	mesh = "ganon.b3d",
	textures = {
		{"ganon.png"}
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
		speed_normal = 18,
		speed_run = 25,
		stand_start = 21,
		stand_end = 46,
		walk_start = 49,
		walk_end = 88,
		run_start = 49,
		run_end = 88,
		punch_start = 1,
		punch_end = 21,
		punch2_start = 21,
		punch2_end = 46,
		shoot_start = 1, 
		shoot_end = 21,
	},
	on_die = function(self, pos)
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
	do_custom = function(self)
		local pos = self.object:getpos()
		if minetest.find_node_near(pos, 10, {"hyrule_mapgen:ganon_sphere"}) then
			if self.health <= 100 then
			self.health = 200
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
			"mobs_loz_light.png^[colorize:red:100" --texture
			)
			end
		end
	end
})

--mobs:register_spawn("mobs_loz:dodongo_boss", {"hyrule_mapgen:dodongo_spawn"}, 20, 0, 7000, 1, 31000)

mobs:register_egg("mobs_loz:ganon", "Boss Ganon", "default_dirt.png", 1)