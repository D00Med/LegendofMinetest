
if mobs.mod and mobs.mod == "redo" then
	
	mobs:register_mob("mobs_fairy:fairy", {
		type = "animal",
		passive = true,
		damage = -1,
		reach = 1,
		attack_type = "dogfight",
		hp_min = 7,
		hp_max = 12,
		armor = 130,
		collisionbox = {-0.1,-0.1,-0.1, 0.1,0.1,0.1},
		visual = "mesh",
		mesh = "fairy2.b3d",
		textures = {
		{"fairy.png"},
		{"fairy_1.png"},
		{"fairy_2.png"},
		{"fairy_3.png"},
		{"fairy_4.png"},
		},
		visual_size = {x=1.5, y=1.5},
		rotate = 0,
		walk_velocity = 2,
		run_velocity = 3,
		fall_speed = 0,
		stepheight = 10,
		do_custom = function(self, pos)
		local pos = self.object:getpos()
		minetest.add_particle({
			pos = {x=pos.x+math.random(-1,1)/10, y=pos.y, z=pos.z+math.random(-1,1)/10},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=math.random(-2,2)/10, y=math.random(-2,-5)/10, z=math.random(-2,2)/10},
			expirationtime = math.random(5,10)/10,
			size = math.random(1,2),
			collisiondetection = false,
			collisionremoval = false,
			vertical = false,
			texture = "mobs_fairy_spark.png",
			glow = 9
		})
		
		local objs = minetest.env:get_objects_inside_radius(pos, 1.5) 
		for _, obj in pairs(objs) do
			if obj:is_player() == true then
				local player = obj:get_luaentity()
				local hp = obj:get_hp()
				obj:set_hp(hp+10)
				self.object:remove()
			end
		end
		
		end,
		sounds = {
			random = "fairy",
		},
		fly = true,
		water_damage = 2,
		lava_damage = 10,
		light_damage = 0,
		view_range = 2,
		animation = {
			speed_normal = 40,		speed_run = 60,
			stand_start = 1,		stand_end = 10,
			walk_start = 1,		walk_end = 10,
			run_start = 1,			run_end = 10,
			punch_start = 1,		punch_end = 10
		},
		on_rightclick = function(self, clicker)
			local itemstack = clicker:get_wielded_item()
			if itemstack:get_name() == "bucket:bucket_empty" and math.random(1,3) == 3 then
			itemstack:take_item()
			clicker:set_wielded_item(itemstack)
			local pos = self.object:getpos()
			minetest.add_item(pos, "mobs_fairy:fairy")
			self.object:remove()
			end
		end
	})
	
	
	--name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific("mobs_fairy:fairy", {"air"}, {"default:tree"}, 20, 10, 300, 15000, 2, -100, 11000)
	mobs:register_egg("mobs_fairy:fairy", "Fairy", "fairy_inv.png", 0)
	mobs:register_spawn("mobs_fairy:fairy",	{"default:dirt_with_grass", "default:dirt_with_grass2", "default:dirt_with_grass3"}, 20, 10, 15000, 2, 31000, true)
	mobs:register_spawn("mobs_fairy:fairy",	{"hyrule_mapgen:healwater_src"}, 20, 10, 1500, 2, 31000, true)
	
end
