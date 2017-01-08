
-- Npc by TenPlus1

mobs.npc_drops = {
	"default:pick_steel", "mobs:meat", "default:sword_steel",
	"default:shovel_steel", "farming:bread", "bucket:bucket_water"
}

mobs:register_mob("mobs_npc:npc", {
	type = "npc",
	passive = false,
	damage = 3,
	attack_type = "dogfight",
	attacks_monsters = true,
	pathfinding = true,
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "character.b3d",
	drawtype = "front",
	textures = {
		{"mobs_npc.png"},
		{"mobs_npc2.png"}, -- female by nuttmeg20
	},
	child_texture = {
		{"mobs_npc_baby.png"}, -- derpy baby by AmirDerAssassine
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "default:wood", chance = 1, min = 1, max = 3},
		{name = "default:apple", chance = 2, min = 1, max = 2},
		{name = "default:axe_stone", chance = 5, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {"farming:bread", "mobs:meat", "default:diamond"},
	view_range = 15,
	owner = "",
	order = "follow",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	on_rightclick = function(self, clicker)

		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "default:gold_lump" then

			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:getpos()

			pos.y = pos.y + 0.5

			minetest.add_item(pos, {
				name = mobs.npc_drops[math.random(1, #mobs.npc_drops)]
			})

			minetest.chat_send_player(name, "NPC dropped you an item for gold!")

			return
		end

		-- capture npc with net or lasso
		mobs:capture_mob(self, clicker, 0, 5, 80, false, nil)

		-- by right-clicking owner can switch npc between follow and stand
		if self.owner and self.owner == name then

			if self.order == "follow" then
				self.order = "stand"

				minetest.chat_send_player(name, "NPC stands still.")
			else
				self.order = "follow"

				minetest.chat_send_player(name, "NPC will follow you.")
			end
		end

	end,
})

mobs:register_spawn("mobs:npc", {"default:dirt_with_grass"}, 20, 0, 7000, 1, 31000)
--mobs:spawn_specific("mobs:npc", {"default:brick"}, {"air"}, 0, 15, 1, 1, 1, 0, 200, true)

mobs:register_egg("mobs_npc:npc", "Npc", "default_brick.png", 1)

-- compatibility
mobs:alias_mob("mobs:npc", "mobs_npc:npc")

--quest npc's

mobs.quest_drops = {
	"hyruletools:quest1", "hyruletools:quest2", "hyruletools:quest3", "hyruletools:quest4", "hyruletools:quest5",
}

mobs:register_mob("mobs_npc:npc_quest", {
	type = "npc",
	passive = false,
	damage = 3,
	attack_type = "dogfight",
	attacks_monsters = true,
	pathfinding = true,
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "character.b3d",
	drawtype = "front",
	textures = {
		{"mobs_npc_doomed.png"},
		{"mobs_npc_toby109tt.png"},
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "default:wood", chance = 1, min = 1, max = 3},
		{name = "default:apple", chance = 2, min = 1, max = 2},
		{name = "default:axe_stone", chance = 5, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {"hyruletools:green_rupee", "hyruletools:red_rupee", "hyruletools:blue_rupee"},
	view_range = 15,
	owner = "",
	order = "follow",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	on_activate = function(self)
		self.order = "stand"
	end,
	on_rightclick = function(self, clicker)

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "hyruletools:green_rupee" then

			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:getpos()

			pos.y = pos.y + 0.5

			minetest.add_item(pos, {
				name = mobs.npc_drops[math.random(1, #mobs.npc_drops)]
			})

			minetest.chat_send_player(name, "NPC has given you a quest!")

			return
		end

	end,
})

--mobs:register_spawn("mobs:npc_quest", {"default:dirt_with_grass"}, 20, 0, 7000, 1, 31000)
--mobs:spawn_specific("mobs:npc", {"default:brick"}, {"air"}, 0, 15, 1, 1, 1, 0, 200, true)

mobs:register_egg("mobs_npc:npc_quest", "Npc (quest)", "hyrule_mapgen_chest.png", 1)


mobs:register_mob("mobs_npc:npc_custom", {
	type = "npc",
	passive = false,
	damage = 3,
	reach = 4,
	attack_type = "dogfight",
	attacks_monsters = false,
	pathfinding = true,
	hp_min = 50,
	hp_max = 60,
	armor = 90,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "character.b3d",
	drawtype = "front",
	textures = {
		{"mobs_npc_doomed.png"},
		{"mobs_npc_toby109tt.png"},
		{"mobs_npc.png"},
		{"mobs_npc2.png"}, -- female by nuttmeg20
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 0.00001,
	run_velocity = 5,
	jump = false,
	jumpheight = 0,
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	view_range = 15,
	owner = "",
	order = "stand",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	on_activate = function(self)
		self.order = "stand"
	end,
	on_rightclick = function(self, clicker)
		local pos = self.object:getpos()
		if self.reward_item ~= nil and clicker:get_wielded_item():get_name() == self.reward_item then
			if self.item_count == nil then
			self.item_ready = true
			self.rewarding = true
			clicker:get_wielded_item():take_item()
			elseif clicker:get_wielded_item():get_count() == self.item_count then
			self.item_ready = true
			self.rewarding = true
			clicker:get_wielded_item():take_item()
			end
		elseif self.reward_item == nil then
			self.item_ready = true
		end
		if self.item ~= nil and not self.inactive then
			local xdir = self.xdir or 0
			local zdir = self.zdir or 0
			if self.item_ready then
			minetest.env:add_item({x=pos.x+xdir, y=pos.y, z=pos.z+zdir}, self.item)
			self.inactive = true
			if self.reward_text ~= nil then
			minetest.chat_send_player(clicker:get_player_name(), self.reward_text)
			end
			end
		end
		if self.text ~= nil and not self.spoken then
			minetest.chat_send_player(clicker:get_player_name(), self.text)
			self.spoken = true
		elseif self.text ~= nil and not self.rewarding then
			minetest.chat_send_player(clicker:get_player_name(), self.text.."... I've said that already")
		end
	end,
})