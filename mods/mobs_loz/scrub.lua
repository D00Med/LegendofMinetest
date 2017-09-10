
-- deku_scrub by D00Med
-- an edit of mese monster by Zeg9

mobs:register_mob("mobs_loz:deku_scrub", {
	type = "monster",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "shoot",
	shoot_interval = 1.7,
	arrow = "mobs_loz:deku_nut",
	shoot_offset = 1.5,
	hp_min = 10,
	hp_max = 25,
	armor = 150,
	collisionbox = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	visual = "mesh",
	mesh = "scrub2.b3d",
	textures = {
		{"mobs_scrub.png"},
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
		speed_normal = 15,
		speed_run = 25,
		stand_start = 123,
		stand_end = 146,
		walk_start = 123,
		walk_end = 146,
		run_start = 123,
		run_end = 146,
		shoot_start = 60,
		shoot_end = 88,
	},
})


mobs:register_arrow("mobs_loz:deku_nut", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"mobs_nut.png"},
	velocity = 8,
   tail = 0, -- enable tail
   tail_texture = "default_dirt.png",
   
	hit_player = function(self, player)
	local item = player:get_wielded_item():get_name()
	if item ~= "shields:shield_steel" and item ~= "shields:shield_admin" and item ~= "shields:shield_bronze" and item ~= "shields:shield_wood" and item ~= "shields:shield_cactus" and item ~= "shields:shield_wood_enhanced" and item ~= "shields:shield_cactus_enhanced" then
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 1},
      }, nil)
	  end
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

mobs:register_egg("mobs_loz:deku_scrub", "deku_scrub", "default_leaves.png", 1)



