
if mobs.mod and mobs.mod == "redo" then
--change skin texture to l_skins for differrent colours
-- local variables
	local l_skins = {
		{"fairy2.png"},
		{"fairy2.png^[colorize:lime:190"},
		{"fairy2.png^[colorize:purple:190"},
		{"fairy2.png^[colorize:pink:190"},
		{"fairy2.png^[colorize:orange:190"},
		{"fairy2.png^[colorize:white:190"},
		{"fairy2.png^[colorize:yellow:190"}
	}
	
	mobs:register_mob("mobs_fairy:fairy", {
		type = "monster",
		passive = false,
		light_source = 30,
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
		{"fairy2.png"}
		},
		rotate = 0,
		walk_velocity = 2,
		run_velocity = 3,
		fall_speed = 0,
		stepheight = 10,
		do_custom = function(self, pos)
		local pos = self.object:getpos()
		minetest.add_particlespawner(
			1, --amount
			2, --time
			{x=pos.x-0.1, y=pos.y, z=pos.z-0.1}, --minpos
			{x=pos.x+0.1, y=pos.y, z=pos.z+0.1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.2,y=-0.2,z=-0.2}, --minacc
			{x=0.2,y=-0.5,z=0.2}, --maxacc
			3, --minexptime
			3, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"mobs_fairy_spark.png" --texture
		)
		end,
		sounds = {
			random = "mobs_fairy",
		},
		fly = true,
		water_damage = 2,
		lava_damage = 10,
		light_damage = 0,
		view_range = 2,
		animation = {
			speed_normal = 20,		speed_run = 30,
			stand_start = 1,		stand_end = 10,
			walk_start = 1,		walk_end = 10,
			run_start = 1,			run_end = 10,
			punch_start = 1,		punch_end = 10
		},
		on_rightclick = function(self, clicker)
			mobs:capture_mob(self, clicker, 5, 60, 0, true, nil)
		end
	})
	
	
	--name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height
	mobs:spawn_specific("mobs_fairy:fairy", {"air"}, {"default:tree"}, 20, 10, 300, 15000, 2, -100, 11000)
	mobs:register_egg("mobs_fairy:fairy", "Fairy", "fairy_inv.png", 0)
	mobs:register_spawn("mobs_fairy:fairy",	{"default:dirt_with_grass", "default:dirt_with_grass2", "default:dirt_with_grass3"}, 20, 10, 15000, 2, 31000, true)
	mobs:register_spawn("mobs_fairy:fairy",	{"hyrule_mapgen:healwater_src"}, 20, 10, 1500, 2, 31000, true)
	
end
