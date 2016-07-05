
-- goron by D00Med
-- an edit of mese monster by Zeg9

mobs:register_mob("mobs_loz:goron", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 80,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	mesh = "goron.b3d",
	textures = {
		{"mobs_goron.png"},
	},
	blood_texture = "default_stone.png",
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 0.5,
	run_velocity = 0,
	jump = false,
	jump_height = 0,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 3,
	drops = {
		{name = "default:stone",
		chance = 9, min = 1, max = 3},
		{name = "maptools:copper_coin",
		chance = 1, min = 1, max = 2},
	},
	water_damage = 1,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 20,
		speed_run = 15,
		stand_start = 33,
		stand_end = 33,
		walk_start = 4,
		walk_end = 23,
		run_start = 4,
		run_end = 23,
		punch_start = 29,
		punch_end = 44,
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
			minetest.add_item(pos, {name = "default:obsidian"})
		elseif item:get_name() == "maptools:silver_coin" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:iron_lump"})
		
		elseif item:get_name() == "maptools:silver_coin" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:copper_lump"})
		elseif item:get_name() == "maptools:gold_coin" then
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

mobs:register_spawn("mobs_loz:goron", {"default:stone", "lavabiome:dirt"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("mobs_loz:goron", "goron", "lavabiome_dirt.png", 1)
