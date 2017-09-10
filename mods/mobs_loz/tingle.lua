mobs:register_mob("mobs_loz:tingle", {
	type = "animal",
	passive = true,
	hp_min = 13,
	hp_max = 27,
	armor = 150,
	collisionbox = {-0.2, -0, -0.2, 0.2, 1.3, 0.2},
	--visual_size = {x=1.5, y=1.5},
	visual = "mesh",
	mesh = "tingle.b3d",
	textures = {
		{"mobs_tingle.png"},
	},
	blood_texture = "hyruletools_yellowstar.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 1,
	run_velocity = 6,
	runaway = true,
	runaway_timer = 30,
	jump = false,
	drops = {
		{name = "hyruletools:nyan_rupee",
		chance = 2, min = 1, max = 1},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	on_rightclick = function(self, clicker)
		local name = clicker:get_player_name()
		local pos = self.object:getpos()
		minetest.chat_send_player(name, "Tingle, Tingle! Kooloo-Limpah!")
		self.state = "stand"
		self.object:set_animation({x=1, y=20}, 12, 0)
			minetest.add_particlespawner({
			amount = 3,
			time = 1.5,
			minpos = {x=pos.x-0.2, y=pos.y+0.5, z=pos.z-0.2},
			maxpos = {x=pos.x+0.2, y=pos.y+0.1, z=pos.z+0.2},
			minvel = {x=-1, y=2, z=-1},
			maxvel = {x=1, y=4, z=1},
			minacc = {x=0, y=-7, z=0},
			maxacc = {x=0, y=-7, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 1,
			maxsize = 2,
			collisiondetection = false,
			texture = "hyruletools_yellowstar.png"
		})
	end,
	water_damage = -1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 10,
	animation = {
		speed_normal = 12,
		speed_run = 24,
		punch_start = 1,
		punch_end = 20,
		stand_start = 50,
		stand_end = 73,
		walk_start = 25,
		walk_end = 45,
		run_start = 25,
		run_end = 45,
	},
})

--mobs:register_egg("mobs_loz:tingle", "tingle", "hyruletools_spark.png", 1)