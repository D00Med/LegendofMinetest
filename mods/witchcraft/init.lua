--Stuff from vessels

-- -
-- Copyright (C) 2012 Vanessa Ezekowitz
-- Copyright (C) 2012 celeron55, Perttu Ahola <celeron55@gmail.com>

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.


local vessels_shelf_formspec =
	"size[8,7;]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[context;vessels;0,0.3;8,2;]"..
	"list[current_player;main;0,2.85;8,1;]"..
	"list[current_player;main;0,4.08;8,3;8]"..
	"listring[context;vessels]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0,2.85)

minetest.register_node("witchcraft:shelf", {
	description = "Potion shelf",
	tiles = {"default_wood.png", "default_wood.png", "default_wood.png^vessels_shelf.png^vessels_shelf_overlay.png"},
	is_ground_content = false,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", vessels_shelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("vessels", 8*2)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("vessels")
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local to_stack = inv:get_stack(listname, index)
		if listname == "vessels" then
			if minetest.get_item_group(stack:get_name(), "potion") ~= 0 or minetest.get_item_group(stack:get_name(), "potion2") ~= 0
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		local to_stack = inv:get_stack(to_list, to_index)
		if to_list == "vessels" then
			if minetest.get_item_group(stack:get_name(), "potion") ~= 0 
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
			   " moves stuff in vessels shelf at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			   " moves stuff to vessels shelf at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			   " takes stuff from vessels shelf at "..minetest.pos_to_string(pos))
	end,
})

--my stuff

-- Copyright (C) 2016 DOOmed <heiselong@gmx.com>

-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation; either version 2.1 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

--crafting

minetest.register_craft({
	output = 'witchcraft:shelf',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:potion', 'group:potion', 'group:potion'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'witchcraft:pot',
	recipe = {
		{'default:copper_lump', '', 'default:copper_lump'},
		{'default:copper_lump', '', 'default:copper_lump'},
		{'', 'default:copper_lump', ''},
	}
})


--empty cooking pot

minetest.register_node("witchcraft:pot", {
	description = "magic cooking pot",
	tiles = {
		"witchcraft_pot_top.png",
		"witchcraft_pot_bottom.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
			{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
			{-0.375, -0.3125, -0.375, 0.375, -0.25, 0.375}, -- NodeBox4
			{-0.4375, -0.25, -0.4375, 0.4375, -0.1875, 0.4375}, -- NodeBox5
			{-0.5, -0.1875, -0.5, 0.5, -0.125, 0.5}, -- NodeBox7
			{-0.5, -0.125, -0.5, 0.5, 0.3125, -0.3125}, -- NodeBox8
			{-0.5, -0.125, 0.3125, 0.5, 0.3125, 0.5}, -- NodeBox9
			{0.3125, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox10
			{-0.5, -0.125, -0.5, -0.3125, 0.3125, 0.5}, -- NodeBox11
			{-0.4375, 0.375, 0.3125, 0.4375, 0.5, 0.4375}, -- NodeBox12
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, -0.3125}, -- NodeBox13
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, -0.3125}, -- NodeBox14
			{0.3125, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox15
			{-0.4375, 0.375, -0.4375, -0.3125, 0.5, 0.4375}, -- NodeBox16
			{-0.375, 0.3125, -0.375, 0.375, 0.375, -0.3125}, -- NodeBox17
			{-0.375, 0.3125, 0.3125, 0.375, 0.375, 0.375}, -- NodeBox18
			{0.3125, 0.3125, -0.375, 0.375, 0.375, 0.375}, -- NodeBox19
			{-0.375, 0.3125, -0.375, -0.3125, 0.375, 0.375}, -- NodeBox20
		}
	},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "bucket:bucket_water" or
				wield_item == "bucket:bucket_river_water" then
			minetest.set_node(pos, {name="witchcraft:pot_blue", param2=node.param2})
			item:replace("bucket:bucket_empty")
		end
	end,
	groups = {cracky=1, falling_node=1, oddly_breakable_by_hand=1}
})

--level 1 potions from cooking pot

local witchcraft = {}

witchcraft.pot = {
	{"blue", "red", "doomshrooms:mini", "redbrown", "flowers:mushroom_brown"},
	{"blue2", "", "", "", ""},
	{"green", "blue2", "default:diamond", "", ""},
	{"orange", "", "", "", ""},
	{"redbrown", "orange", "farming:pumpkin_5", "", ""},
	{"red", "green", "default:mese_crystal_fragment", "", ""},
}


--potion pots

for _, row in ipairs(witchcraft.pot) do --change 'pot_new' to 'pot' for the old recipes
local color = row[1]
local newcolor = row[2]
local newcolor2 = row[4]
local ingredient = row[3]
local ingredient2 = row[5]
minetest.register_node("witchcraft:pot_"..color, {
	tiles = {
		{ name = "witchcraft_pot_"..color..".png",
			animation = {type="vertical_frames", length=3.0} },
		"witchcraft_pot_bottom.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png",
		"witchcraft_pot_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	drop = {
		items = {
			{items = {'witchcraft:pot'}, rarity = 1},
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			{-0.375, -0.4375, -0.375, 0.375, -0.375, 0.375}, -- NodeBox2
			{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- NodeBox3
			{-0.375, -0.3125, -0.375, 0.375, 0.5, 0.375}, -- NodeBox4
			{-0.4375, -0.25, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox5
			{-0.5, -0.1875, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox6
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox7
		}
	},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "bucket:bucket_empty" and clicker:get_wielded_item():get_count() == 1 then
			if minetest.get_node(pos).name ~= "witchcraft:pot_blue" then
			item:replace("witchcraft:potion_"..color)
			else
			item:replace("bucket:bucket_water")
			end
			minetest.set_node(pos, {name="witchcraft:pot", param2=node.param2})
		else
		if wield_item == ingredient then
			minetest.set_node(pos, {name="witchcraft:pot_"..newcolor, param2=node.param2})
			item:take_item()
		elseif wield_item == ingredient2 then
			minetest.set_node(pos, {name="witchcraft:pot_"..newcolor2, param2=node.param2})
			item:take_item()
		elseif wield_item == "bucket:bucket_water" then
			minetest.set_node(pos, {name="witchcraft:pot_blue", param2=node.param2})
			item:replace("bucket:bucket_empty")
		end
	end
	end,
	groups = {cracky=1, falling_node=1, oddly_breakable_by_hand=1}
})
end

--pot effects
minetest.register_abm({
	nodenames = {"witchcraft:pot_water", "witchcraft:pot_red", "witchcraft:pot_redbrown", "witchcraft:pot_blue2", "witchcraft:pot_green", "witchcraft:pot_orange"},
	interval = 0.5,
	chance = 1,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 2,
			time = 1,
			minpos = {x=pos.x-0.1, y=pos.y, z=pos.z-0.1},
			maxpos = {x=pos.x+0.1, y=pos.y, z=pos.z+0.1},
			minvel = {x=0, y=0.5, z=0},
			maxvel = {x=0, y=0.6, z=0},
			minacc = {x=0, y=0.2, z=0},
			maxacc = {x=0, y=0.3, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 2,
			maxsize = 3,
			collisiondetection = false,
			texture = "witchcraft_bubbles.png"
		})
	end
})


--potions

minetest.register_node("witchcraft:potion_redbrown", {
	description = "Basic Soup",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_redbrown.png"},
	wield_image = "witchcraft_potion_redbrown.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_redbrown.png",
	on_use = function(itemstack, player)
	minetest.item_eat(5)
	itemstack:replace("bucket:bucket_empty")
	return itemstack
	end,
})

minetest.register_node("witchcraft:potion_orange", {
	description = "Superior Soup",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_orange.png"},
	wield_image = "witchcraft_potion_orange.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_orange.png",
	on_use = function(itemstack, player)
	minetest.item_eat(10)
	itemstack:replace("bucket:bucket_empty")
	return itemstack
	end,
})


minetest.register_node("witchcraft:potion_red", {
	description = "Red Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_red.png"},
	wield_image = "witchcraft_potion_red.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_red.png",
	on_use = function(itemstack, player)
	local health = player:get_hp();
	player:set_hp(health+20)
	itemstack:replace("bucket:bucket_empty")
	return itemstack
	end,
})

minetest.register_node("witchcraft:potion_blue2", {
	description = "Blue Potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_blue2.png"},
	wield_image = "witchcraft_potion_blue2.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_blue2.png",
	on_use = function(itemstack, player)
	local health = player:get_hp();
	local name = player:get_player_name()
	player:set_hp(health+50)
	mana.add_up_to(name, 200)
	itemstack:replace("bucket:bucket_empty")
	return itemstack
	end,
})


minetest.register_node("witchcraft:potion_green", {
	description = "Green potion",
	drawtype = "plantlike",
	tiles = {"witchcraft_potion_green.png"},
	wield_image = "witchcraft_potion_green.png",
	paramtype = "light",
	stack_max = 1,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1, potion2=1},
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "witchcraft_potion_green.png",
	on_use = function(item, user, pointed_thing)
		local username = user:get_player_name()
		 mana.add_up_to(username, 200)
		item:replace("bucket:bucket_empty")
		return item
	end
})



