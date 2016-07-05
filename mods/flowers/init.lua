-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.


-- Namespace for functions

flowers = {}


-- Map Generation

dofile(minetest.get_modpath("flowers") .. "/mapgen.lua")


--
-- Flowers
--

-- Aliases for original flowers mod

minetest.register_alias("flowers:flower_rose", "flowers:rose")
minetest.register_alias("flowers:flower_tulip", "flowers:tulip")
minetest.register_alias("flowers:flower_dandelion_yellow", "flowers:dandelion_yellow")
minetest.register_alias("flowers:flower_geranium", "flowers:geranium")
minetest.register_alias("flowers:flower_viola", "flowers:viola")
minetest.register_alias("flowers:flower_dandelion_white", "flowers:dandelion_white")


-- Flower registration

local function add_simple_flower(name, desc, box, f_groups)
	-- Common flowers' groups
	f_groups.snappy = 3
	f_groups.flammable = 2
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	minetest.register_node("flowers:" .. name, {
		description = desc,
		drawtype = "plantlike",
		waving = 1,
		tiles = {"flowers_" .. name .. ".png"},
		inventory_image = "flowers_" .. name .. ".png",
		wield_image = "flowers_" .. name .. ".png",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		groups = f_groups,
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = box
		}
	})
end

--dandelion flat
minetest.register_node("flowers:dandelion_flat", {
		description = "flat dandelion",
		waving = 1,
		tiles = {"flowers_dandelion_flat.png",
		"flowers_dandelion_flat_side.png"},
		inventory_image = "flowers_dandelion_flat.png",
		wield_image = "flowers_dandelion_flat.png",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		groups = {oddly_breakable_by_hand=1},
		sounds = default.node_sound_leaves_defaults(),
		drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.1875, -0.5, -0.3125, 0.3125, -0.4375, -0.0625}, -- NodeBox1
			{0.125, -0.5, -0.25, 0.375, -0.4375, -0.125}, -- NodeBox2
			{-0.375, -0.5, 0.125, -0.25, -0.4375, 0.375}, -- NodeBox3
			{-0.4375, -0.5, 0.1875, -0.1875, -0.4375, 0.3125}, -- NodeBox4
			{-0.25, -0.5, -0.5, -0.125, -0.4375, -0.25}, -- NodeBox5
			{-0.3125, -0.5, -0.4375, -0.0625, -0.4375, -0.3125}, -- NodeBox6
		}
	}
	})

flowers.datas = {
	{"rose", "Rose", {-0.15, -0.5, -0.15, 0.15, 0.3, 0.15}, {color_red = 1}},
	{"tulip", "Orange Tulip", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_orange = 1}},
	{"dandelion_yellow", "Yellow Dandelion", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_yellow = 1}},
	{"geranium", "Blue Geranium", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_blue = 1}},
	{"viola", "Viola", {-0.5, -0.5, -0.5, 0.5, -0.2, 0.5}, {color_violet = 1}},
	{"dandelion_white", "White dandelion", {-0.5, -0.5, -0.5, 0.5, -0.2, 0.5}, {color_white = 1}}
}

for _,item in pairs(flowers.datas) do
	add_simple_flower(unpack(item))
end


-- Flower spread

minetest.register_abm({
	nodenames = {"group:flora"},
	neighbors = {"default:dirt_with_grass", "default:desert_sand"},
	interval = 50,
	chance = 35,
	action = function(pos, node)
		pos.y = pos.y - 1
		local under = minetest.get_node(pos)
		pos.y = pos.y + 1
		if under.name == "default:desert_sand" then
			minetest.set_node(pos, {name = "default:dry_shrub"})
		elseif under.name ~= "default:dirt_with_grass" then
			return
		end

		local light = minetest.get_node_light(pos)
		if not light or light < 13 then
			return
		end

		local pos0 = {x = pos.x - 4, y = pos.y - 4, z = pos.z - 4}
		local pos1 = {x = pos.x + 4, y = pos.y + 4, z = pos.z + 4}
		if #minetest.find_nodes_in_area(pos0, pos1, "group:flora_block") > 0 then
			return
		end

		local flowers = minetest.find_nodes_in_area(pos0, pos1, "group:flora")
		if #flowers > 3 then
			return
		end

		local seedling = minetest.find_nodes_in_area(pos0, pos1, "default:dirt_with_grass")
		if #seedling > 0 then
			seedling = seedling[math.random(#seedling)]
			seedling.y = seedling.y + 1
			light = minetest.get_node_light(seedling)
			if not light or light < 13 then
				return
			end
			if minetest.get_node(seedling).name == "air" then
				minetest.set_node(seedling, {name = node.name})
			end
		end
	end,
})


--
-- Mushrooms
--

local mushrooms = {
	{"brown", 2},
	{"red", -6}
}

-- Register mushrooms
for k, v in pairs(mushrooms) do
	local name, eat_value = v[1], v[2]


	minetest.register_node("flowers:mushroom_" .. name, {
		description = string.sub(string.upper(name), 0, 1) ..
			string.sub(name, 2) .. " Mushroom",
		tiles = {"flowers_mushroom_" .. name .. ".png"},
		inventory_image = "flowers_mushroom_" .. name .. ".png",
		wield_image = "flowers_mushroom_" .. name .. ".png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, attached_node = 1, mushroom = 1},
		sounds = default.node_sound_leaves_defaults(),
		on_use = minetest.item_eat(eat_value),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		}
	})

	-- Set alias for "fertile" MTG mushrooms
	minetest.register_alias("flowers:mushroom_fertile_" .. name, "flowers:mushroom_" .. name)
end


-- Register growing ABM

minetest.register_abm({
	nodenames = {"group:mushroom"},
	interval = 50,
	chance = 35,
	action = function(pos, node)
		pos.y = pos.y - 1
		local p = minetest.find_node_near(pos, 1, "air")
		if not p or not default.is_day() then
			return
		end

		local n1 = minetest.get_node_or_nil(p)
		p.y = p.y - 1
		local n2 = minetest.get_node_or_nil(p)

		if node and n1 and n2 and minetest.get_item_group(n2.name, "soil") > 0 then
			p.y = p.y + 1
			if n1.name == "air" and minetest.get_node_light(p) <= 8 then
				minetest.set_node(p, {name = node.name})
			end
		end
	end
})


--
-- Waterlily
--

minetest.register_node("flowers:waterlily", {
	description = "Waterlily",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"flowers_waterlily.png"},
	inventory_image = "flowers_waterlily.png",
	wield_image = "flowers_waterlily.png",
	liquids_pointable = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flower = 1},
	sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.46875, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}
	},

	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local find_water = minetest.find_nodes_in_area({x = pos.x - 1, y = pos.y, z = pos.z - 1},
			{x = pos.x + 1, y = pos.y, z = pos.z + 1}, "default:water_source")
		local find_river_water = minetest.find_nodes_in_area({x = pos.x - 1, y = pos.y, z = pos.z - 1},
			{x = pos.x + 1, y = pos.y, z = pos.z + 1}, "default:river_water_source")
		if #find_water ~= 0 then
			minetest.set_node(pos, {name = "default:water_source"})
			pos.y = pos.y + 1
			minetest.set_node(pos, {name = "flowers:waterlily", param2 = math.random(0, 3)})
		elseif #find_river_water ~= 0 then
			minetest.set_node(pos, {name = "default:river_water_source"})
			pos.y = pos.y + 1
			minetest.set_node(pos, {name = "flowers:waterlily", param2 = math.random(0, 3)})
		else
			minetest.remove_node(pos)
			return true
		end
	end
})
