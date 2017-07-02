

playereffects.register_effect_type("paralysed", "Paralysed", nil, {"speed"}, 
	function(player)
		player:set_physics_override(0.001,0,nil)
		physics_overriden = true
	end,
	
	function(effect, player)
		player:set_physics_override(1,1,nil)
		physics_overriden = false
	end,
	false
)


mobs:register_mob("mobs_loz:redead", {
	type = "monster",
	passive = false,
	reach = 2,
	damage = 3,
	attack_type = "dogfight",
	hp_min = 20,
	hp_max = 30,
	armor = 150,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.7, 0.4},
	visual = "mesh",
	mesh = "character.b3d",
	drawtype = "front",
	textures = {
		{"redead.png"},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,3) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
		minetest.env:add_entity(pos, "experience:orb")
	end,
	makes_footstep_sound = true,
	walk_velocity = 0.6,
	run_velocity = 0.7,
	water_damage = 1,
	lava_damage = 2,
	light_damage = 5,
	view_range = 4,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	do_custom = function(self)
		local pos = self.object:getpos()
			local objs = minetest.get_objects_inside_radius(pos, 2)	
			for k, obj in pairs(objs) do
					if obj:is_player() and math.random(1,10) == 10 then
						playereffects.apply_effect_type("paralysed", 5, obj)
				end
			end
	end
})

mobs:register_egg("mobs_loz:redead", "Redead", "default_dirt.png", 1)