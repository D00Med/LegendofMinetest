

minetest.register_craftitem("icetools:ice_fragment", {
	description = "ice_fragment",
	inventory_image = "icetools_shard.png"
})

minetest.register_craft({
	output = "icetools:ice_fragment 9",
	type = "shapeless",
	recipe = {"default:ice"}
})

minetest.register_craft({
	output = "default:ice 1",
	recipe = {
		{"icetools:ice_fragment", "icetools:ice_fragment", "icetools:ice_fragment"},
		{"icetools:ice_fragment", "icetools:ice_fragment", "icetools:ice_fragment"},
		{"icetools:ice_fragment", "icetools:ice_fragment",  "icetools:ice_fragment"}
	}
})

minetest.register_tool("icetools:wand", {
	description = "ice-wand",
	inventory_image = "icetools_wand.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=10, maxlevel=3},
		},
		damage_groups = {fleshy=0},
	},
	on_place = function(item, player, pointed)
	local pos = player:getpos()
	if pointed ~= nil then
	 stack = minetest.place_node(pos, {name="default:ice"})
	 end
end
})

minetest.register_craft({
	output = 'icetools:wand',
	recipe = {
		{'default:diamond'},
		{'icetools:ice_fragment'},
		{'icetools:ice_fragment'},
	}
})

minetest.register_tool("icetools:sword", {
	description = "ice-sword",
	inventory_image = "icetools_sword.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	}
})

minetest.register_tool("icetools:axe", {
	description = "Ice Axe",
	inventory_image = "icetools_axe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_craft({
	output = 'icetools:sword',
	recipe = {
		{'icetools:ice_fragment'},
		{'icetools:ice_fragment'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'icetools:axe',
	recipe = {
		{'icetools:ice_fragment', 'icetools:ice_fragment'},
		{'icetools:ice_fragment', 'group:stick'},
		{'', 'group:stick'},
	}
})