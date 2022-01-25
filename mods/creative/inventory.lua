creative = {}
local player_inventory = {}

function creative.init_creative_inventory(player)
	local player_name = player:get_player_name()
	player_inventory[player_name] = {
		size = 0,
		filter = "",
		start_i = 0
	}

	minetest.create_detached_inventory("creative_" .. player_name, {
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player2)
			if not to_list == "main" then
				return count
			else
				return 0
			end
		end,
		allow_put = function(inv, listname, index, stack, player2)
			return 0
		end,
		allow_take = function(inv, listname, index, stack, player2)
			return -1
		end,
		on_move = function(inv, from_list, from_index, to_list, to_index, count, player2)
			minetest.sound_play("take", {to_player=player2:get_player_name(), gain=0.5, loop=false})
		end,
		on_put = function(inv, listname, index, stack, player2)
			minetest.sound_play("put", {to_player=player2:get_player_name(), gain=0.5, loop=false})
		end,
		on_take = function(inv, listname, index, stack, player2)
			if stack and stack:get_count() > 0 then
				minetest.sound_play("take", {to_player=player2:get_player_name(), gain=0.5, loop=false})
				minetest.log("action", player_name .. " takes " .. stack:get_name().. " from creative inventory")
			end
		end,
	}, player_name)

	creative.update_creative_inventory(player_name, minetest.registered_items)
end

function creative.update_creative_inventory(player_name, tab_content)
	local creative_list = {}
	local player_inv = minetest.get_inventory({type = "detached", name = "creative_" .. player_name})
	local inv = player_inventory[player_name]
	if not inv then
		creative.init_creative_inventory(minetest.get_player_by_name(player_name))
	end

	for name, def in pairs(tab_content) do
		if not (def.groups.not_in_creative_inventory == 1) and
				def.description and def.description ~= "" and
				(def.name:find(inv.filter, 1, true) or
					def.description:lower():find(inv.filter, 1, true)) then
			creative_list[#creative_list+1] = name
		end
	end

	table.sort(creative_list)
	player_inv:set_size("main", #creative_list)
	player_inv:set_list("main", creative_list)
	inv.size = #creative_list
end

-- Create the trash field
local trash = minetest.create_detached_inventory("creative_trash", {
	-- Allow the stack to be placed and remove it in on_put()
	-- This allows the creative inventory to restore the stack
	allow_put = function(inv, listname, index, stack, player)
		return stack:get_count()
	end,
	on_put = function(inv, listname)
		inv:set_list(listname, {})
	end,
})
trash:set_size("main", 1)

creative.formspec_add = ""

function creative.register_tab(name, title, items)
	sfinv.register_page("creative:" .. name, {
		title = title,
		is_in_nav = function(self, player, context)
			return minetest.setting_getbool("creative_mode")
		end,
		get = function(self, player, context)
			local player_name = player:get_player_name()
			creative.update_creative_inventory(player_name, items)
			local inv = player_inventory[player_name]
			local start_i = inv.start_i or 0
			local pagenum = math.floor(start_i / (3*8) + 1)
			local pagemax = math.ceil(inv.size / (3*8))
			return sfinv.make_formspec(player, context,
				"label[6.2,3.35;" .. minetest.colorize("#FFFF00", tostring(pagenum)) .. " / " .. tostring(pagemax) .. "]" ..
				[[
					image[4.06,3.4;0.8,0.8;creative_trash_icon.png]
					listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]
					list[current_player;main;0,4.7;8,1;]
					list[current_player;main;0,5.85;8,3;8]
					list[detached:creative_trash;main;4,3.3;1,1;]
					listring[]
					button[5.4,3.2;0.8,0.9;creative_prev;<]
					button[7.25,3.2;0.8,0.9;creative_next;>]
					button[2.1,3.4;0.8,0.5;creative_search;?]
					button[2.75,3.4;0.8,0.5;creative_clear;X]
					tooltip[creative_search;Search]
					tooltip[creative_clear;Reset]
					listring[current_player;main]
					field_close_on_enter[creative_filter;false]
				]] ..
				"field[0.3,3.5;2.2,1;creative_filter;;" .. minetest.formspec_escape(inv.filter) .. "]" ..
				"listring[detached:creative_" .. player_name .. ";main]" ..
				"list[detached:creative_" .. player_name .. ";main;0,0;8,3;" .. tostring(start_i) .. "]" ..
				default.get_hotbar_bg(0,4.7) ..
				default.gui_bg .. default.gui_bg_img .. default.gui_slots
				.. creative.formspec_add, false)
		end,
		on_enter = function(self, player, context)
			local player_name = player:get_player_name()
			local inv = player_inventory[player_name]
			if inv then
				inv.start_i = 0
			end
		end,
		on_player_receive_fields = function(self, player, context, fields)
			local player_name = player:get_player_name()
			local inv = player_inventory[player_name]
			assert(inv)

			if fields.creative_clear then
				minetest.sound_play("click2_2", {to_player=player_name, gain=1.2, loop=false})
				inv.start_i = 0
				inv.filter = ""
				creative.update_creative_inventory(player_name, items)
				sfinv.set_player_inventory_formspec(player, context)
			elseif fields.creative_search or
					fields.key_enter_field == "creative_filter" then
				minetest.sound_play("click2", {to_player=player_name, gain=0.8, loop=false})
				inv.start_i = 0
				inv.filter = fields.creative_filter:lower()
				creative.update_creative_inventory(player_name, items)
				sfinv.set_player_inventory_formspec(player, context)
			elseif not fields.quit then
				local start_i = inv.start_i or 0

				if fields.creative_prev then
				minetest.sound_play("click2", {to_player=player_name, gain=0.8, loop=false})
					start_i = start_i - 3*8
					if start_i < 0 then
						start_i = inv.size - (inv.size % (3*8))
						if inv.size == start_i then
							start_i = math.max(0, inv.size - (3*8))
						end
					end
				elseif fields.creative_next then
					minetest.sound_play("click2", {to_player=player_name, gain=0.8, loop=false})
					start_i = start_i + 3*8
					if start_i >= inv.size then
						start_i = 0
					end
				end

				inv.start_i = start_i
				sfinv.set_player_inventory_formspec(player, context)
			end
		end
	})
end

minetest.register_on_joinplayer(function(player)
	creative.init_creative_inventory(player)
end)

creative.register_tab("all", "All", minetest.registered_items)
creative.register_tab("nodes", "Nodes", minetest.registered_nodes)
creative.register_tab("tools", "Tools", minetest.registered_tools)
creative.register_tab("craftitems", "Items", minetest.registered_craftitems)

local old_homepage_name = sfinv.get_homepage_name
function sfinv.get_homepage_name(player)
	if minetest.setting_getbool("creative_mode") then
		return "creative:all"
	else
		return old_homepage_name(player)
	end
end
