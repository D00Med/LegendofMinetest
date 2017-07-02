
mobs:register_mob("mobs_loz:octorock", {
	type = "monster",
	passive = false,
	attack_type = "shoot",
	shoot_interval = 1.5,
	arrow = "mobs_loz:octorock_rock",
	shoot_offset = 1.2,
	hp_min = 20,
	hp_max = 35,
	armor = 150,
	collisionbox = {-0.5, 0, -0.5, 0.5, 0.8, 0.5},
	visual_size = {x=1.5, y=1.5},
	visual = "mesh",
	mesh = "octorock.b3d",
	textures = {
		{"mobs_octorock.png"},
		{"mobs_octorock2.png"},
	},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 1,
	run_velocity = 1.5,
	jump = false,
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 3,
	drops = {
		{name = "hyruletools:blue_rupee",
		chance = 5, min = 5, max = 5},
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
		speed_normal = 12,
		speed_run = 12,
		stand_start = 1,
		stand_end = 12,
		walk_start = 18,
		walk_end = 38,
		run_start = 18,
		run_end = 38,
		shoot_start = 1,
		shoot_end = 12,
	},
})


mobs:register_arrow("mobs_loz:octorock_rock", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"mobs_octorock_shot.png"},
	velocity = 8,
   
	hit_player = function(self, player)
	local item = player:get_wielded_item():get_name()
	if item ~= "shields:shield_steel" and item ~= "shields:shield_admin" and item ~= "shields:shield_bronze" and item ~= "shields:shield_wood" and item ~= "shields:shield_cactus" and item ~= "shields:shield_wood_enhanced" and item ~= "shields:shield_cactus_enhanced" then
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 2},
      }, nil)
	  end
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 2},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      self.object:remove()
   end,
})

mobs:register_egg("mobs_loz:octorock", "Octorock", "default_sand.png", 1)

mobs:register_mob("mobs_loz:octorock_boss", {
	type = "monster",
	passive = false,
	attack_type = "shoot",
	shoot_interval = 1.5,
	arrow = "mobs_loz:octorock_rock",
	shoot_offset = 1,
	hp_min = 20,
	hp_max = 35,
	armor = 80,
	collisionbox = {-1, 0, -1, 1, 2, 1},
	visual_size = {x=3.6, y=3.6},
	visual = "mesh",
	mesh = "octorock.b3d",
	textures = {
		{"mobs_octorock_giant.png"},
	},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 1,
	run_velocity = 1.5,
	jump = false,
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 3,
	drops = {
		{name = "hyruletools:magglv_n",
		chance = 1, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
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
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 12,
		speed_run = 12,
		stand_start = 1,
		stand_end = 12,
		walk_start = 18,
		walk_end = 38,
		run_start = 18,
		run_end = 38,
		shoot_start = 1,
		shoot_end = 12,
	},
})

--mobs:register_spawn("mobs_loz:octorock_boss", {"default:sand", "default:dirt_with_grass3", "default:desert_sand"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("mobs_loz:octorock_boss", "Big Octorock", "default_sand.png", 1)