
mobs:register_mob("mobs_loz:leever", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	damage = 1,
	hp_min = 5,
	hp_max = 10,
	armor = 130,
	collisionbox = {-0.3, -0, -0.3, 0.3, 0.4, 0.3},
	visual_size = {x=1, y=1},
	visual = "mesh",
	mesh = "leever.b3d",
	textures = {
		{"mobs_leever.png"},
	},
	makes_footstep_sound = true,
	view_range = 7,
	walk_velocity = 1,
	run_velocity = 1.5,
	jump_height = 0,
	drops = {
		{name = "hyruletools:green_rupee",
		chance = 5, min = 1, max = 3},
	},
	do_custom = function(self)
		if not self.active then
		minetest.after(10, function()
		if self.object ~= nil and self.object:getpos() ~= nil then
		local pos = self.object:getpos()
			minetest.add_particlespawner({
			amount = 10,
			time = 0.5,
			minpos = {x=pos.x-0.2, y=pos.y-0.3, z=pos.z-0.2},
			maxpos = {x=pos.x+0.2, y=pos.y+0.5, z=pos.z+0.2},
			minvel = {x=-0.5, y=2, z=-0.5},
			maxvel = {x=0.5, y=4, z=0.5},
			minacc = {x=0, y=-7, z=0},
			maxacc = {x=0, y=-7, z=0},
			minexptime = 2,
			maxexptime = 3,
			minsize = 1,
			maxsize = 2,
			collisiondetection = true,
			texture = "default_dirt.png"
		})
		self.object:set_properties({physical = false})
		minetest.after(1, function()
			self.object:remove()
		end)
		end
		end)
		self.active = true
		end
	end,
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,10) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 20,
		stand_end = 40,
		walk_start = 3,
		walk_end = 16,
		run_start = 3,
		run_end = 17,
		punch_start = 3,
		punch_end = 16,
	},
})

mobs:register_egg("mobs_loz:leever", "Leever", "default_sand.png", 1)