
fire = {
	mod = "redo",
	spread = true -- fire spreads by default (when enabled)
}

-- 'Enable fire' setting

local fire_enabled = minetest.settings:get_bool("enable_fire")

if fire_enabled == nil then

	-- enable_fire setting not specified, check for disable_fire
	local fire_disabled = minetest.settings:get_bool("disable_fire")

	if fire_disabled == nil then

		-- Neither setting specified, check whether singleplayer
		fire_enabled = minetest.is_singleplayer()
	else
		fire_enabled = not fire_disabled
	end
end

-- Particle effects

local function add_effect(pos)

	minetest.add_particlespawner({
		amount = 1,
		time = 0.25,
		minpos = pos,
		maxpos = pos,
		minvel = {x = -1, y = 2, z = -1},
		maxvel = {x = 1, y = 4, z = 1},
		minacc = {x = 0, y = 0, z = 0},
		maxacc = {x = 0, y = 0, z = 0},
		minexptime = 1,
		maxexptime = 3,
		minsize = 2,
		maxsize = 5,
		texture = "tnt_smoke.png"
	})
end

-- Flood flame function

local function flood_flame(pos, oldnode, newnode)

	-- Play flame extinguish sound if liquid is not an 'igniter'
	if minetest.get_item_group(newnode.name, "igniter") == 0 then

		minetest.sound_play("fire_extinguish_flame", {
			pos = pos, max_hear_distance = 16, gain = 0.15}, true)
	end

	-- Remove the flame
	return false
end

-- Flame nodes

minetest.register_node("fire:basic_flame", {
	drawtype = "firelike",
	tiles = {
		{
			name = "fire_basic_flame_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1
			},
		},
	},
	inventory_image = "fire_basic_flame.png",
	paramtype = "light",
	light_source = 13,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	floodable = true,
	damage_per_second = 4,
	groups = {igniter = 2, dig_immediate = 3, fire = 1, not_in_creative_inventory = 1},
	drop = {},

	on_timer = function(pos)

		local f = minetest.find_node_near(pos, 1, {"group:flammable"})

		if not fire_enabled or not f then

			minetest.swap_node(pos, {name = "air"})

			return
		end

		-- Restart timer
		return true
	end,

	on_construct = function(pos)

		local n = 0

		-- if fire not enabled then reduce amount of time flame stays in world
		if not fire_enabled then
			n = 29
		end

		minetest.get_node_timer(pos):start(math.random(30 - n, 60 - n))
	end,

	on_flood = flood_flame
})

minetest.register_node("fire:permanent_flame", {
	description = "Permanent Flame",
	drawtype = "firelike",
	tiles = {
		{
			name = "fire_basic_flame_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1
			},
		},
	},
	inventory_image = "fire_basic_flame.png",
	paramtype = "light",
	light_source = 13,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	floodable = true,
	damage_per_second = 4,
	groups = {igniter = 2, fire = 1, dig_immediate = 3},
	drop = {},

	on_flood = flood_flame
})

minetest.register_node("fire:fake_flame", {
	description = "Fake Flame",
	drawtype = "firelike",
	tiles = {
		{
			name = "fire_basic_flame_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1
			},
		},
	},
	inventory_image = "fire_basic_flame.png",
	paramtype = "light",
	light_source = 11,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	damage_per_second = 4,
	groups = {dig_immediate = 3},
	drop = "",

	on_blast = function()
	end,
})

-- Flint and steel

minetest.register_tool("fire:flint_and_steel", {
	description = "Flint and Steel",
	inventory_image = "fire_flint_steel.png",
	sound = {breaks = "default_tool_breaks"},

	on_use = function(itemstack, user, pointed_thing)

		local sound_pos = pointed_thing.above or user:get_pos()

		minetest.sound_play("fire_flint_and_steel",
				{pos = sound_pos, gain = 0.5, max_hear_distance = 8}, true)

		local player_name = user:get_player_name()

		if pointed_thing.type == "node" then

			local node_under = minetest.get_node(pointed_thing.under).name
			local nodedef = minetest.registered_nodes[node_under]

			if not nodedef then
				return
			end

			if minetest.is_protected(pointed_thing.under, player_name) then

				minetest.chat_send_player(player_name, "This area is protected")

				return
			end

			if nodedef.on_ignite then
				nodedef.on_ignite(pointed_thing.under, user)

			elseif minetest.get_item_group(node_under, "flammable") >= 1
			and minetest.get_node(pointed_thing.above).name == "air" then

				minetest.set_node(pointed_thing.above, {name = "fire:basic_flame"})
			end
		end

		if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(player_name)) then

			-- Wear tool
			local wdef = itemstack:get_definition()

			itemstack:add_wear(1000)

			-- Tool break sound
			if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then

				minetest.sound_play(wdef.sound.breaks,
						{pos = sound_pos, gain = 0.5}, true)
			end

			return itemstack
		end
	end
})

minetest.register_craft({
	output = "fire:flint_and_steel",
	recipe = {
		{"default:flint", "default:steel_ingot"}
	}
})

-- Override coalblock to enable permanent flame above
-- Coalblock is non-flammable to avoid unwanted basic_flame nodes

minetest.override_item("default:coalblock", {

	after_destruct = function(pos, oldnode)

		pos.y = pos.y + 1

		if minetest.get_node(pos).name == "fire:permanent_flame" then
			minetest.remove_node(pos)
		end
	end,

	on_ignite = function(pos, igniter)

		local flame_pos = {x = pos.x, y = pos.y + 1, z = pos.z}

		if minetest.get_node(flame_pos).name == "air" then
			minetest.swap_node(flame_pos, {name = "fire:permanent_flame"})
		end
	end
})

-- Deprecated function kept temporarily to avoid crashes if mod fire nodes call it

function fire.update_sounds_around(pos)
end

-- Enable the following ABMs according to 'enable fire' setting

if fire_enabled then

	-- Ignite neighboring nodes, add basic flames

	minetest.register_abm({
		label = "Ignite flame",
		nodenames = {"group:flammable"},
		neighbors = {"group:igniter"},
		interval = 7,
		chance = 12,
		catch_up = false,

		action = function(pos, node, active_object_count, active_object_count_wider)

			if fire.spread == false
			or minetest.find_node_near(pos, 1, {"group:puts_out_fire"}) then
				return
			end

			local p = minetest.find_node_near(pos, 1, {"air"})

			if p then
				minetest.set_node(p, {name = "fire:basic_flame"})
			end
		end,
	})

	-- Remove flammable nodes around basic flame

	minetest.register_abm({
		label = "Remove flammable nodes",
		nodenames = {"fire:basic_flame"},
		neighbors = "group:flammable",
		interval = 5,
		chance = 18,
		catch_up = false,

		action = function(pos, node, active_object_count, active_object_count_wider)

			if fire.spread == false
			or minetest.find_node_near(pos, 1, {"group:puts_out_fire"}) then

				minetest.remove_node(pos)

				return
			end

			local p = minetest.find_node_near(pos, 1, {"group:flammable"})

			if p then

				local flammable_node = minetest.get_node(p)
				local def = minetest.registered_nodes[flammable_node.name]

				if def.on_burn then
					def.on_burn(p)
				else
					minetest.remove_node(p)

					add_effect(p)

					minetest.check_for_falling(p)
				end
			end
		end
	})
end

-- used to drop items inside a chest or container

function fire.drop_items(pos, invstring)

	local meta = minetest.get_meta(pos)
	local inv  = meta:get_inventory()

	for i = 1, inv:get_size(invstring) do

		local m_stack = inv:get_stack(invstring, i)
		local obj = minetest.add_item(pos, m_stack)

		if obj then

			obj:set_velocity({
				x = math.random(-10, 10) / 9,
				y = 1,
				z = math.random(-10, 10) / 9
			})
		end
	end
end

-- override default chest to drop contents on burn

if minetest.registered_nodes["default:chest"] then

	local groups = minetest.registered_nodes["default:chest"].groups

	groups.flammable = 3

	minetest.override_item("default:chest", {
		groups = groups,

		on_burn = function(p)

			fire.drop_items(p, "main")

			minetest.remove_node(p)
		end
	})
end

-- /fire [on/off] command to quickly stop flames spreading without reset

minetest.register_chatcommand("fire", {
	params = "<on/off>",
	description = "Disbles fire spreading when set to OFF",
	privs = {server = true},

	func = function (name, param)

		if not param or param == "" then
			return false, "No paramater set, use /fire (on|off)"
		end

		if param == "on" or param == "ON" then

			fire.spread = true

			return false, "fire spreading is ON"

		elseif param == "off" or param == "OFF" then

			fire.spread = false

			return false, "fire spreading is OFF"
		end
	end
})
