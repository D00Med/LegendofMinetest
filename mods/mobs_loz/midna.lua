
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
	owner = "",
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
		local pos = self.object:getpos()
		minetest.add_particlespawner(
			1, --amount
			2, --time
			{x=pos.x-0.3, y=pos.y-0.3, z=pos.z-0.3}, --minpos
			{x=pos.x+1, y=pos.y+1, z=pos.z+1}, --maxpos
			{x=0, y=0, z=0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0,y=0,z=-0}, --minacc
			{x=0,y=1,z=0}, --maxacc
			1, --minexptime
			2, --maxexptime
			0.5, --minsize
			1, --maxsize
			false, --collisiondetection
			"mobs_particle.png" --texture
		)
	end,
	on_rightclick = function(self, clicker)
		local player = clicker:get_player_name()
			if self.order == "follow" then
				self.order = "stand"
				minetest.chat_send_player(player, "I will stay here")
			else
				self.order = "follow"
				minetest.chat_send_player(player, "Midna is wandering")
			end
	end,
})

--mobs:register_spawn("mobs_loz:midna", {"default:dirt_with_grass", "default:dirt_with_grass2"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("mobs_loz:midna", "Midna", "hyrulemapgen_glowstone.png", 1)