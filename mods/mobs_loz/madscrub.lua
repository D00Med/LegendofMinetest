-- mad_scrub by D00Med
-- an edit of mese monster by Zeg9

mobs:register_mob("mobs_loz:mad_scrub", {
	type = "monster",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "shoot",
	shoot_interval = 1.7,
	arrow = "mobs_loz:deku_nut",
	shoot_offset = 1.5,
	hp_min = 30,
	hp_max = 35,
	armor = 130,
	collisionbox = {-0.4, 0, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	mesh = "mad_scrub.b3d",
	textures = {
		{"mobs_madscrub.png"},
		{"mobs_madscrub2.png"},
	},
	blood_texture = "default_wood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "default_grass_footstep.1",
		attack = "default_grass_footstep.2",
	},
	view_range = 5,
	walk_velocity = 0.01,
	run_velocity = 0,
	jump = false,
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 3,
	drops = {
		{name = "hyruletools:blue_rupee",
		chance = 5, min = 5, max = 3},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 10,
		speed_run = 15,
		stand_start = 1,
		stand_end = 20,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		shoot_start = 20,
		shoot_end = 38,
	},
})

mobs:register_egg("mobs_loz:mad_scrub", "Mad Scrub", "default_leaves.png", 1)

mobs:register_arrow("mobs_loz:deku_nut", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"mobs_nut.png"},
	velocity = 6,
   tail = 0, -- enable tail
   tail_texture = "default_dirt.png",
   
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
      self.object:remove()
   end,
})