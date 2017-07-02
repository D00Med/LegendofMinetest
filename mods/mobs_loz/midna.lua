
mobs:register_mob("mobs_loz:midna", {
	type = "npc",
	passive = false,
	attacks_monsters = true,
	damage = 4,
	reach = 3,
	attack_type = "dogfight",
	hp_min = 50,
	hp_max = 85,
	armor = 80,
	order = "follow",
	collisionbox = {-0.3, 0, -0.3, 0.3, 1.5, 0.3},
	visual = "mesh",
	mesh = "midna.b3d",
	textures = {{"mobs_midna.png"},},
	visual_size = {x=2.5, y=2.5},
	blood_texture = "mobs_particle.png",
	makes_footstep_sound = false,
	view_range = 10,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	jump_height = 1,
	fall_damage = 0,
	fall_speed = -0.7,
	stepheight = 1.5,
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 1,
		stand_end = 26,
		walk_start = 52,
		walk_end = 72,
		run_start = 52,
		run_end = 72,
		punch_start = 26,
		punch_end = 50,
	},
	do_custom = function(self, dtime)
		if math.random(1,4) ~= 1 then return end
		local pos = self.object:getpos()
	minetest.add_particle({
		pos = {x=pos.x+math.random(-10,10)/10, y=pos.y+math.random(0,10)/10, z=pos.z+math.random(-10,10)/10},
        velocity = {x = math.random(-1,1)/10, y = 0.4, z = math.random(-1,1)/10},
        acceleration = {x = math.random(-1,1)/10, y=0.5, z = math.random(-1,1)/10},
        expirationtime = 0.8,
        size = math.random(5, 20)/10,
		collisiondetection = true,
		collisionremoval = true,
		vertical = true,
		texture = "twilight_twilight"..math.random(1,2)..".png",
		glow = 5
	})
	end,
})

--mobs:register_spawn("mobs_loz:midna", {"default:dirt_with_grass", "default:dirt_with_grass2"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("mobs_loz:midna", "Midna", "hyrulemapgen_glowstone.png", 1)