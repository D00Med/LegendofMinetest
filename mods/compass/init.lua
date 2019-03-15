local compass = {}
compass.items = {
	{"compass:n", (math.pi*0.5), "North"},
	{"compass:s", (3*math.pi*0.5), "South"},
	{"compass:w", (math.pi), "West"},
	{"compass:e", (2*math.pi), "East"},
	{"compass:ne", (9*math.pi*0.25), "North East"},
	{"compass:nw", (3*math.pi*0.25), "North West"},
	{"compass:se", (7*math.pi*0.25), "South East"},
	{"compass:sw", (5*math.pi*0.25), "South West"},
}

local function compass_use(clicker)
	local yaw = clicker:get_look_yaw()
	for _, row in ipairs(compass.items) do
		if yaw < row[2]+math.pi/8 and yaw >= row[2]-math.pi/8 then
			minetest.chat_send_player(clicker:get_player_name(), "You are facing "..row[3])
		end
	end
end

minetest.register_globalstep(function(dtime)
	for _, player in pairs(minetest.get_connected_players()) do
		for _, item in pairs(compass.items) do
		if player:get_wielded_item():get_name() == item[1] then
			local yaw = player:get_look_yaw()
			for _, row in pairs(compass.items) do
				if yaw < row[2]+math.pi/8 and yaw >= row[2]-math.pi/8 then
					player:set_wielded_item(row[1])
					return
				end
			end
		end
	end
	end
end)

minetest.register_craftitem("compass:n", {
	description = "Compass",
	inventory_image = "compass_n.png",
	on_use = function(itemstack, user)
		compass_use(user)
	end
})

minetest.register_craftitem("compass:ne", {
	description = "Compass",
	inventory_image = "compass_ne.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user)
		compass_use(user)
	end
})

minetest.register_craftitem("compass:nw", {
	description = "Compass",
	inventory_image = "compass_nw.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user)
		compass_use(user)
	end
})

minetest.register_craftitem("compass:se", {
	description = "Compass",
	inventory_image = "compass_se.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user)
		compass_use(user)
	end
})

minetest.register_craftitem("compass:sw", {
	description = "Compass",
	inventory_image = "compass_sw.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user)
		compass_use(user)
	end
})

minetest.register_craftitem("compass:s", {
	description = "Compass",
	inventory_image = "compass_s.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user)
		compass_use(user)
	end
})

minetest.register_craftitem("compass:e", {
	description = "Compass",
	inventory_image = "compass_e.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user)
		compass_use(user)
	end
})

minetest.register_craftitem("compass:w", {
	description = "Compass",
	inventory_image = "compass_w.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user)
		compass_use(user)
	end
})

minetest.register_craft({
	output = "compass:n",
	recipe = {
		{'','default:gold_ingot',''},
		{'default:gold_ingot','default:flint','default:gold_ingot'},
		{'','default:gold_ingot',''},
	},
})