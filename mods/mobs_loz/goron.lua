
-- goron by D00Med
-- an edit of mese monster by Zeg9

mobs:register_mob("mobs_loz:goron", {
	type = "animal",
	passive = false,
	reach = 2.5,
	damage = 5,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 100,
	collisionbox = {-0.4, 0, -0.4, 0.4, 1.5, 0.4},
	visual = "mesh",
	mesh = "goron.b3d",
	textures = {
		{"mobs_goron.png"},
	},
	blood_texture = "default_stone.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 1.5,
	run_velocity = 4,
	jump = false,
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 3,
	drops = {
		{name = "default:stone",
		chance = 9, min = 1, max = 3},
		{name = "hyruletools:green_rupee",
		chance = 5, min = 1, max = 2},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,6) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
	end,
	water_damage = 1,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 13,
		speed_run = 17,
		stand_start = 1,
		stand_end = 14,
		walk_start = 25,
		walk_end = 45,
		run_start = 50,
		run_end = 70,
		punch_start = 50,
		punch_end = 70,
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		
		if item:get_name() == "hyruletools:green_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:obsidian"})
		elseif item:get_name() == "hyruletools:blue_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:iron_lump"})
		
		elseif item:get_name() == "hyruletools:blue_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:copper_lump"})
		elseif item:get_name() == "hyruletools:red_rupee" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "mobs:pork_raw"})
			end
		end,
})

mobs:register_egg("mobs_loz:goron", "Goron", "hyrule_mapgen_dirt.png", 1)
