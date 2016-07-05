-- Formspec

local bookshelf_formspec =
	"size[8,7;]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[context;books;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;books]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,2.85)


-- Node registration
--nodebox by D00Med
minetest.register_node("default:bookshelf", {
	description = "Bookshelf",
	tiles = {"default_wood.png", "default_wood.png", "default_bookshelf.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, fuel = 29},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.375, -0.4375, 0.4375, 0.4375, 0.4375}, -- NodeBox1
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox2
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, -0.0625, -0.5, 0.5, 0.125, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, -- NodeBox5
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5}, -- NodeBox6
			{0.4375, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.4375, -0.5, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox8
		}
	},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", bookshelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("books", 8 * 2)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("books")
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local to_stack = inv:get_stack(listname, index)
		if listname == "books" then
			if minetest.get_item_group(stack:get_name(), "book") ~= 0
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	allow_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		local to_stack = inv:get_stack(to_list, to_index)
		if to_list == "books" then
			if minetest.get_item_group(stack:get_name(), "book") ~= 0
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in bookshelf at " .. minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff to bookshelf at " .. minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from bookshelf at " .. minetest.pos_to_string(pos))
	end,
})
