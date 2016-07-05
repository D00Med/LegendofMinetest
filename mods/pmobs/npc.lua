
-- Npc by TenPlus1

mobs.npc_drops = { "default:pick_steel", "mobs:meat", "default:sword_steel", "default:shovel_steel", "farming:bread", "bucket:bucket_water" }

mobs:register_mob("pmobs:npc", {
	-- animal, monster, npc
	type = "npc",
	-- aggressive, deals 2 damage to player/monster when hit
	passive = false,
	damage = 2,
	attack_type = "dogfight",
	attacks_monsters = true,
	-- health & armor
	hp_min = 10, hp_max = 20, armor = 100,
	-- textures and model
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "character.b3d",
	drawtype = "front",
	textures = {
		{"mobs_npc.png"},
		{"mobs_npc2.png"},
		{"mobs_npc3.png"},
		{"mobs_npc4.png"},
		{"mobs_npc5.png"},
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
		if item:get_name() == "default:sword_steel" then
			minetest.add_entity(self.object:getpos(), "pmobs:guard")
			self.object:remove()
			clicker:get_inventory():remove_item("main", "default:sword_steel")
		elseif item:get_name() == "mobs:meat" or item:get_name() == "farming:bread" then
			local hp = self.object:get_hp()
			if hp + 4 > self.hp_max then return end
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.object:set_hp(hp+4)
		
			
		-- right clicking with rupee drops random item from mobs.npc_drops
		elseif item:get_name() == "maptools:copper_coin" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "default:tree"})
		elseif item:get_name() == "maptools:silver_coin" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "farming:string"})
		
		elseif item:get_name() == "maptools:silver_coin" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "farming:string"})
		elseif item:get_name() == "maptools:gold_coin" then
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
-- spawning disabled for now
mobs:register_spawn("pmobs:npc", {"default:dirt_with_grass", "default:dirt_with_grass2", "default:dirt_with_grass3"}, 20, 0, 12000, 1, 31000)

-- register spawn egg
mobs:register_egg("pmobs:npc", "Npc", "default_brick.png", 1)

