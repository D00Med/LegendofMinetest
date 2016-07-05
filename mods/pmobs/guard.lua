
-- Guard

mobs:register_mob("pmobs:guard", {
	-- animal, monster, npc
	type = "npc",
	passive = true,
	damage = 7,
	attack_type = "dogfight",
	attacks_monsters = true,
	owner = "",
	order = "follow",
	-- health & armor
	hp_min = 10, hp_max = 20, armor = 100,
	-- textures and model
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "guard.x",
	drawtype = "front",
	textures = {
		{"mobs_npc.png", "npcf_skin_armor.png", "default_tool_steelsword.png"},
	},
	visual_size = {x=1, y=1},
	-- sounds
	makes_footstep_sound = true,
	sounds = {},
	-- speed and jump
	walk_velocity = 3,
	run_velocity = 3,
	jump = true,
	-- drops wood and chance of apples when dead
	drops = {
		{name = "default:wood",
		chance = 1, min = 1, max = 3},
		{name = "default:apple",
		chance = 2, min = 1, max = 2},
		{name = "default:axe_stone",
		chance = 3, min = 1, max = 1},
	},
	-- damaged by
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,

	view_range = 15,
	-- model animation
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	-- right clicking with cooked meat will give npc more health
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs:meat" or item:get_name() == "farming:bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)
		
			
		-- right clicking with gold lump drops random item from mobs.npc_drops
		elseif item:get_name() == "default:gold_lump" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = mobs.npc_drops[math.random(1,#mobs.npc_drops)]})
		else
			if self.owner == "" then
				self.owner = clicker:get_player_name()
			else
				if self.order == "follow" then
					self.order = "stand"
				else
					self.order = "follow"
				end
			end
		end
	end,
})

mobs:register_egg("pmobs:guard", "Guard", "default_steel_block.png", 1)


