sfinv = {
	pages = {},
	pages_unordered = {},
	contexts = {},
	enabled = true
}

function sfinv.register_page(name, def)
	assert(name, "Invalid sfinv page. Requires a name")
	assert(def, "Invalid sfinv page. Requires a def[inition] table")
	assert(def.get, "Invalid sfinv page. Def requires a get function.")
	assert(not sfinv.pages[name], "Attempt to register already registered sfinv page " .. dump(name))

	sfinv.pages[name] = def
	def.name = name
	table.insert(sfinv.pages_unordered, def)
end

function sfinv.override_page(name, def)
	assert(name, "Invalid sfinv page override. Requires a name")
	assert(def, "Invalid sfinv page override. Requires a def[inition] table")
	local page = sfinv.pages[name]
	assert(page, "Attempt to override sfinv page " .. dump(name) .. " which does not exist.")
	for key, value in pairs(def) do
		page[key] = value
	end
end

function sfinv.get_nav_fs(player, context, nav, current_idx)
	-- Only show tabs if there is more than one page
	if #nav > 1 then
		return "tabheader[0,0;tabs;" .. table.concat(nav, ",") .. ";" .. current_idx .. ";true;false]"
	else
		return ""
	end
end

local theme_main = "bgcolor[#080808BB;true]" .. default.gui_bg ..
		default.gui_bg_img

local theme_inv = default.gui_slots .. [[
		list[current_player;main;0,4.7;8,1;]
		list[current_player;main;0,5.85;8,3;8]
	]]

function sfinv.make_formspec(player, context, content, show_inv, size)
	local tmp = {
		size or "size[8,8.6]",
		theme_main,
		sfinv.get_nav_fs(player, context, context.nav_titles, context.nav_idx),
		content
	}
	if show_inv then
		tmp[#tmp + 1] = theme_inv
	end
	return table.concat(tmp, "")
end

function sfinv.get_homepage_name(player)
	return "sfinv:crafting"
end

function sfinv.get_formspec(player, context)
	-- Generate navigation tabs
	local nav = {}
	local nav_ids = {}
	local current_idx = 1
	for i, pdef in pairs(sfinv.pages_unordered) do
		if not pdef.is_in_nav or pdef:is_in_nav(player, context) then
			nav[#nav + 1] = pdef.title
			nav_ids[#nav_ids + 1] = pdef.name
			if pdef.name == context.page then
				current_idx = i
			end
		end
	end
	context.nav = nav_ids
	context.nav_titles = nav
	context.nav_idx = current_idx

	-- Generate formspec
	local page = sfinv.pages[context.page] or sfinv.pages["404"]
	if page then
		return page:get(player, context)
	else
		local old_page = context.page
		context.page = sfinv.get_homepage_name(player)
		assert(sfinv.pages[context.page], "[sfinv] Invalid homepage")
		minetest.log("warning", "[sfinv] Couldn't find " .. dump(old_page) .. " so using switching to homepage")
		return sfinv.get_formspec(player, context)
	end
end

function sfinv.set_player_inventory_formspec(player, context)
	if not context then
		local name = player:get_player_name()
		context = sfinv.contexts[name]
		if not context then
			context = {
				page = sfinv.get_homepage_name(player)
			}
			sfinv.contexts[name] = context
		end
	end

	local fs = sfinv.get_formspec(player, context)
	player:set_inventory_formspec(fs)
end

minetest.register_on_joinplayer(function(player)
	if sfinv.enabled then
		minetest.after(0.5, function()
			sfinv.set_player_inventory_formspec(player)
		end)
	end
end)

minetest.register_on_leaveplayer(function(player)
	sfinv.contexts[player:get_player_name()] = nil
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "" or not sfinv.enabled then
		return false
	end

	-- Get Context
	local name = player:get_player_name()
	local context = sfinv.contexts[name]
	if not context then
		sfinv.set_player_inventory_formspec(player)
		return false
	end

	-- Handle Events
	if fields.tabs and context.nav then
		local tid = tonumber(fields.tabs)
		if tid and tid > 0 then
			local id = context.nav[tid]
			local page = sfinv.pages[id]
			if id and page then
				local oldpage = sfinv.pages[context.page]
				if oldpage and oldpage.on_leave then
					oldpage:on_leave(player, context)
				end
				context.page = id
				if page.on_enter then
					page:on_enter(player, context)
				end
				sfinv.set_player_inventory_formspec(player, context)
				minetest.sound_play("click2", {to_player=name, gain=0.5, loop=false})
			end
		end
		return
	end

	-- Pass to page
	local page = sfinv.pages[context.page]
	if page and page.on_player_receive_fields then
		return page:on_player_receive_fields(player, context, fields)
	end
end)
