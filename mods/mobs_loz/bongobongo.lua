--bongobongo by D00Med
-- edit of Stone Monster by PilzAdam


mobs:register_arrow("mobs_loz:beam", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"mobs_loz_beam.png"},
	velocity = 4,
   tail = 1, -- enable tail
   tail_texture = "mobs_loz_beam.png",
   
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

mobs:register_mob("mobs_loz:bongobongo", {
	type = "monster",
	passive = false,
   attack_type = "dogshoot",
   shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
   arrow = "mobs_loz:beam",
   shoot_offset = 1,
	reach = 6,
	damage = 3,
	hp_min = 102,
	hp_max = 125,
	armor = 90,
	collisionbox = {-2, 0, -2, 1.5, 3.5, 2},
	visual = "mesh",
	mesh = "bongobongo.b3d",
	textures = {
		{"mobs_bongobongo_invisible.png"}
	},
	visual_size = {x=1.5, y=1.5},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_oerkki",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = false,
	floats = 2,
   fall_speed = -1,
	view_range = 18,
	drops = {
		{name = "hyruletools:waterstone",
		chance = 1, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(2,2) == 2 then
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
		speed_normal = 10,
		speed_run = 15,
		stand_start = 70,
		stand_end = 90,
		walk_start = 25,
		walk_end = 45,
		run_start = 25,
		run_end = 45,
		punch_start = 45,
		punch_end = 65,
		shoot_start = 1, 
		shoot_end = 25,
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
		minetest.set_node(pos, {name = "default:water_source"})
	end,
	on_rightclick = function(self, clicker)
	local inv = clicker:get_inventory()
		if clicker:get_wielded_item():get_name() == "hyruletools:eye" then
		self.object:set_properties({
				textures = {"mobs_bongobongo.png"},
			})
		end
	end,
})

--mobs:register_spawn("mobs_loz:dodongo_boss", {"hyrule_mapgen:dodongo_spawn"}, 20, 0, 7000, 1, 31000)

mobs:register_egg("mobs_loz:bongobongo", "Boss BongoBongo", "default_obsidian.png", 1)