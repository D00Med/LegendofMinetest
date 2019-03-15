
local chest_items = {
	{"loot:amethyst_cube 1", 20},
	{"loot:lapis_lazuli_ring 1", 10},
	{"loot:carpet 20", 20},
	{"loot:wood_square 20", 20},
	{"loot:cushion 3", 20},
	{"loot:planks 50", 20},
	{"loot:amethyst_ring 1", 10},
	{"loot:ruby_ring 1", 10},
	{"loot:emerald_ring 1", 10},
	{"loot:rupee_medal 1", 5},
	{"loot:treasure_medal 1", 5},
	{"loot:bug_medal 1", 5},
	{"loot:heart_medal 1", 5},
	{"loot:potion_medal 1", 5},
	{"hyruletools:blue_rupee 20", 5},
	{"hyruletools:red_rupee 10", 5},
	{"hyruletools:nyan_rupee", 5},
	{"hyruletools:green_rupee 10", 1}
}

minetest.register_node("loot:chest", {
	description = "Tower Chest",
	tiles = {"loot_chest_top.png", "loot_chest_side.png", "loot_chest_side.png",
		"loot_chest_side.png", "loot_chest_side.png", "loot_chest_front.png"},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.25, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.375, 0.5, 0.4375, 0.375}, -- NodeBox2
			{-0.5, 0.25, -0.4375, 0.5, 0.375, 0.4375}, -- NodeBox3
			{-0.5, 0.4375, -0.3125, 0.5, 0.5, 0.3125}, -- NodeBox4
		}
	},
	groups = {cracky = 3,},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		for _, row in ipairs(chest_items) do
		local item = row[1]
		local rarity = row[2]
		if math.random(1,rarity) == 1 then
			meta:set_string("item", item)
			return
		end
		end
		inv:set_size("main", 1*1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_rightclick = function(pos, node, clicker, item, _)
		local name = clicker:get_player_name()
		if math.random(1,50) == 6 then
			for i=1,3 do
			minetest.env:add_entity({x=pos.x+math.random(-10,10)*0.1, y=pos.y+0.1, z=pos.z+math.random(-10,10)*0.1}, "mobs_loz:moldorm_leech")
			end
		return
		elseif math.random(1,50) == 6 then
			for i=1,4 do
			minetest.env:add_entity({x=pos.x+math.random(-10,10)*0.1, y=pos.y+0.1, z=pos.z+math.random(-10,10)*0.1}, "mobs_loz:leever_poison")
			end
		return
		elseif math.random(1,50) == 6 then
			for i=1,5 do
			minetest.env:add_entity({x=pos.x+math.random(-10,10)*0.1, y=pos.y+0.1, z=pos.z+math.random(-10,10)*0.1}, "mobs_loz:zol")
			end
		return
		end
		if clicker:get_wielded_item():get_name() == "loot:key" then
			item:take_item()
			local meta = minetest.get_meta(pos)
			local item = meta:get_string("item")
			if item == nil then
				for _, row in ipairs(chest_items) do
				local item = row[1]
				local rarity = row[2]
				if math.random(1,rarity) == 1 then
					meta:set_string("item", item)
				end
				end
			end
			minetest.env:add_item(pos, item)
			minetest.env:remove_node(pos)
		else
		minetest.chat_send_player(name, "It is locked, you need a key!")
		end
	end,
})

minetest.register_node("loot:key", {
	description = "Tower Key",
	inventory_image = "loot_key_inv.png",
	wield_image = "loot_key_inv.png",
	tiles = {
		"loot_key.png",
		"loot_key.png",
		"loot_key_side.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, 0, 0, -0.4375, 0.25}, -- NodeBox1
			{0.0625, -0.5, 0, 0.125, -0.4375, 0.25}, -- NodeBox2
			{0, -0.5, 0.125, 0.0625, -0.4375, 0.1875}, -- NodeBox3
			{0, -0.5, -0.25, 0.0625, -0.4375, 0.0625}, -- NodeBox4
			{0.0625, -0.5, -0.25, 0.125, -0.4375, -0.1875}, -- NodeBox5
			{0.0625, -0.5, -0.125, 0.125, -0.4375, -0.0625}, -- NodeBox6
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1, attached_node=1},
	sounds = default.node_sound_metal_defaults()	
})

--loot craftitems

minetest.register_craftitem("loot:heart_medal", {
	description = "Heart Medal",
	inventory_image = "loot_heart_medal.png",
	groups = {not_in_creative_inventory=1}
})

minetest.register_craftitem("loot:potion_medal", {
	description = "Potion Medal",
	inventory_image = "loot_potion_medal.png",
	groups = {not_in_creative_inventory=1}
})

minetest.register_craftitem("loot:bug_medal", {
	description = "Bug Medal",
	inventory_image = "loot_bug_medal.png",
	groups = {not_in_creative_inventory=1}
})

minetest.register_craftitem("loot:treasure_medal", {
	description = "Treasure Medal",
	inventory_image = "loot_treasure_medal.png",
	groups = {not_in_creative_inventory=1}
})

minetest.register_craftitem("loot:rupee_medal", {
	description = "Rupee Medal",
	inventory_image = "loot_rupee_medal.png",
	groups = {not_in_creative_inventory=1}
})

minetest.register_craftitem("loot:amethyst_ring", {
	description = "Amethyst Ring",
	inventory_image = "loot_amethyst_ring.png",
	groups = {not_in_creative_inventory=1}
})

minetest.register_craftitem("loot:emerald_ring", {
	description = "Emerald Ring",
	inventory_image = "loot_emerald_ring.png",
	groups = {not_in_creative_inventory=1}
})

minetest.register_craftitem("loot:ruby_ring", {
	description = "Ruby Ring",
	inventory_image = "loot_ruby_ring.png",
	groups = {not_in_creative_inventory=1}
})

minetest.register_craftitem("loot:lapis_lazuli_ring", {
	description = "Lapis Lazuli Ring",
	inventory_image = "loot_lapis_lazuli_ring.png",
	groups = {not_in_creative_inventory=1}
})

--loot nodes

minetest.register_node("loot:book", {
	description = "Mysterious Book",
	inventory_image = "loot_book.png",
	wield_image = "loot_book.png",
	tiles = {
		"loot_book_top.png",
		"loot_book_top.png^[transformFY",
		"loot_book_right.png",
		"loot_book_left.png",
		"loot_book_top.png^[transformFX",
		"loot_book_top.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.375, 0.25, -0.4375, 0.3125}, -- NodeBox1
			{-0.25, -0.375, -0.375, 0.25, -0.3125, 0.3125}, -- NodeBox2
			{-0.25, -0.4375, -0.375, -0.1875, -0.375, 0.3125}, -- NodeBox3
			{-0.25, -0.4375, -0.375, 0.1875, -0.375, 0.25}, -- NodeBox4
		}
	},
	groups = {choppy=1, dig_immediate=3, not_in_creative_inventory=1, book=1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = function(itemstack, user, pointed_thing)
		local formspec = "size[10,9]"..
		"background[-0.6,-0.5;11.5,10.4;loot_book_pages.png]";
		minetest.show_formspec(user:get_player_name(), "loot:book", formspec);	
	end,
	on_rightclick = function(pos, node, clicker)
		local formspec = "size[10,9]"..
		"background[-0.6,-0.5;11.5,10.4;loot_book_pages.png]";
		minetest.show_formspec(clicker:get_player_name(), "loot:book", formspec);	
	end,
})

minetest.register_node("loot:amethyst_cube", {
	description = "Amethyst Cube",
	tiles = {
		"loot_amethyst_cube_top.png",
		"loot_amethyst_cube_top.png",
		"loot_amethyst_cube.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.125, 0.1875}, -- NodeBox1
		}
	},
	use_texture_alpha = true,
	groups = {cracky=1, not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("loot:vegemite", {
	description = "Vegemite",
	tiles = {
		"loot_vegemite_top.png",
		"loot_vegemite_top.png",
		"loot_vegemite.png",
		"loot_vegemite.png^[transformFX",
		"loot_vegemite.png^[transformFX",
		"loot_vegemite.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-2/16, -0.5, -3/16, 2/16, 0, 3/16},
			{-3/16, -0.5, -2/16, 3/16, 0, 2/16},
		}
	},
	groups = {cracky=1, not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("loot:pc", {
	description = "PC",
	tiles = {
		"loot_pc_top.png",
		"loot_pc_top.png",
		"loot_pc_side.png",
		"loot_pc_side.png",
		"loot_pc_front.png",
		"loot_pc_top.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.25, 0.5}, -- NodeBox1
			{-0.25, -0.25, -0.25, 0.3125, -0.1875, 0.25}, -- NodeBox2
			{-0.375, -0.1875, -0.375, 0.375, 0.5, 0.4375}, -- NodeBox4
		}
	},
	groups = {cracky=1, not_in_creative_inventory=1}
})

minetest.register_node("loot:carpet", {
	description = "Carpet Floor",
	tiles = {
		"loot_carpet.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.6, 0.5}, -- NodeBox1
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
		}
	},
	groups = {choppy=1, not_in_creative_inventory=1},
	sounds = default.node_sound_defaults()
})

minetest.register_node("loot:cushion", {
	description = "Cushioned Seat",
	tiles = {
		"loot_carpet.png",
		"loot_polished_wood_square.png",
		"loot_cushion_box.png",
	},
	groups = {choppy=1, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("loot:planks", {
	description = "Polished Planks",
	tiles = {
		"loot_polished_planks.png",
	},
	groups = {choppy=1, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("loot:wood_square", {
	description = "Polished Wood Square",
	tiles = {
		"loot_polished_wood_square.png",
	},
	groups = {choppy=1, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults()
})