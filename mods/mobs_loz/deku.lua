
-- deku by D00Med
-- an edit of mese monster by Zeg9

mobs:register_mob("mobs_loz:deku", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "shoot",
	shoot_interval = 2.5,
	arrow = "mobs:deku_nut",
	shoot_offset = 2,
	hp_min = 10,
	hp_max = 25,
	armor = 80,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
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
	walk_velocity = 0.5,
	run_velocity = 0,
	jump = false,
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 3,
	drops = {
		{name = "default:stick",
		chance = 9, min = 1, max = 3},
		{name = "maptools:copper_coin",
		chance = 1, min = 1, max = 9},
	},
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 25,
		speed_run = 15,
		stand_start = 0,
		stand_end = 55,
		walk_start = 150,
		walk_end = 173,
		run_start = 0,
		run_end = 55,
		punch_start = 60,
		punch_end = 88,
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		
		if item:get_name() == "maptools:copper_coin" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:leaves"})
		elseif item:get_name() == "maptools:silver_coin" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:stick"})
		
		elseif item:get_name() == "maptools:silver_coin" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:stick"})
		elseif item:get_name() == "maptools:gold_coin" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:dirt"})
			end
		end,
})

mobs:register_spawn("mobs_loz:deku", {"default:dirt_with_grass", "default:dirt_with_grass2"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("mobs_loz:deku", "deku(passive)", "default_leaves.png", 1)


