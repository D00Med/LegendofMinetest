
-- zora by D00Med
-- an edit of mese monster by Zeg9

mobs:register_mob("mobs_loz:zora", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 80,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	mesh = "zora.b3d",
	textures = {
		{"mobs_zora.png"},
	},
	blood_texture = "icetools_shard.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 1,
	run_velocity = 2,
	jump = false,
		stepheight = 5,
		fly = true,
		fly_in = "default:water_source",
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 3,
	drops = {
		{name = "icetools:ice_shard",
		chance = 9, min = 1, max = 3},
		{name = "maptools:copper_coin",
		chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 0,
		stand_end = 40,
		walk_start = 50,
		walk_end = 68,
		run_start = 50,
		run_end = 68,
		punch_start = 50,
		punch_end = 68,
	},
	do_custom = function(self)

		if not self.child
		and math.random(1, 100) == 1 then

			local pos = self.object:getpos()

			minetest.add_item(pos, "mobs:scale")
		end
	end,
})

mobs:register_spawn("mobs_loz:zora", {"default:water_source", "default:water_flowing"}, 20, 10, 15000, 2, 11000)

mobs:register_egg("mobs_loz:zora", "zora", "default_ice.png", 1)

for _, player in ipairs(minetest.get_connected_players()) do
local name = minetest.get_player_name()
local pos = player:getpos()
end

minetest.register_craftitem("mobs_loz:scale", {
	description = "Zora scale",
	inventory_image = "mobs_scale.png",
	on_use = function(item, user, pointed_thing)
		local player = user:get_player_name()
		local breath = user:get_breath()
	if breath <= 10 then
		local spd = user:set_physics_override({

		speed = 4, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1.0, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
	end
		local reset = minetest.after(50, function()
			user:set_physics_override({

		speed = 1.5, -- multiplier to default value
		jump = 1.0, -- multiplier to default value
		gravity = 1.0, -- multiplier to default value
		sneak = true, -- whether player can sneak
		sneak_glitch = false, -- whether player can use the sneak glitch 

		})
		end)
	end
})