
mobs:register_mob("mobs_loz:subrosian", {
	type = "animal",
	passive = true,
	damage = 0,
	attack_type = "dogfight",
	hp_min = 10,
	hp_max = 25,
	armor = 120,
	collisionbox = {-0.4, 0, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "subrosian.b3d",
	textures = {
		{"mobs_subrosian.png"},
		{"mobs_subrosian2.png"},
		{"mobs_subrosian3.png"},
	},
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 0.5,
	run_velocity = 0,
	jump = true,
	jump_height = 4,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 3,
	drops = {
		{name = "default:stone",
		chance = 9, min = 1, max = 3},
		{name = "hyruletools:red_ore",
		chance = 1, min = 1, max = 2},
	},
	on_die = function(self)
		local pos = self.object:getpos()
		if math.random(1,2) == 2 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
	end,
	water_damage = 1,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 12,
		speed_run = 15,
		stand_start = 20,
		stand_end = 40,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		
		if item:get_name() == "hyruletools:red_ore" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:obsidian"})
		elseif item:get_name() == "hyruletools:blue_ore" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:iron_lump"})
			end
		end,
})

mobs:register_egg("mobs_loz:subrosian", "Subrosian", "hyrule_mapgen_subrosianstone.png", 1)