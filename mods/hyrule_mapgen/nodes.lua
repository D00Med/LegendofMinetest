
--new nodes

local dye_colours = {
	{"red"},
	{"blue"},
	{"orange"},
	{"green"},
	{"dark_green"},
	{"dark_grey"},
	{"black"},
	{"grey"},
	{"white"},
	{"yellow"},
	{"brown"},
	{"cyan"},
	{"magenta"},
	{"violet"},
	{"pink"},
}

for _, dye in ipairs(dye_colours) do
local colour = dye[1]
	minetest.register_node(":dye:"..colour.."_node", {
	tiles = {
		"dye_"..colour.."_model.png",
	},
	drawtype = "mesh",
	mesh = "dye.obj",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}, -- NodeBox1
			{-0.25, -0.4375, -0.25, 0.25, -0.1875, 0.25}, -- NodeBox2
			{-0.1875, -0.1875, -0.1875, 0.1875, -0.125, 0.1875}, -- NodeBox3
			{-0.125, -0.125, -0.125, 0.125, -0.0625, 0.125}, -- NodeBox4
			{-0.1875, -0.0625, -0.125, 0.1875, 0, 0.125}, -- NodeBox5
			{-0.125, 0, -0.125, 0.125, 0.0625, 0.125}, -- NodeBox6
			{-0.125, -0.0625, -0.1875, 0.125, 0, 0.1875}, -- NodeBox8
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}, -- NodeBox1
			{-0.25, -0.4375, -0.25, 0.25, -0.1875, 0.25}, -- NodeBox2
			{-0.1875, -0.1875, -0.1875, 0.1875, -0.125, 0.1875}, -- NodeBox3
			{-0.125, -0.125, -0.125, 0.125, -0.0625, 0.125}, -- NodeBox4
			{-0.1875, -0.0625, -0.1875, 0.1875, 0, 0.1875}, -- NodeBox5
			{-0.125, 0, -0.125, 0.125, 0.0625, 0.125}, -- NodeBox6
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1, dig_immediate=3},
	sounds = default.node_sound_glass_defaults(),
	drop = "dye:"..colour,
	})
	minetest.override_item("dye:"..colour, {
		on_place = function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.above
			minetest.set_node(pos, {name="dye:"..colour.."_node"})
			itemstack:take_item()
			return itemstack
			end,
	})
end

minetest.register_node(":farming:bread_node", {
	tiles = {
		"farming_bread_top.png",
		"farming_bread_top.png",
		"farming_bread_side.png",
		"farming_bread_side.png",
		"farming_bread_front.png^[transformFX",
		"farming_bread_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.25, 0.125, -0.3125, 0.25}, -- NodeBox1
			{-0.25, -0.3125, -0.25, 0.1875, -0.1875, 0.25}, -- NodeBox2
			{-0.1875, -0.1875, -0.25, 0.125, -0.125, 0.25}, -- NodeBox3
		}
	},
	groups = {crumbly=1, not_in_creative_inventory=1},
	sounds = default.node_sound_dirt_defaults(),
	drop = "farming:bread"
})

minetest.register_node("hyrule_mapgen:chillshroom", {
	description = "Chillshroom",
	tiles = {"hyrule_mapgen_chillshroom.png"},
	drawtype = "plantlike",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.5, -0.1, 0.1, -0.1, 0.1}
		}
	},
	groups = {fleshy=1, oddly_breakable_by_hand=1, dig_immediate=3},
	sounds = default.node_sound_leaves_defaults(),
	drop = "hyrule_mapgen:chillshroom 3",
	walkable = false,
	on_use = minetest.item_eat(1)
})

minetest.register_node("hyrule_mapgen:chillshroom_2", {
	description = "Chillshroom (ceiling)",
	tiles = {"hyrule_mapgen_chillshroom.png^[transformFY"},
	drawtype = "plantlike",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1, 0.1, -0.1, 0.1, 0.5, 0.1}
		}
	},
	groups = {fleshy=1, oddly_breakable_by_hand=1, dig_immediate=3},
	sounds = default.node_sound_leaves_defaults(),
	drop = "hyrule_mapgen:chillshroom 3",
	walkable = false,
	on_use = minetest.item_eat(1)
})

minetest.register_node("hyrule_mapgen:sunshroom", {
	description = "Sunshroom",
	tiles = {"hyrule_mapgen_sunshroom.png"},
	drawtype = "plantlike",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.5, -0.1, 0.1, -0.1, 0.1}
		}
	},
	groups = {fleshy=1, oddly_breakable_by_hand=1, dig_immediate=3, flammable=1},
	sounds = default.node_sound_leaves_defaults(),
	drop = "hyrule_mapgen:sunshroom 3",
	walkable = false,
	on_use = minetest.item_eat(1)
})

minetest.register_node("hyrule_mapgen:zapshroom", {
	description = "Zapshroom",
	tiles = {"hyrule_mapgen_zapshroom.png"},
	drawtype = "plantlike",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.5, -0.1, 0.1, -0.1, 0.1}
		}
	},
	groups = {fleshy=1, oddly_breakable_by_hand=1, dig_immediate=3},
	sounds = default.node_sound_leaves_defaults(),
	drop = "hyrule_mapgen:zapshroom 3",
	walkable = false,
	on_use = minetest.item_eat(1)
})

minetest.register_node("hyrule_mapgen:rushroom", {
	description = "Rushroom",
	tiles = {"hyrule_mapgen_rushroom.png"},
	drawtype = "plantlike",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.5, -0.1, 0.1, -0.1, 0.1}
		}
	},
	groups = {fleshy=1, oddly_breakable_by_hand=1, dig_immediate=3},
	sounds = default.node_sound_leaves_defaults(),
	drop = "hyrule_mapgen:rushroom 3",
	walkable = false,
	on_use = minetest.item_eat(1)
})

minetest.register_node("hyrule_mapgen:berry_bush", {
	description = "Wildberry Bush",
	tiles = {"hyrule_mapgen_wildberry_bush.png"},
	drawtype = "plantlike",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.5, -0.1, 0.1, 0, 0.1}
		}
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3},
	sounds = default.node_sound_leaves_defaults(),
	walkable = false,
	on_rightclick = function(pos, node)
		minetest.add_item(pos, "hyrule_mapgen:wildberry")
		minetest.add_item(pos, "hyrule_mapgen:wildberry")
		minetest.add_item(pos, "hyrule_mapgen:wildberry")
		minetest.remove_node(pos)
	end,
})

minetest.register_craftitem("hyrule_mapgen:wildberry", {
	description = "Wild Berry",
	inventory_image = "hyrule_mapgen_wildberry.png",
	on_use = minetest.item_eat(1)
})

minetest.register_node("hyrule_mapgen:logpile", {
	description = "Log Pile",
	tiles = {
		"default_tree.png^[transformR90",
		"default_tree.png^[transformR90",
		"default_tree.png^[transformR90",
		"default_tree.png^[transformR90",
		"default_tree_top.png",
		"default_tree_top.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.4375, -0.5, -0.0625, -0.125, 0.5}, -- NodeBox1
			{0.0625, -0.4375, -0.5, 0.5, -0.125, 0.5}, -- NodeBox2
			{0.125, -0.5, -0.5, 0.4375, -0.0625, 0.5}, -- NodeBox3
			{-0.4375, -0.5, -0.5, -0.125, -0.0625, 0.5}, -- NodeBox4
			{-0.125, -0.0625, -0.5, 0.1875, 0.375, 0.5}, -- NodeBox5
			{-0.1875, 0, -0.5, 0.25, 0.3125, 0.5}, -- NodeBox6
		}
	},
	groups = {choppy=3, oddly_breakable_by_hand=1, flammable=1, falling_node=1},
	drop = "default:tree 3",
})

minetest.register_node(":default:book_placed", {
	tiles = {
		"default_book_top.png",
		"default_book_top.png^[transformFY",
		"default_book_right.png",
		"default_book_left.png",
		"default_book_top.png^[transformFX",
		"default_book_top.png"
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
	groups = {choppy=1, dig_immediate=3, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
	drop = "default:book"
})

minetest.register_node("hyrule_mapgen:bigmush", {
	description = "Big Mushroom",
	drawtype = "plantlike",
	tiles = {
		"hyrule_mapgen_bigmush.png"
	},
	wield_image = "hyrule_mapgen_bigmush.png",
	inventory_image = "hyrule_mapgen_bigmush.png",
	groups = {snappy=1, flammable=1, oddly_breakable_by_hand = 1,},
	paramtype = "light",
	walkable = false,
	selection_box = {
	type = "fixed",
	fixed = {-0.3, -0.5, -0.3, 0.3, 0.2, 0.3}
	},
	on_use = minetest.item_eat(-2)
})

minetest.register_node("hyrule_mapgen:big_table", {
	description = "Big Table",
	tiles = {
		"hyrule_mapgen_bigtable_top.png",
		"hyrule_mapgen_bigtable.png",
		"hyrule_mapgen_bigtable.png",
		"hyrule_mapgen_bigtable.png",
		"hyrule_mapgen_bigtable.png",
		"hyrule_mapgen_bigtable.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, 0.1875, -0.1875, 0.375, 0.5}, -- NodeBox2
		}
	},
	groups = {choppy=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:crystal_1", {
	description = "Cave Crystal (Blue)",
	tiles = {
		"hyrule_mapgen_crystal1.png",
	},
	groups = {cracky=1},
	drawtype = "nodebox",
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.0625, 0.1875, 0.4375, 0.25}, -- NodeBox6
			{0, -0.5, -0.3125, 0.1875, 0.1875, -0.125}, -- NodeBox7
			{-0.3125, -0.5, -0.1875, -0.0625, -0.0625, 0.0625}, -- NodeBox8
			{0.1875, -0.5, 0.0625, 0.3125, 0, 0.1875}, -- NodeBox9
			{-0.25, -0.5, 0.125, 0, 0.0625, 0.375}, -- NodeBox10
		}
	},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:crystal_3", {
	description = "Cave Crystal (Green)",
	tiles = {
		"hyrule_mapgen_crystal3.png",
	},
	groups = {cracky=1},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.25, 0, 0.1875, -0.0625}, -- NodeBox16
			{0, -0.5, 0.0625, 0.25, 0.5, 0.3125}, -- NodeBox19
			{-0.375, -0.5, 0.0625, -0.1875, -0.0625, 0.25}, -- NodeBox20
		}
	},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:crystal_2", {
	description = "Cave Crystal (Purple)",
	tiles = {
		"hyrule_mapgen_crystal2.png",
	},
	groups = {cracky=1},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.1875, 0.125, 0.4375, 0.125}, -- NodeBox11
			{0.0625, -0.5, 0.1875, 0.25, 0.1875, 0.375}, -- NodeBox12
			{-0.375, -0.5, -0.25, -0.1875, -0.0625, -0.0625}, -- NodeBox13
			{-0.3125, -0.5, 0.0625, -0.0625, 0.125, 0.3125}, -- NodeBox14
			{0.0625, -0.5, -0.3125, 0.25, 0.25, -0.125}, -- NodeBox15
		}
	},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:bush_leaves", {
	description = "Shrub Leaves",
	tiles = {"hyrule_mapgen_bushleaves.png"},
	drawtype = "allfaces",
	paramtype = "light",
	walkable = false,
	drop = {
		max_items = 1,
		items = {
			{items = {'default:bush_sapling'}, rarity = 20,},
			{items = {'hyrule_mapgen:bush_leaves'},}
		}
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, leaves=1},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves
})

minetest.register_node("hyrule_mapgen:windmill_node", {
	description = "Windmill",
	drawtype = "airlike",
	tiles = {"hyrule_mapgen_trans.png"},
	wield_image = "hyrule_mapgen_windmill_inv.png",
	inventory_image = "hyrule_mapgen_windmill_inv.png",
	groups = {choppy = 1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos, node)
		minetest.env:add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "hyrule_mapgen:windmill")
	end,
})

minetest.register_node("hyrule_mapgen:dungeon_seed", {
	description = "Dungeon Seed",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "default:stone"
})

minetest.register_node("hyrule_mapgen:moldorm_stone", {
	description = "Moldorm Stone",
	tiles = {"hyrule_mapgen_moldorm_stone.png"},
	groups = {},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
		minetest.env:add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:great_moldorm")
		minetest.remove_node(pos)
	end,
})

minetest.register_node("hyrule_mapgen:octorock_stone", {
	description = "Octorock Stone",
	tiles = {"hyrule_mapgen_octorock_stone.png"},
	groups = {},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
		minetest.env:add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:octorock_boss")
		minetest.remove_node(pos)
	end,
})

minetest.register_node("hyrule_mapgen:ice_brick", {
	description = "Ice Brick",
	tiles = {"hyrule_mapgen_ice_brick.png"},
	groups = {cracky = 3, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("hyrule_mapgen:ice_waterfall", {
	description = "Frozen Waterfall",
	drawtype = "glasslike",
	use_texture_alpha = true,
	tiles = {"hyrule_mapgen_ice_waterfall.png"},
	inventory_image = "[inventorycube{hyrule_mapgen_ice_waterfall_inv.png{hyrule_mapgen_ice_waterfall_inv.png{hyrule_mapgen_ice_waterfall_inv.png",
	groups = {cracky = 3, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
})

stairs.register_stair_and_slab(
	"ice_brick",
	"hyrule_mapgen:ice_brick",
	{cracky = 3, cools_lava = 1},
	{"hyrule_mapgen_ice_brick.png"},
	"Ice brick Stair",
	"Ice brick Slab",
	default.node_sound_glass_defaults()
)

minetest.register_node("hyrule_mapgen:icicle", {
	description = "Icicle",
	tiles = {
		"default_ice.png",
	},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- NodeBox1
			{-0.1875, 0.4375, -0.1875, 0.1875, 1.1875, 0.1875}, -- NodeBox2
			{-0.125, 1.1875, -0.125, 0.125, 1.6875, 0.125}, -- NodeBox3
			{-0.0625, 1.6875, -0.0625, 0.0625, 2.0625, 0.0625}, -- NodeBox4
		}
	},
	groups = {cracky=3, oddly_breakable_by_hand=1, dig_immediate=3},
	sounds = default.node_sound_glass_defaults(),
	drop = "",
	on_destruct = function(pos)
		minetest.env:add_item({x=pos.x-0.3, y=pos.y+0.5, z=pos.z-0.3}, "hyruletools:ice_fragment")
		minetest.env:add_item({x=pos.x-0.3, y=pos.y+0.5, z=pos.z+0.3}, "hyruletools:ice_fragment")
		minetest.env:add_item({x=pos.x+0.3, y=pos.y+0.5, z=pos.z-0.3}, "hyruletools:ice_fragment")
		minetest.env:add_item({x=pos.x+0.3, y=pos.y+0.5, z=pos.z+0.3}, "hyruletools:ice_fragment")
	end,
})

minetest.register_node("hyrule_mapgen:obsidian_spike", {
	description = "Obsidian Spike",
	tiles = {
		"default_obsidian.png",
	},
	use_texture_alpha = true,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- NodeBox1
			{-0.1875, 0.4375, -0.1875, 0.1875, 1.1875, 0.1875}, -- NodeBox2
			{-0.125, 1.1875, -0.125, 0.125, 1.6875, 0.125}, -- NodeBox3
			{-0.0625, 1.6875, -0.0625, 0.0625, 2.0625, 0.0625}, -- NodeBox4
		}
	},
	groups = {cracky=1,},
	sounds = default.node_sound_stone_defaults(),
	drop = "default:obsidian",
})

minetest.register_entity("hyrule_mapgen:laser", {
	visual = "cube",
	textures = {
	"hyrule_mapgen_laser.png",
	"hyrule_mapgen_laser.png",
	"hyrule_mapgen_laser.png",
	"hyrule_mapgen_laser.png",
	"hyrule_mapgen_laser.png",
	"hyrule_mapgen_laser.png",
	},
	visual_size={x=0.1,y=0.1},
	collisionbox = {0, 0, 0, 0, 0, 0},
	physical = false,
	automatic_rotate = true,
	automatic_face_movement_dir = 0,
	on_activate = function(self)
		minetest.after(3, function()
			self.object:remove()
		end)
	end,
	on_step = function(self, dtime)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y-0.5,z=pos.z}, 0.5)	
			for k, obj in pairs(objs) do
				if obj:is_player() then
					obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=1},
						}, nil)
						self.object:remove()
				end
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "hyrule_mapgen:laser" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=1},
						}, nil)
						self.object:remove()
					end
				end
			end
	end
})

minetest.register_node("hyrule_mapgen:beamos", {
	description = "Beamos",
	tiles = {
		"hyrule_mapgen_beamos_top.png",
		"hyrule_mapgen_beamos_bottom.png",
		"hyrule_mapgen_beamos_sides.png",
		"hyrule_mapgen_beamos_sides.png",
		"hyrule_mapgen_beamos_sides.png",
		"hyrule_mapgen_beamos_front.png",
	},
	groups = {cracky = 3,},
	paramtype2 = "facedir",
})

minetest.register_node("hyrule_mapgen:stone_pillar", {
	description = "Stone Pillar",
	tiles = {
		"hyrule_mapgen_stone_pillar_top.png",
		"hyrule_mapgen_stone_pillar_top.png",
		"hyrule_mapgen_stone_pillar.png",
	},
	groups = {cracky = 1,},
	paramtype2 = "facedir",
	on_place = minetest.rotate_node
})

minetest.register_node("hyrule_mapgen:spikes", {
	description = "Spikes",
	drawtype = "firelike",
	tiles = {
		"hyrule_mapgen_spikes.png"
	},
	wield_image = "hyrule_mapgen_spikes.png",
	inventory_image = "hyrule_mapgen_spikes.png",
	groups = {cracky=3},
	paramtype = "light",
	walkable = false,
	damage_per_second = 3,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 0.5}
	}
})

minetest.register_node("hyrule_mapgen:sinkingsand", {
	description = "Sinking Sand",
	drawtype = "liquid",
	tiles = {{
		name = "hyrule_mapgen_sinkingsand.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.00},
	}},
	inventory_image = "[inventorycube{hyrule_mapgen_sinkingsand_inv.png{hyrule_mapgen_sinkingsand_inv.png{hyrule_mapgen_sinkingsand_inv.png",
	groups = {liquid=1, water=1},
	pointable = false,
	buildable_to = true,
	liquid_viscosity = 8,
	liquid_range = 0,
	liquidtype = "source",
	liquid_alternative_flowing = "hyrule_mapgen:sinkingsand",
	liquid_alternative_source = "hyrule_mapgen:sinkingsand",
	damage_per_second = 3,
	walkable = false
})


local chest_items = {
	{"clawshot:clawshot", 5},
	{"hyruletools:eye", 5},
	{"hyruletools:boomerang", 5},
	{"hyruletools:flame_rod", 10},
	{"hyruletools:wand", 10},
	{"hyruletools:medallion", 10},
	{"hyruletools:medallion2", 10},
	{"hyruletools:medallion3", 10},
	{"hyruletools:ice_rod 1", 5},
	{"hyruletools:blue_rupee 20", 5},
	{"hyruletools:red_rupee 10", 5},
	{"hyruletools:nyan_rupee", 5},
}

minetest.register_node("hyrule_mapgen:chest", {
	description = "Dungeon Chest",
	tiles = {"hyrule_mapgen_chest_top.png", "hyrule_mapgen_chest_top.png", "hyrule_mapgen_chest_side.png",
		"hyrule_mapgen_chest_side.png", "hyrule_mapgen_chest_side.png", "hyrule_mapgen_chest.png"},
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
	groups = {cracky = 2, oddly_breakable_by_hand = 1},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		for _, row in ipairs(chest_items) do
		local item = row[1]
		local rarity = row[2]
		if math.random(1,rarity) == 1 then
			meta:set_string("item", item)
			return
		else
			meta:set_string("item", "hyruletools:green_rupee 20")
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
		if clicker:get_wielded_item():get_name() == "hyruletools:key" then
			item:take_item()
			local meta = minetest.get_meta(pos)
			local item = meta:get_string("item")
			if item == nil then
				for _, row in ipairs(chest_items) do
				local item = row[1]
				local rarity = row[2]
				if math.random(1,rarity) == 1 then
					meta:set_string("item", item)
					else
					meta:set_string("item", "hyruletools:green_rupee 20")
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

minetest.register_node("hyrule_mapgen:chest_key", {
	description = "Dungeon Chest (key)",
	tiles = {"hyrule_mapgen_chest_top.png", "hyrule_mapgen_chest_top.png", "hyrule_mapgen_chest_side.png",
		"hyrule_mapgen_chest_side.png", "hyrule_mapgen_chest_side.png", "hyrule_mapgen_chest.png"},
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
	groups = {cracky = 2, oddly_breakable_by_hand = 1},
	is_ground_content = false,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "hyrule_mapgen:dungeon_brick" and minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "hyrule_mapgen:dungeon_tile" and minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "hyrule_mapgen:dungeon_brick2" and minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "hyrule_mapgen:dungeon_tile2" then
			minetest.env:add_item(pos, "hyruletools:key")
		else
			minetest.env:add_item(pos, "hyruletools:retro_key")
		end
			minetest.env:remove_node(pos)
			return itemstack
	end,
})

minetest.register_node("hyrule_mapgen:chest_bosskey", {
	description = "Dungeon Chest (Boss key)",
	tiles = {"hyrule_mapgen_chest_top.png", "hyrule_mapgen_chest_top.png", "hyrule_mapgen_chest_side.png",
		"hyrule_mapgen_chest_side.png", "hyrule_mapgen_chest_side.png", "hyrule_mapgen_chest_bosskey.png"},
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
	groups = {cracky = 2, oddly_breakable_by_hand = 1},
	is_ground_content = false,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_rightclick = function(pos, node, clicker, item, _)
		local name = clicker:get_player_name()
		if clicker:get_wielded_item():get_name() == "hyruletools:key" then
			item:take_item()
			minetest.env:add_item(pos, "hyruletools:key_boss")
			minetest.env:remove_node(pos)
		else
		minetest.chat_send_player(name, "It's locked, you need a key!")
		end
	end,
})

minetest.register_node("hyrule_mapgen:bridge", {
	description = "Wooden Bridge",
	tiles = {
		"hyrule_mapgen_bridge.png",
		"hyrule_mapgen_bridge.png",
		"hyrule_mapgen_bridge_side.png",
		"hyrule_mapgen_bridge_side.png",
		"hyrule_mapgen_bridge.png",
		"hyrule_mapgen_bridge.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, -0.125, -0.1875}, -- NodeBox1
			{-0.5, -0.5, 0.1875, 0.5, -0.125, 0.4375}, -- NodeBox2
			{-0.5, -0.5, -0.125, 0.5, -0.125, 0.125}, -- NodeBox3
			{-0.5, -0.4375, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox4
		}
	},
	groups = {choppy=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:bridge2", {
	description = "Subrosian Bridge",
	tiles = {
		"hyrule_mapgen_bridge2.png",
		"hyrule_mapgen_bridge2.png",
		"hyrule_mapgen_bridge_side2.png",
		"hyrule_mapgen_bridge_side2.png",
		"hyrule_mapgen_bridge2.png",
		"hyrule_mapgen_bridge2.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.4375, 0.5, -0.125, -0.1875}, -- NodeBox1
			{-0.5, -0.5, 0.1875, 0.5, -0.125, 0.4375}, -- NodeBox2
			{-0.5, -0.5, -0.125, 0.5, -0.125, 0.125}, -- NodeBox3
			{-0.5, -0.4375, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox4
		}
	},
	groups = {choppy=2, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:swamp_flower", {
	description = "Swamp Flower",
	drawtype = "mesh",
	mesh = "lilypad.b3d",
	tiles = {"hyrule_mapgen_swampflower.png"},
	inventory_image = "hyrule_mapgen_swampflower.png",
	paramtype = "light",
	sunlight_propagates = false,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-1, -0.5, -1, 1, -0.4, 1}
	},
	groups = {cracky=3,dig_immediate=3},
})

playereffects.register_effect_type("float", "", nil, {"gravity"}, 
	function(player)
		player:set_physics_override(nil,nil,0.2)
		physics_overriden = true
	end,
	
	function(effect, player)
		player:set_physics_override(nil,nil,1)
		physics_overriden = false
	end,
	false
)

minetest.register_node("hyrule_mapgen:fallen_leaves", {
	description = "Fallen Leaves",
	tiles = {
		"hyrule_mapgen_leaves.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	place_param2 = random,
	groups = {snappy=2, oddly_breakable_by_hand=1, dig_immediate=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},
		}
	}
})

minetest.register_node("hyrule_mapgen:biglily", {
	description = "Big Waterlily",
	drawtype = "mesh",
	mesh = "lilypad.b3d",
	tiles = {"hyrule_mapgen_biglily.png"},
	inventory_image = "hyrule_mapgen_biglily.png",
	paramtype = "light",
	sunlight_propagates = false,	
	walkable = true,
	is_ground_content = true,
	liquids_pointable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-1, -0.5, -1, 1, -0.4, 1}
	},
	--on_place from flowers waterlily Originally by Ironzorg (MIT) and VanessaE (MIT)
    --Various Minetest developers and contributors.
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local node = minetest.get_node(pointed_thing.under).name
		local def = minetest.registered_nodes[node]
		local player_name = placer:get_player_name()

		if def and def.liquidtype == "source" and
				minetest.get_item_group(node, "water") > 0 then
			if not minetest.is_protected(pos, player_name) then
				minetest.set_node(pos, {name = "hyrule_mapgen:biglily",
					param2 = math.random(0, 3)})
				if not minetest.setting_getbool("creative_mode") then
					itemstack:take_item()
				end
			else
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos, player_name)
			end
		end

		return itemstack
	end,
	groups = {snappy=1, dig_immediate=3,},
})

minetest.register_node("hyrule_mapgen:deku_flower", {
	description = "Deku Flower",
	drawtype = "mesh",
	mesh = "flatnode.b3d",
	tiles = {"hyrule_mapgen_dekuflower.png"},
	inventory_image = "hyrule_mapgen_dekuflower.png",
	paramtype = "light",
	sunlight_propagates = false,	
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	groups = {snappy=1, dig_immediate=3,},
})

minetest.register_node("hyrule_mapgen:healwater_src", {
	description = "Healing Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png^[colorize:pink:150",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	alpha = 160,
	light_source = 14,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = -1,
	liquidtype = "source",
	liquid_alternative_flowing = "hyrule_mapgen:healwater_src",
	liquid_alternative_source = "hyrule_mapgen:healwater_src",
	liquid_range = 0,
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 80, g = 50, b = 50},
	groups = {water = 3, liquid = 3,},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("hyrule_mapgen:fake_lava", {
	description = "Fake Lava",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png^[colorize:orange:50",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.0,
			},
		},
	},
	light_source = 8,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = false,
	is_ground_content = false,
	liquid_renewable = false,
	drop = "",
	drowning = 1,
	damage_per_second = 3,
	liquidtype = "source",
	liquid_alternative_flowing = "hyrule_mapgen:fake_lava",
	liquid_alternative_source = "hyrule_mapgen:fake_lava",
	liquid_range = 0,
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 80, g = 50, b = 20},
	groups = {water = 3, liquid = 3, not_in_creative_inventory=1},
})

minetest.register_node("hyrule_mapgen:geyser", {
	description = "Lava Geyser",
	tiles = {
		"hyrule_mapgen_geyser_top.png",
		"hyrule_mapgen_geyser_side.png",
		"hyrule_mapgen_geyser_side.png",
		"hyrule_mapgen_geyser_side.png",
		"hyrule_mapgen_geyser_side.png",
		"hyrule_mapgen_geyser_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {crumbly=2, oddly_breakable_by_hand=1},
	damage_per_second = 1,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5}, -- NodeBox1
			{-0.4375, -0.3125, -0.4375, 0.4375, -0.125, 0.4375}, -- NodeBox2
			{-0.375, -0.125, -0.375, -0.125, 0, 0.375}, -- NodeBox3
			{0.1875, -0.125, -0.375, 0.375, 0, 0.375}, -- NodeBox4
			{-0.375, -0.125, -0.375, 0.375, 0, -0.1875}, -- NodeBox5
			{-0.3125, -0.125, 0.125, 0.3125, 0, 0.375}, -- NodeBox6
		}
	}
})

minetest.register_node("hyrule_mapgen:leaves_with_gale", {
	description = "Leaves with Gale seed",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"default_leaves.png^hyrule_mapgen_galeseed.png"
	},
	drop = {
		max_items = 1,
		items = {
			{items = {'default:sapling'}, rarity = 20,},
			{items = {'default:leaves'},}
		}
	},
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:seed_satchel" then
		local item = clicker:get_wielded_item()
		itemstack:take_item()
		minetest.env:add_item(pos, "hyruletools:seed_gale")
		minetest.env:set_node(pos, {name="default:leaves"})
		end
	end,
	walkable = false,
	groups = {snappy=3, oddly_breakable_by_hand=1, dig_immediate=3},
	after_place_node = default.after_place_leaves
})

minetest.register_node("hyrule_mapgen:leaves_with_ember", {
	description = "Leaves with Ember seed",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"default_pine_needles.png^hyrule_mapgen_emberseed.png"
	},
	drop = "default:pine_needles",
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:seed_satchel" then
		local item = clicker:get_wielded_item()
		itemstack:take_item()
		minetest.env:add_item(pos, "hyruletools:seed_ember")
		minetest.env:set_node(pos, {name="default:pine_needles"})
		end
	end,
	walkable = false,
	groups = {snappy=3, oddly_breakable_by_hand=1, dig_immediate=3}
})

minetest.register_node("hyrule_mapgen:leaves_with_pegasus", {
	description = "Leaves with Pegasus seed",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"default_jungleleaves.png^hyrule_mapgen_pegasusseed.png"
	},
	drop = {
		max_items = 1,
		items = {
			{items = {'default:junglesapling'}, rarity = 20,},
			{items = {'default:jungleleaves'},}
		}
	},
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:seed_satchel" then
		local item = clicker:get_wielded_item()
		itemstack:take_item()
		minetest.env:add_item(pos, "hyruletools:seed_pegasus")
		minetest.env:set_node(pos, {name="default:jungleleaves"})
		end
	end,
	walkable = false,
	groups = {snappy=3, oddly_breakable_by_hand=1, dig_immediate=3},
	after_place_node = default.after_place_leaves
})

minetest.register_node("hyrule_mapgen:leaves_with_mystery", {
	description = "Leaves with Mystery seed",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"default_aspen_leaves.png^hyrule_mapgen_mysteryseed.png"
	},
	drop = {
		max_items = 1,
		items = {
			{items = {'default:aspen_sapling'}, rarity = 20,},
			{items = {'default:aspen_leaves'},}
		}
	},
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:seed_satchel" then
		local item = clicker:get_wielded_item()
		itemstack:take_item()
		minetest.env:add_item(pos, "hyruletools:seed_mystery")
		minetest.env:set_node(pos, {name="default:aspen_leaves"})
		end
	end,
	walkable = false,
	groups = {snappy=3, oddly_breakable_by_hand=1, dig_immediate=3},
	after_place_node = default.after_place_leaves
})

minetest.register_node("hyrule_mapgen:swamp_mud", {
	description = "Swamp Mud",
	tiles = {
		"hyrule_mapgen_swampmud.png"
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_dirt_defaults()
})

minetest.register_node("hyrule_mapgen:swamp_grass", {
	description = "Swamp Grass",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_swampgrass.png"},
	inventory_image = "hyrule_mapgen_swampgrass.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.5, -0.3, 0.3, 0.4, 0.3}}
	},
	groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3},
	sounds = default.node_sound_leaves_defaults(),
	on_destruct = function(pos, oldnode)
		local num = math.random(3,7)
		if num == 5 then
		minetest.env:add_item(pos, "hyruletools:green_rupee")
		end
		if num == 4 then
		minetest.env:add_entity(pos, "hyruletools:heart_entity")
		end
	end,
	drop = "",
})

minetest.register_node("hyrule_mapgen:grupee", {
	description = "Green Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"hyrule_mapgen_grupee.png"
	},
	use_texture_alpha = true,
	groups = {cracky=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:rrupee", {
	description = "Red Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"hyrule_mapgen_rrupee.png"
	},
	use_texture_alpha = true,
	groups = {cracky=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:brupee", {
	description = "Blue Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"hyrule_mapgen_brupee.png"
	},
	use_texture_alpha = true,
	groups = {cracky=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:nrupee", {
	description = "Nyan Rupee Block",
	drawtype = "allfaces",
	paramtype = "light",
	tiles = {
		"hyrule_mapgen_nrupee.png"
	},
	use_texture_alpha = true,
	groups = {cracky=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:wood_fence", {
	description = "Wooden Fence",
	inventory_image = "hyrule_mapgen_woodfence.png",
	wield_image = "hyrule_mapgen_woodfence.png",
	sounds = default.node_sound_wood_defaults(),
	groups = {choppy=1,},
	tiles = {
		"hyrule_mapgen_woodfence.png",
		"hyrule_mapgen_woodfence.png^[transformFY",
		"hyrule_mapgen_woodfence.png",
		"hyrule_mapgen_woodfence.png^[transformFX",
		"hyrule_mapgen_woodfence.png^[transformFX",
		"hyrule_mapgen_woodfence.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.125, 0.5, 0.125}, -- NodeBox1
			{-0.5, 0, 0, 0.5, 0.1875, 0.0625}, -- NodeBox2
		}
	},
})

minetest.register_node("hyrule_mapgen:sandstone", {
	description = "Dungeon Sandstone",
	tiles = {
		"hyrule_mapgen_sandstone.png"
	},
	groups = {cracky=3,},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:sandstone_block", {
	description = "Dungeon Sandstone Block",
	tiles = {
		"hyrule_mapgen_sandstone.png",
		"hyrule_mapgen_sandstone.png",
		"hyrule_mapgen_sandstone_side.png",
	},
	groups = {cracky=3,},
	sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab(
	"dsandstone",
	"hyrule_mapgen:sandstone",
	{cracky = 3, oddly_breakable_by_hand = 2, flammable = 2},
	{"hyrule_mapgen_sandstone.png"},
	"Dungeon Sandstone Stair",
	"Dungeon Sandstne Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("hyrule_mapgen:sandstone_tile", {
	description = "Dungeon Sandstone Tile",
	tiles = {
		"hyrule_mapgen_sandstone_tile.png"
	},
	groups = {cracky=3,},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:sandstone_decoration", {
	description = "Dungeon Sandstone Decoration",
	tiles = {
		"hyrule_mapgen_sandstone.png",
		"hyrule_mapgen_sandstone.png",
		"hyrule_mapgen_sandstone_decoration.png",
		"hyrule_mapgen_sandstone_decoration.png",
		"hyrule_mapgen_sandstone_decoration.png",
		"hyrule_mapgen_sandstone_decoration.png",
	},
	groups = {cracky=3,},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:sandstone_decoration2", {
	description = "Dungeon Sandstone Decoration 2",
	tiles = {
		"hyrule_mapgen_sandstone.png",
		"hyrule_mapgen_sandstone.png",
		"hyrule_mapgen_sandstone_decoration2.png",
		"hyrule_mapgen_sandstone_decoration2.png",
		"hyrule_mapgen_sandstone_decoration2.png",
		"hyrule_mapgen_sandstone_decoration2.png",
	},
	groups = {cracky=3,},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:pillar", {
	description = "Sandstone Pillar",
	tiles = {
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_pillar.png",
		"hyrule_mapgen_sandstone_pillar.png",
		"hyrule_mapgen_sandstone_pillar.png",
		"hyrule_mapgen_sandstone_pillar.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=2, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- NodeBox4
		}
	},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:pillar_base", {
	description = "Sandstone Pillar (base)",
	tiles = {
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_pillar_base.png",
		"hyrule_mapgen_sandstone_pillar_base.png",
		"hyrule_mapgen_sandstone_pillar_base.png",
		"hyrule_mapgen_sandstone_pillar_base.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=2, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, -- NodeBox1
			{-0.375, -0.4375, -0.375, 0.375, -0.3125, 0.375}, -- NodeBox2
			{-0.3125, -0.3125, -0.3125, 0.3125, -0.1875, 0.3125}, -- NodeBox3
			{-0.25, -0.1875, -0.25, 0.25, 0.5, 0.25}, -- NodeBox4
		}
	},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:pillar_top", {
	description = "Sandstone Pillar (top)",
	tiles = {
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_tile.png",
		"hyrule_mapgen_sandstone_pillar_top.png",
		"hyrule_mapgen_sandstone_pillar_top.png",
		"hyrule_mapgen_sandstone_pillar_top.png",
		"hyrule_mapgen_sandstone_pillar_top.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=2, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, 0.4375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox1
			{-0.375, 0.3125, -0.375, 0.375, 0.4375, 0.375}, -- NodeBox2
			{-0.3125, 0.1875, -0.3125, 0.3125, 0.3125, 0.3125}, -- NodeBox3
			{-0.25, -0.5, -0.25, 0.25, 0.1875, 0.25}, -- NodeBox4
		}
	},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:greenwall", {
	description = "Green Tile",
	tiles = {
		"hyrule_mapgen_green_wall.png"
	},
	groups = {cracky=1, magnetic=0}
})

minetest.register_node("hyrule_mapgen:beamoswall", {
	description = "Beamos Block",
	tiles = {
		"hyrule_mapgen_beamos_wall.png"
	},
	groups = {cracky=1, magnetic=0}
})

minetest.register_node("hyrule_mapgen:railblock", {
	description = "Railway Block",
	tiles = {
		"hyrule_mapgen_railblock.png"
	},
	groups = {cracky=1, magnetic=0}
})

minetest.register_node("hyrule_mapgen:greentile", {
	description = "Green Dungeon Tile",
	tiles = {
		"hyrule_mapgen_greentile.png"
	},
	groups = {cracky=1,},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:stained_glass", {
	description = "Stained Glass",
	drawtype = "glasslike",
	tiles = {
		"hyrule_mapgen_stainedglass.png"
	},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = 10,
	sunlight_propagates = true,
	groups = {cracky=1, oddly_breakable_by_hand=1, dig_immediate = 3},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:ganon_sphere", {
	description = "Ganon Sphere",
	tiles = {
		"hyrule_mapgen_ganonsphere.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 10,
	groups = {cracky=4, oddly_breakable_by_hand=1},
	walkable = false,
	sounds = default.node_sound_glass_defaults(),
	use_texture_alpha = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.1875, -0.1875, 0.375, 0.1875, 0.1875}, -- NodeBox5
			{-0.1875, -0.375, -0.1875, 0.1875, 0.375, 0.1875}, -- NodeBox6
			{-0.3125, -0.25, -0.25, 0.3125, 0.25, 0.25}, -- NodeBox7
			{-0.25, -0.25, -0.3125, 0.25, 0.25, 0.3125}, -- NodeBox8
			{-0.25, -0.3125, -0.25, 0.25, 0.3125, 0.25}, -- NodeBox9
			{-0.1875, -0.1875, -0.375, 0.1875, 0.1875, 0.375}, -- NodeBox12
		}
	},
	drop = ""
})

minetest.register_node("hyrule_mapgen:floortile", {
	description = "Floor Tile",
	tiles = {
		"hyrule_mapgen_floortile.png"
	},
	groups = {cracky=1, magnetic=1}
})

minetest.register_node("hyrule_mapgen:floorbrick", {
	description = "Floor Brick",
	tiles = {
		"hyrule_mapgen_brick.png"
	},
	groups = {cracky=1}
})

stairs.register_stair_and_slab(
	"floortile",
	"hyrule_mapgen:floortile",
	{cracky = 3, cools_lava = 1},
	{"hyrule_mapgen_floortile.png"},
	"Floor Tile Stair",
	"Floor Tile Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("hyrule_mapgen:carpet", {
	description = "Carpet Block",
	tiles = {
		"hyrule_mapgen_carpet.png"
	},
	groups = {fleshy=1, dig_immediate=3, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:carpet_trap", {
	description = "Carpet Trap",
	tiles = {
		"hyrule_mapgen_carpet.png"
	},
	walkable = false,
	damage_per_second = 3,
	groups = {fleshy=1, dig_immediate=3, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:magnblock", {
	description = "Magnetic Block (almost unbreakeable)",
	tiles = {
		"hyrule_mapgen_magnblock.png"
	},
	groups = {cracky=7, magnetic=1},
	on_blast = function(pos, intensity)
	end
})

minetest.register_node("hyrule_mapgen:flameblock", {
	description = "Flame Block (almost unbreakeable)",
	tiles = {
		"hyrule_mapgen_flameblock.png"
	},
	groups = {cracky=7, flammable=1},
	on_blast = function(pos, intensity)
	end
})

minetest.register_node("hyrule_mapgen:subrosian_stone", {
	description = "Subrosian Stone",
	tiles = {
		"hyrule_mapgen_subrosianstone.png"
	},
	paramtype = "light",
	light_source = 10,
	groups = {cracky=2,}
})

local function open_door(pos, player)
		if doors.get then
				    local minp = {x=pos.x-5, y=pos.y, z=pos.z-5}
    local maxp = {x=pos.x+5, y=pos.y, z=pos.z+5}
    local doorss = minetest.find_nodes_in_area(minp, maxp, "group:door")
    for i = 1, #doorss do
       local dpos = {x=doorss[i].x, y=doorss[i].y, z=doorss[i].z}
       local door = doors.get(dpos)
       door:toggle(player)
    end

		end
end

minetest.register_node("hyrule_mapgen:lamp", {
	description = "Floor Lamp",
	tiles = {
		"hyrule_mapgen_lamptop.png",
		"hyrule_mapgen_lamptop.png",
		"hyrule_mapgen_lampside.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0.375, 0.5, 0, 0.5}, -- NodeBox1
			{0.375, -0.5, -0.5, 0.5, 0, -0.375}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, 0, -0.375}, -- NodeBox3
			{-0.5, -0.5, 0.375, -0.375, 0, 0.5}, -- NodeBox4
			{-0.375, -0.5, -0.375, 0.375, -0.1875, 0.375}, -- NodeBox5
			{-0.375, -0.375, -0.4375, 0.375, 0.1875, -0.3125}, -- NodeBox6
			{-0.375, -0.375, 0.3125, 0.375, 0.1875, 0.4375}, -- NodeBox7
			{0.3125, -0.375, -0.375, 0.4375, 0.1875, 0.375}, -- NodeBox8
			{-0.4375, -0.375, -0.375, -0.3125, 0.1875, 0.375}, -- NodeBox9
			{-0.1875, -0.5, -0.1875, 0.1875, -0.0625, 0.1875}, -- NodeBox10
			{-0.4375, -0.5, -0.4375, 0.4375, 0.0625, 0.4375}, -- NodeBox11
		}
	},
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "hyruletools:lantern" then
			minetest.set_node(pos, {name="hyrule_mapgen:lamp_lit"})
			open_door(pos, clicker)
		end
	end,
	groups = {cracky=1, falling_node=1},
})

minetest.register_node("hyrule_mapgen:lamp_lit", {
	description = "Floor Lamp",
	tiles = {
		"hyrule_mapgen_lamptop.png",
		"hyrule_mapgen_lamptop.png",
		"hyrule_mapgen_lampside.png",
	},
	drawtype = "nodebox",
	light_source = 10,
	sunlight_propagates = false,
	paramtype = "light",
	drop = "hyrule_mapgen:lamp",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0.375, 0.5, 0, 0.5}, -- NodeBox1
			{0.375, -0.5, -0.5, 0.5, 0, -0.375}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, 0, -0.375}, -- NodeBox3
			{-0.5, -0.5, 0.375, -0.375, 0, 0.5}, -- NodeBox4
			{-0.375, -0.5, -0.375, 0.375, -0.1875, 0.375}, -- NodeBox5
			{-0.375, -0.375, -0.4375, 0.375, 0.1875, -0.3125}, -- NodeBox6
			{-0.375, -0.375, 0.3125, 0.375, 0.1875, 0.4375}, -- NodeBox7
			{0.3125, -0.375, -0.375, 0.4375, 0.1875, 0.375}, -- NodeBox8
			{-0.4375, -0.375, -0.375, -0.3125, 0.1875, 0.375}, -- NodeBox9
			{-0.1875, -0.5, -0.1875, 0.1875, -0.0625, 0.1875}, -- NodeBox10
			{-0.4375, -0.5, -0.4375, 0.4375, 0.0625, 0.4375}, -- NodeBox11
		}
	},
	groups = {cracky=1, falling_node=1, not_in_creative_inventory=1},
})

minetest.register_node("hyrule_mapgen:rock", {
	description = "Rock",
	tiles = {
		"hyrule_mapgen_rock.png",
		"hyrule_mapgen_rock.png",
		"hyrule_mapgen_rock.png",
		"hyrule_mapgen_rock.png",
		"hyrule_mapgen_rock.png",
		"hyrule_mapgen_rock.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=1, falling_node=1},
	on_destruct = function(pos, oldnode)
		local num = math.random(3,5)
		if num == 5 then
		minetest.env:add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, "hyruletools:green_rupee")
		end
	end,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.3125, -0.4375, 0.3125}, -- NodeBox1
			{-0.4375, -0.4375, -0.3125, 0.375, -0.125, 0.25}, -- NodeBox2
			{-0.3125, -0.125, -0.375, 0.25, -0.0625, 0.3125}, -- NodeBox3
			{-0.3125, -0.4375, -0.4375, 0.25, -0.125, 0.375}, -- NodeBox4
			{-0.375, -0.4375, -0.375, 0.3125, -0.125, 0.3125}, -- NodeBox5
			{-0.25, -0.0625, -0.3125, 0.1875, 0, 0.25}, -- NodeBox6
			{-0.375, -0.125, -0.25, 0.3125, -0.0625, 0.1875}, -- NodeBox7
		}
	}
})

minetest.register_node("hyrule_mapgen:packed_dirt", {
	description = "Packed Dirt",
	tiles = {
		"default_dirt.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	drop = "default:dirt",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.4, 0.5},
		}
	}
})

minetest.register_node("hyrule_mapgen:wallring", {
	description = "Wall Ring",
	tiles = {
		"hyrule_mapgen_railblock.png",
		"hyrule_mapgen_railblock.png",
		"hyrule_mapgen_wallring.png",
		"hyrule_mapgen_wallring.png",
		"hyrule_mapgen_wallring.png",
		"hyrule_mapgen_wallring.png",
	},
	groups = {cracky=1, hook=1}
})


minetest.register_node("hyrule_mapgen:lavabiome_dirt", {
	description = "Burnt Dirt",
	tiles = {
		"hyrule_mapgen_dirt.png"
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1}
})

minetest.register_node("hyrule_mapgen:stone_with_redrupee", {
	description = "Buried red rupee",
	tiles = {"default_stone.png^hyruletools_redrupee_ore.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'hyruletools:red_rupee',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("hyrule_mapgen:stone_with_bluerupee", {
	description = "Buried blue rupee",
	tiles = {"default_stone.png^hyruletools_bluerupee_ore.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'hyruletools:blue_rupee',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("hyrule_mapgen:stone_with_greenrupee", {
	description = "Buried Green Rupee",
	tiles = {"default_stone.png^hyruletools_greenrupee_ore.png"},
	groups = {cracky = 2, xp = 1},
	drop = 'hyruletools:green_rupee',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("hyrule_mapgen:dungeon_barrier", {
	description = "Retro Dungeon Barrier",
	tiles = {
		"hyrule_mapgen_dungeon_barrier.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_tile", {
	description = "Retro Dungeon Tile",
	tiles = {
		"hyrule_mapgen_dungeon_tile.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_brick", {
	description = "Retro Dungeon Brick",
	tiles = {
		"hyrule_mapgen_dungeon_brick.png",
	},
	groups = {cracky=3},
})

stairs.register_stair_and_slab(
	"dungeon_brick",
	"hyrule_mapgen:dungeon_brick",
	{cracky = 3, cools_lava = 1},
	{"hyrule_mapgen_dungeon_brick.png"},
	"Retro Dungeon Stair",
	"Retro Dungeon Slab",
	default.node_sound_stone_defaults()
)

minetest.register_node("hyrule_mapgen:dungeon_barrier2", {
	description = "Retro Dungeon Barrier 2",
	tiles = {
		"hyrule_mapgen_dungeon_barrier2.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_tile2", {
	description = "Retro Dungeon Tile 2",
	tiles = {
		"hyrule_mapgen_dungeon_tile2.png",
	},
	groups = {cracky=3},
})

minetest.register_node("hyrule_mapgen:dungeon_brick2", {
	description = "Retro Dungeon Brick 2",
	tiles = {
		"hyrule_mapgen_dungeon_brick2.png",
	},
	groups = {cracky=3},
})

stairs.register_stair_and_slab(
	"dungeon_brick2",
	"hyrule_mapgen:dungeon_brick2",
	{cracky = 3, cools_lava = 1},
	{"hyrule_mapgen_dungeon_brick2.png"},
	"Retro Dungeon Stair 2",
	"Retro Dungeon Slab 2",
	default.node_sound_stone_defaults()
)

minetest.register_node("hyrule_mapgen:dungeon_torch", {
	description = "Dungeon Torch",
	drawtype = "plantlike",
	visual_scale = 2,
	walkable = false,
	tiles = {
		{name = "hyrule_mapgen_torch.png", animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 0.5,},
		},
	},
	inventory_image = "hyrule_mapgen_torch_inv.png",
	wield_image = "hyrule_mapgen_torch_inv.png",
	paramtype = "light",
	light_source = 14,
	use_texture_alpha = true,
	groups = {choppy=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.2, 0.5},
		}
	},
})

minetest.register_node("hyrule_mapgen:subrosian_tile", {
	description = "Subrosian Tile",
	tiles = {
		"hyrule_mapgen_subrosiantile.png",
	},
	paramtype = "light",
	light_source = 10,
	groups = {cracky=2},
})

minetest.register_node("hyrule_mapgen:subrosian_sand", {
	description = "Subrosian Sand",
	tiles = {
		"hyrule_mapgen_subrosiansand.png",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:50",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:10",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:60",
	},
	paramtype = "light",
	light_source = 10,
	groups = {crumbly=1, oddly_breakable_by_hand=1},
})

minetest.register_node("hyrule_mapgen:blue_ore", {
	description = "Subrosian Sand",
	tiles = {
		"hyrule_mapgen_subrosiansand.png",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:50",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:10",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:60",
	},
	paramtype = "light",
	light_source = 10,
	drop = "hyruletools:blue_ore",
	groups = {crumbly=1, oddly_breakable_by_hand=1, xp=1, not_in_creative_inventory=1},
})

minetest.register_node("hyrule_mapgen:red_ore", {
	description = "Subrosian Sand",
	tiles = {
		"hyrule_mapgen_subrosiansand.png",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:50",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:20",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:10",
		"hyrule_mapgen_subrosiansand.png^[colorize:black:60",
	},
	paramtype = "light",
	light_source = 10,
	drop = "hyruletools:red_ore",
	groups = {crumbly=1, oddly_breakable_by_hand=1, xp=1, not_in_creative_inventory=1},
})

minetest.register_node("hyrule_mapgen:stalagtite", {
	description = "Stalagtite",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_stalagmite0.png"},
	inventory_image = "hyrule_mapgen_stalagmite0.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:stalagtite1", {
	description = "Stalagtite",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_stalagmite1.png"},
	inventory_image = "hyrule_mapgen_stalagmite1.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
})

minetest.register_node("hyrule_mapgen:stalagtite2", {
	description = "Stalagtite",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_stalagmite2.png"},
	inventory_image = "hyrule_mapgen_stalagmite2.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:stalagtite3", {
	description = "Stalagtite",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_stalagmite3.png"},
	inventory_image = "hyrule_mapgen_stalagmite3.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:stalagmite0", {
	description = "Stalagmite",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_stalagmite0.png^[transformFY"},
	inventory_image = "hyrule_mapgen_stalagmite0.png^[transformFY",
	is_ground_content = false,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:stalagmite1", {
	description = "Stalagmite",
	drawtype = "plantlike",
	visual_scale = 1.5,
	tiles = {"hyrule_mapgen_stalagmite3.png^[transformFY"},
	inventory_image = "hyrule_mapgen_stalagmite3.png^[transformFY",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:stalagmite2", {
	description = "Stalagmite",
	drawtype = "plantlike",
	visual_scale = 1.5,
	tiles = {"hyrule_mapgen_stalagmite2.png^[transformFY"},
	inventory_image = "hyrule_mapgen_stalagmite2.png^[transformFY",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:cicicle", {
	description = "Ceiling Icicle",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_icicle.png"},
	inventory_image = "hyrule_mapgen_icicle.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	use_texture_alpha = true,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:cicicle2", {
	description = "Ceiling Icicle 2",
	drawtype = "plantlike",
	tiles = {"hyrule_mapgen_icicle2.png"},
	inventory_image = "hyrule_mapgen_icicle2.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	use_texture_alpha = true,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_node("hyrule_mapgen:roots", {
	description = "Hanging Roots",
	drawtype = "torchlike",
	tiles = {"hyrule_mapgen_roots.png"},
	inventory_image = "hyrule_mapgen_roots.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
})

minetest.register_node("hyrule_mapgen:roots2", {
	description = "Hanging Root",
	drawtype = "torchlike",
	tiles = {"hyrule_mapgen_roots2.png"},
	inventory_image = "hyrule_mapgen_roots2.png",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	paramtype = "light",
	selection_box = {
	type = "fixed",
	fixed = {{-0.3, -0.2, -0.3, 0.3, 0.5, 0.3}}
	},
	groups = {crumbly=1, oddly_breakable_by_hand=1},
})

tnt.register_tnt({
	name = "hyrule_mapgen:powder_keg",
	description = "Powder Keg",
	tiles = {
		"hyrule_mapgen_keg_top.png",
		"hyrule_mapgen_keg_top.png",
		"hyrule_mapgen_keg_side.png",
		"hyrule_mapgen_keg_side.png",
		"hyrule_mapgen_keg_front.png",
		"hyrule_mapgen_keg_front.png",
	},
	radius = 3,
})

minetest.register_node("hyrule_mapgen:statue", {
	description = "Gossip Stone",
	tiles = {
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, falling_node=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.1875, 0.4375, 0.4375, 0.25}, -- NodeBox1
			{-0.375, 0.4375, -0.1875, 0.375, 0.5, 0.25}, -- NodeBox2
		}
	},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:eye" then
			minetest.set_node(pos, {name="hyrule_mapgen:statue_active", param2=node.param2})
		end
	end
})


minetest.register_node("hyrule_mapgen:statue_active", {
	tiles = {
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_side.png",
		"hyrule_mapgen_statue_active.png"
	},
	drop = 'hyrule_mapgen:statue',
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, falling_node=1},
	light_source = 5,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.1875, 0.4375, 0.4375, 0.25}, -- NodeBox1
			{-0.375, 0.4375, -0.1875, 0.375, 0.5, 0.25}, -- NodeBox2
		}
	},
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:eye" then
			minetest.set_node(pos, {name="hyrule_mapgen:statue", param2=node.param2})
		end
	end
})


minetest.register_node("hyrule_mapgen:glowstone", {
	description = "Glowstone",
	drawtype = "allfaces",
	tiles = {
		"hyrulemapgen_glowstone.png"
	},
	use_texture_alpha = true,
	groups = {snappy=3, oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 14,
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("hyrule_mapgen:volvagia_spawn", {
	description = "Volvagia Spawner",
	tiles = {
		"hyrule_mapgen_vspawn.png"
	},
	groups = {snappy=3, oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
	minetest.after(5, function()
	minetest.add_entity({x=pos.x, y=pos.y+0.5, z=pos.z}, "mobs_loz:volvagia")
	minetest.sound_play("BrassFleece", {gain=0.3})
	end)
	end,
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:sword" then
			minetest.set_node(pos, {name="hyrule_mapgen:ganon_spawn", param2=node.param2})
		end
	end
})

minetest.register_node("hyrule_mapgen:ganon_spawn", {
	description = "Ganon Spawner",
	tiles = {
		"hyrule_mapgen_gspawn.png"
	},
	groups = {snappy=3, oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
	minetest.place_schematic({x=pos.x-6, y=pos.y-1, z=pos.z-6}, minetest.get_modpath("hyrule_mapgen").."/schematics/ganon_dungeon.mts", random, {}, true)
	minetest.after(5, function()
	minetest.add_entity({x=pos.x+3, y=pos.y+1, z=pos.z+3}, "mobs_loz:ganon")
	end)
	end,
})

minetest.register_node("hyrule_mapgen:bongo_spawn", {
	description = "Bongo Bongo Spawner",
	tiles = {
		"hyrule_mapgen_wspawn.png"
	},
	groups = {snappy=3, oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
	minetest.after(5, function()
	minetest.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:bongobongo")
	end)
	end,
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:sword" then
			minetest.set_node(pos, {name="hyrule_mapgen:ganon_spawn", param2=node.param2})
		end
	end
})

minetest.register_node("hyrule_mapgen:dodongo_spawn", {
	description = "King Dodongo Spawner",
	tiles = {
		"hyrule_mapgen_dspawn.png"
	},
	groups = {snappy=3, oddly_breakable_by_hand = 1},
	paramtype = "light",
	light_source = 10,
	sounds = default.node_sound_glass_defaults(),
	on_construct = function(pos)
	minetest.after(5, function()
	minetest.add_entity({x=pos.x, y=pos.y+1, z=pos.z}, "mobs_loz:dodongo_boss")
	end)
	end,
	on_rightclick = function(pos, node, clicker, item, _)
		local wield_item = clicker:get_wielded_item():get_name()
		if wield_item == "hyruletools:sword" then
			minetest.set_node(pos, {name="hyrule_mapgen:ganon_spawn", param2=node.param2})
		end
	end
})

minetest.register_node("hyrule_mapgen:boulder", {
	description = "Boulder",
	tiles = {
		"hyrule_mapgen_boulder.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.0625, 0.5}, -- NodeBox1
			{-0.5, -0.375, -0.625, 0.5, 0.9375, 0.625}, -- NodeBox2
			{-0.625, -0.375, -0.5, 0.625, 0.9375, 0.5}, -- NodeBox3
			{-0.5, -0.25, -0.6875, 0.5, 0.8125, 0.6875}, -- NodeBox4
			{-0.6875, -0.25, -0.5, 0.6875, 0.8125, 0.5}, -- NodeBox5
			{-0.5625, -0.25, -0.5625, 0.5625, 0.8125, 0.5625}, -- NodeBox6
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.0625, 0.5}, -- NodeBox1
			{-0.5, -0.375, -0.625, 0.5, 0.9375, 0.625}, -- NodeBox2
			{-0.625, -0.375, -0.5, 0.625, 0.9375, 0.5}, -- NodeBox3
			{-0.5, -0.25, -0.6875, 0.5, 0.8125, 0.6875}, -- NodeBox4
			{-0.6875, -0.25, -0.5, 0.6875, 0.8125, 0.5}, -- NodeBox5
			{-0.5625, -0.25, -0.5625, 0.5625, 0.8125, 0.5625}, -- NodeBox6
		}
	},
	groups = {explody=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:snowball", {
	description = "Snow Boulder",
	tiles = {
		"default_snow.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.0625, 0.5}, -- NodeBox1
			{-0.5, -0.375, -0.625, 0.5, 0.9375, 0.625}, -- NodeBox2
			{-0.625, -0.375, -0.5, 0.625, 0.9375, 0.5}, -- NodeBox3
			{-0.5, -0.25, -0.6875, 0.5, 0.8125, 0.6875}, -- NodeBox4
			{-0.6875, -0.25, -0.5, 0.6875, 0.8125, 0.5}, -- NodeBox5
			{-0.5625, -0.25, -0.5625, 0.5625, 0.8125, 0.5625}, -- NodeBox6
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.0625, 0.5}, -- NodeBox1
			{-0.5, -0.375, -0.625, 0.5, 0.9375, 0.625}, -- NodeBox2
			{-0.625, -0.375, -0.5, 0.625, 0.9375, 0.5}, -- NodeBox3
			{-0.5, -0.25, -0.6875, 0.5, 0.8125, 0.6875}, -- NodeBox4
			{-0.6875, -0.25, -0.5, 0.6875, 0.8125, 0.5}, -- NodeBox5
			{-0.5625, -0.25, -0.5625, 0.5625, 0.8125, 0.5625}, -- NodeBox6
		}
	},
	groups = {explody=1},
	sounds = default.node_sound_dirt_defaults()
})

minetest.register_node("hyrule_mapgen:bucket_milk", {
	tiles = {
		"mobs_bucket_milk2.png",
	},
	drawtype = "mesh",
	mesh = "bottle.obj",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.3125, -0.4375, -0.25, 0.3125, 0, 0.25}, -- NodeBox2
			{-0.25, -0.4375, -0.3125, 0.25, 0, 0.3125}, -- NodeBox3
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875}, -- NodeBox4
			{-0.1875, 0.0625, -0.125, 0.1875, 0.125, 0.125}, -- NodeBox5
			{-0.125, 0.125, -0.125, 0.125, 0.25, 0.125}, -- NodeBox6
			{-0.125, 0.25, -0.1875, 0.125, 0.3125, 0.1875}, -- NodeBox7
			{-0.1875, 0.25, -0.125, 0.1875, 0.3125, 0.125}, -- NodeBox8
			{-0.125, 0.3125, -0.125, 0.125, 0.375, 0.125}, -- NodeBox9
			{-0.125, 0.0625, -0.1875, 0.125, 0.125, 0.1875}, -- NodeBox10
			{-0.1875, 0, -0.25, 0.1875, 0.0625, 0.25}, -- NodeBox11
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.3125, -0.4375, -0.25, 0.3125, 0, 0.25}, -- NodeBox2
			{-0.25, -0.4375, -0.3125, 0.25, 0, 0.3125}, -- NodeBox3
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875}, -- NodeBox4
			{-0.1875, 0.0625, -0.125, 0.1875, 0.125, 0.125}, -- NodeBox5
			{-0.125, 0.125, -0.125, 0.125, 0.25, 0.125}, -- NodeBox6
			{-0.125, 0.25, -0.1875, 0.125, 0.3125, 0.1875}, -- NodeBox7
			{-0.1875, 0.25, -0.125, 0.1875, 0.3125, 0.125}, -- NodeBox8
			{-0.125, 0.3125, -0.125, 0.125, 0.375, 0.125}, -- NodeBox9
			{-0.125, 0.0625, -0.1875, 0.125, 0.125, 0.1875}, -- NodeBox10
			{-0.1875, 0, -0.25, 0.1875, 0.0625, 0.25}, -- NodeBox11
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1,},
	sounds = default.node_sound_glass_defaults(),
	drop = "mobs:bucket_milk"
})

minetest.override_item("mobs:bucket_milk", {
	on_place= function(itemstack, placer, pointed_thing)
		if pointed_thing == nil then return end
		local pos = pointed_thing.above
		minetest.set_node(pos, {name="hyrule_mapgen:bucket_milk"})
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_node("hyrule_mapgen:bucket", {
	tiles = {
		"bucket2.png",
	},
	drawtype = "mesh",
	mesh = "bottle.obj",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.3125, -0.4375, -0.25, 0.3125, 0, 0.25}, -- NodeBox2
			{-0.25, -0.4375, -0.3125, 0.25, 0, 0.3125}, -- NodeBox3
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875}, -- NodeBox4
			{-0.1875, 0.0625, -0.125, 0.1875, 0.125, 0.125}, -- NodeBox5
			{-0.125, 0.125, -0.125, 0.125, 0.25, 0.125}, -- NodeBox6
			{-0.125, 0.25, -0.1875, 0.125, 0.3125, 0.1875}, -- NodeBox7
			{-0.1875, 0.25, -0.125, 0.1875, 0.3125, 0.125}, -- NodeBox8
			{-0.125, 0.3125, -0.125, 0.125, 0.375, 0.125}, -- NodeBox9
			{-0.125, 0.0625, -0.1875, 0.125, 0.125, 0.1875}, -- NodeBox10
			{-0.1875, 0, -0.25, 0.1875, 0.0625, 0.25}, -- NodeBox11
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.3125, -0.4375, -0.25, 0.3125, 0, 0.25}, -- NodeBox2
			{-0.25, -0.4375, -0.3125, 0.25, 0, 0.3125}, -- NodeBox3
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875}, -- NodeBox4
			{-0.1875, 0.0625, -0.125, 0.1875, 0.125, 0.125}, -- NodeBox5
			{-0.125, 0.125, -0.125, 0.125, 0.25, 0.125}, -- NodeBox6
			{-0.125, 0.25, -0.1875, 0.125, 0.3125, 0.1875}, -- NodeBox7
			{-0.1875, 0.25, -0.125, 0.1875, 0.3125, 0.125}, -- NodeBox8
			{-0.125, 0.3125, -0.125, 0.125, 0.375, 0.125}, -- NodeBox9
			{-0.125, 0.0625, -0.1875, 0.125, 0.125, 0.1875}, -- NodeBox10
			{-0.1875, 0, -0.25, 0.1875, 0.0625, 0.25}, -- NodeBox11
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1,},
	sounds = default.node_sound_glass_defaults(),
	drop = "bucket:bucket_empty"
})

minetest.override_item("bucket:bucket_empty", {
	on_place= function(itemstack, placer, pointed_thing)
		if pointed_thing == nil then return end
		local pos = pointed_thing.above
		minetest.set_node(pos, {name="hyrule_mapgen:bucket"})
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_node("hyrule_mapgen:bucket_river_water", {
	tiles = {
		"bucket_river_water2.png",
	},
	drawtype = "mesh",
	mesh = "bottle.obj",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.3125, -0.4375, -0.25, 0.3125, 0, 0.25}, -- NodeBox2
			{-0.25, -0.4375, -0.3125, 0.25, 0, 0.3125}, -- NodeBox3
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875}, -- NodeBox4
			{-0.1875, 0.0625, -0.125, 0.1875, 0.125, 0.125}, -- NodeBox5
			{-0.125, 0.125, -0.125, 0.125, 0.25, 0.125}, -- NodeBox6
			{-0.125, 0.25, -0.1875, 0.125, 0.3125, 0.1875}, -- NodeBox7
			{-0.1875, 0.25, -0.125, 0.1875, 0.3125, 0.125}, -- NodeBox8
			{-0.125, 0.3125, -0.125, 0.125, 0.375, 0.125}, -- NodeBox9
			{-0.125, 0.0625, -0.1875, 0.125, 0.125, 0.1875}, -- NodeBox10
			{-0.1875, 0, -0.25, 0.1875, 0.0625, 0.25}, -- NodeBox11
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.3125, -0.4375, -0.25, 0.3125, 0, 0.25}, -- NodeBox2
			{-0.25, -0.4375, -0.3125, 0.25, 0, 0.3125}, -- NodeBox3
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875}, -- NodeBox4
			{-0.1875, 0.0625, -0.125, 0.1875, 0.125, 0.125}, -- NodeBox5
			{-0.125, 0.125, -0.125, 0.125, 0.25, 0.125}, -- NodeBox6
			{-0.125, 0.25, -0.1875, 0.125, 0.3125, 0.1875}, -- NodeBox7
			{-0.1875, 0.25, -0.125, 0.1875, 0.3125, 0.125}, -- NodeBox8
			{-0.125, 0.3125, -0.125, 0.125, 0.375, 0.125}, -- NodeBox9
			{-0.125, 0.0625, -0.1875, 0.125, 0.125, 0.1875}, -- NodeBox10
			{-0.1875, 0, -0.25, 0.1875, 0.0625, 0.25}, -- NodeBox11
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1,},
	sounds = default.node_sound_glass_defaults(),
	drop = "bucket:bucket_river_water"
})

minetest.override_item("bucket:bucket_river_water", {
	on_use = function(itemstack, placer, pointed_thing)
		if pointed_thing == nil then return end
		local pos = pointed_thing.above
		minetest.set_node(pos, {name="hyrule_mapgen:bucket_river_water"})
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_node("hyrule_mapgen:bucket_lava", {
	tiles = {
		"bucket_lava2.png",
	},
	drawtype = "mesh",
	mesh = "bottle.obj",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.3125, -0.4375, -0.25, 0.3125, 0, 0.25}, -- NodeBox2
			{-0.25, -0.4375, -0.3125, 0.25, 0, 0.3125}, -- NodeBox3
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875}, -- NodeBox4
			{-0.1875, 0.0625, -0.125, 0.1875, 0.125, 0.125}, -- NodeBox5
			{-0.125, 0.125, -0.125, 0.125, 0.25, 0.125}, -- NodeBox6
			{-0.125, 0.25, -0.1875, 0.125, 0.3125, 0.1875}, -- NodeBox7
			{-0.1875, 0.25, -0.125, 0.1875, 0.3125, 0.125}, -- NodeBox8
			{-0.125, 0.3125, -0.125, 0.125, 0.375, 0.125}, -- NodeBox9
			{-0.125, 0.0625, -0.1875, 0.125, 0.125, 0.1875}, -- NodeBox10
			{-0.1875, 0, -0.25, 0.1875, 0.0625, 0.25}, -- NodeBox11
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.3125, -0.4375, -0.25, 0.3125, 0, 0.25}, -- NodeBox2
			{-0.25, -0.4375, -0.3125, 0.25, 0, 0.3125}, -- NodeBox3
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875}, -- NodeBox4
			{-0.1875, 0.0625, -0.125, 0.1875, 0.125, 0.125}, -- NodeBox5
			{-0.125, 0.125, -0.125, 0.125, 0.25, 0.125}, -- NodeBox6
			{-0.125, 0.25, -0.1875, 0.125, 0.3125, 0.1875}, -- NodeBox7
			{-0.1875, 0.25, -0.125, 0.1875, 0.3125, 0.125}, -- NodeBox8
			{-0.125, 0.3125, -0.125, 0.125, 0.375, 0.125}, -- NodeBox9
			{-0.125, 0.0625, -0.1875, 0.125, 0.125, 0.1875}, -- NodeBox10
			{-0.1875, 0, -0.25, 0.1875, 0.0625, 0.25}, -- NodeBox11
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1,},
	sounds = default.node_sound_glass_defaults(),
	drop = "bucket:bucket_lava",
	light_source = 6,
})

minetest.override_item("bucket:bucket_lava", {
	on_use = function(itemstack, placer, pointed_thing)
		if pointed_thing == nil then return end
		local pos = pointed_thing.above
		minetest.set_node(pos, {name="hyrule_mapgen:bucket_lava"})
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_node("hyrule_mapgen:bucket_water", {
	tiles = {
		"bucket_water2.png",
	},
	drawtype = "mesh",
	mesh = "bottle.obj",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.3125, -0.4375, -0.25, 0.3125, 0, 0.25}, -- NodeBox2
			{-0.25, -0.4375, -0.3125, 0.25, 0, 0.3125}, -- NodeBox3
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875}, -- NodeBox4
			{-0.1875, 0.0625, -0.125, 0.1875, 0.125, 0.125}, -- NodeBox5
			{-0.125, 0.125, -0.125, 0.125, 0.25, 0.125}, -- NodeBox6
			{-0.125, 0.25, -0.1875, 0.125, 0.3125, 0.1875}, -- NodeBox7
			{-0.1875, 0.25, -0.125, 0.1875, 0.3125, 0.125}, -- NodeBox8
			{-0.125, 0.3125, -0.125, 0.125, 0.375, 0.125}, -- NodeBox9
			{-0.125, 0.0625, -0.1875, 0.125, 0.125, 0.1875}, -- NodeBox10
			{-0.1875, 0, -0.25, 0.1875, 0.0625, 0.25}, -- NodeBox11
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.3125, -0.4375, -0.25, 0.3125, 0, 0.25}, -- NodeBox2
			{-0.25, -0.4375, -0.3125, 0.25, 0, 0.3125}, -- NodeBox3
			{-0.25, 0, -0.1875, 0.25, 0.0625, 0.1875}, -- NodeBox4
			{-0.1875, 0.0625, -0.125, 0.1875, 0.125, 0.125}, -- NodeBox5
			{-0.125, 0.125, -0.125, 0.125, 0.25, 0.125}, -- NodeBox6
			{-0.125, 0.25, -0.1875, 0.125, 0.3125, 0.1875}, -- NodeBox7
			{-0.1875, 0.25, -0.125, 0.1875, 0.3125, 0.125}, -- NodeBox8
			{-0.125, 0.3125, -0.125, 0.125, 0.375, 0.125}, -- NodeBox9
			{-0.125, 0.0625, -0.1875, 0.125, 0.125, 0.1875}, -- NodeBox10
			{-0.1875, 0, -0.25, 0.1875, 0.0625, 0.25}, -- NodeBox11
		}
	},
	groups = {cracky=1, oddly_breakable_by_hand=1,},
	sounds = default.node_sound_glass_defaults(),
	drop = "bucket:bucket_water"
})

minetest.override_item("bucket:bucket_water", {
	on_use = function(itemstack, placer, pointed_thing)
		if pointed_thing == nil then return end
		local pos = pointed_thing.above
		minetest.set_node(pos, {name="hyrule_mapgen:bucket_water"})
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_node("hyrule_mapgen:magic_tree", {
	description = "Magic Tree Trunk",
	tiles = {
		"hyrule_mapgen_magic_tree_top.png",
		"hyrule_mapgen_magic_tree_top.png",
		"hyrule_mapgen_magic_tree.png",
		"hyrule_mapgen_magic_tree.png",
		"hyrule_mapgen_magic_tree.png",
		"hyrule_mapgen_magic_tree.png"
	},
	paramtype = "facedir",
	groups = {tree=1, choppy=2, flammable=2, oddly_breakable_by_hand = 1,},
	on_place = minetest.rotate_node
})

minetest.register_node("hyrule_mapgen:magic_leaves", {
	description = "Magic Leaves",
	drawtype = "allfaces_optional",
	tiles = {
		"hyrule_mapgen_magic_leaves.png"
	},
	drop = {
		max_items = 1,
		items = {
			{items = {'hyrule_mapgen:magic_sapling'}, rarity = 20,},
			{items = {'hyrule_mapgen:magic_leaves'},}
		}
	},
	groups = {snappy=3, flammable=1, leafdecay=3, oddly_breakable_by_hand = 1, leaves=1,},
	paramtype = "light",
	light_source = 5,
	after_place_node = default.after_place_leaves
})

if minetest.setting_getbool("3d_leaves") then
minetest.override_item("hyrule_mapgen:magic_leaves", {
	drawtype = "mesh",
	mesh = "leaf.obj",
	tiles = {"hyrule_mapgen_magic_leaves2.png"},
	paramtype = "light",
	light_source = 5,
	drop = {
		max_items = 1,
		items = {
			{items = {'hyrule_mapgen:magic_sapling'}, rarity = 20,},
			{items = {'hyrule_mapgen:magic_leaves'},}
		}
	},
	walkable = false,
	after_place_node = default.after_place_leaves
})
end

minetest.register_node("hyrule_mapgen:canopy_leaves", {
	description = "Canopy Leaves",
	drawtype = "allfaces_optional",
	tiles = {
		"default_leaves.png"
	},
	groups = {snappy=3, flammable=1, leaves=1, oddly_breakable_by_hand = 1, not_in_creative_inventory=1},
	paramtype = "light",
	walkable = false,
	after_place_node = default.after_place_leaves
})

minetest.register_node("hyrule_mapgen:palm_tree", {
	description = "Palm Tree Trunk",
	tiles = {
		"hyrule_mapgen_palm_tree_top.png",
		"hyrule_mapgen_palm_tree_top.png",
		"hyrule_mapgen_palm_tree.png",
		"hyrule_mapgen_palm_tree.png",
		"hyrule_mapgen_palm_tree.png",
		"hyrule_mapgen_palm_tree.png"
	},
	paramtype = "facedir",
	groups = {tree=1, choppy=2, flammable=2, oddly_breakable_by_hand = 1, not_in_creative_inventory=1},
	on_place = minetest.rotate_node
})

minetest.register_node("hyrule_mapgen:palm_leaves", {
	description = "Palm Leaves",
	drawtype = "plantlike",
	tiles = {
		"hyrule_mapgen_palm_leaf.png"
	},
	drop = {
		max_items = 1,
		items = {
			{items = {'hyrule_mapgen:palmsapling'}, rarity = 20,},
			{items = {'hyrule_mapgen:palm_leaves'},}
		}
	},
	inventory_image = "hyrule_mapgen_palm_leaf.png",
	visual_scale = 6,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, leafdecay=3, oddly_breakable_by_hand = 1, leaves=1, not_in_creative_inventory=1},
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
})

minetest.register_node("hyrule_mapgen:coconut", {
	description = "Coconut",
	drawtype = "plantlike",
	tiles = {
		"hyrule_mapgen_coconut.png"
	},
	wield_image = "hyrule_mapgen_coconut.png",
	inventory_image = "hyrule_mapgen_coconut.png",
	groups = {snappy=3, flammable=1, oddly_breakable_by_hand = 1, not_in_creative_inventory=1},
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.3, -0.2, 0.2, 0.3, 0.2}
	},
	on_use = minetest.item_eat(2)
})

minetest.register_node("hyrule_mapgen:wild_tree", {
	description = "Wild Tree Trunk",
	tiles = {
		"hyrule_mapgen_wild_tree_top.png",
		"hyrule_mapgen_wild_tree_top.png",
		"hyrule_mapgen_wild_tree.png",
		"hyrule_mapgen_wild_tree.png",
		"hyrule_mapgen_wild_tree.png",
		"hyrule_mapgen_wild_tree.png"
	},
	paramtype = "facedir",
	groups = {tree=1, choppy=2, oddly_breakable_by_hand = 1, flammable=2,},
	on_place = minetest.rotate_node
})

minetest.register_node("hyrule_mapgen:wild_leaves", {
	description = "Wild Tree Leaves",
	drawtype = "plantlike",
	tiles = {
		"hyrule_mapgen_wild_leaves.png"
	},
	drop = {
		max_items = 1,
		items = {
			{items = {'hyrule_mapgen:wildsapling'}, rarity = 20,},
			{items = {'hyrule_mapgen:wild_leaves'},}
		}
	},
	wield_image = "hyrule_mapgen_wild_leaves.png",
	inventory_image = "hyrule_mapgen_wild_leaves.png",
	groups = {snappy=3, flammable=1, oddly_breakable_by_hand = 1, leafdecay=3, leaves=1,},
	paramtype = "light",
	walkable = false,
	after_place_node = default.after_place_leaves
})

if minetest.setting_getbool("3d_leaves") then
minetest.override_item("hyrule_mapgen:wild_leaves", {
	drawtype = "mesh",
	mesh = "leaf.obj",
	tiles = {"hyrule_mapgen_wild_leaves2.png"},
	paramtype = "light",
	drop = {
		max_items = 1,
		items = {
			{items = {'hyrule_mapgen:wildsapling'}, rarity = 20,},
			{items = {'hyrule_mapgen:wild_leaves'},}
		}
	},
	after_place_node = default.after_place_leaves
})
end

minetest.register_node("hyrule_mapgen:magicsapling", {
	description = "Magic Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"hyrule_mapgen_magic_sapling.png"},
	inventory_image = "hyrule_mapgen_magic_sapling.png",
	wield_image = "hyrule_mapgen_magic_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
})

minetest.register_node("hyrule_mapgen:palmsapling", {
	description = "Palm Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"hyrule_mapgen_palm_sapling.png"},
	inventory_image = "hyrule_mapgen_palm_sapling.png",
	wield_image = "hyrule_mapgen_palm_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
})

minetest.register_node("hyrule_mapgen:bigsapling", {
	description = "Big Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"hyrule_mapgen_big_sapling.png"},
	inventory_image = "hyrule_mapgen_big_sapling.png",
	wield_image = "hyrule_mapgen_big_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
})

minetest.register_node("hyrule_mapgen:wildsapling", {
	description = "Wild Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"hyrule_mapgen_wild_sapling.png"},
	inventory_image = "hyrule_mapgen_wild_sapling.png",
	wield_image = "hyrule_mapgen_wild_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
})

minetest.register_node("hyrule_mapgen:tower_spawner", {
	description = "Tower Monster Spawner",
	drawtype = "airlike",
	walkable = false,
	pointable = false,
	groups = {not_in_creative_inventory=1},
	on_blast = function(pos, intensity)
	end,
	sunlight_propagates = false,
	paramtype = "light",
	buildable_to = true,
	is_ground_content = false,
})

minetest.register_node("hyrule_mapgen:wall_ring", {
	description = "Wall Ring",
	tiles = {
		"default_obsidian.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, 0.25, 0.3125, 0.125, 0.5, 0.5}, -- NodeBox1
			{0.125, 0, 0.375, 0.1875, 0.375, 0.5}, -- NodeBox2
			{-0.125, 0, 0.375, -0.0625, 0.375, 0.5}, -- NodeBox3
			{-0.125, 0, 0.375, 0.1875, 0.0625, 0.5}, -- NodeBox4
		}
	},
	is_ground_content = false,
	sounds = default.node_sound_metal_defaults()
})

minetest.register_node("hyrule_mapgen:barrel", {
	description = "Barrel",
	tiles = {
		"hyrule_mapgen_barrel_top.png",
		"hyrule_mapgen_barrel_top.png",
		"hyrule_mapgen_barrel.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.4, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5625, 0.5}, -- NodeBox2
			{0.375, -0.5, -0.5, 0.5, 0.5625, 0.5}, -- NodeBox3
			{-0.5, -0.5, -0.5, 0.5, 0.5625, -0.375}, -- NodeBox4
			{-0.5, -0.5, 0.375, 0.5, 0.5625, 0.5}, -- NodeBox5
		}
	},
	groups = {choppy=1},
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	on_place = minetest.rotate_node
})

minetest.register_node("hyrule_mapgen:bars", {
	description = "Steel Bars",
	tiles = {
		"default_steel_block.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=7,},
	node_box = {
		type = "fixed",
		fixed = {
			{0.25, -0.5, -0.0625, 0.375, 0.5, 0.0625},
			{-0.375, -0.5, -0.0625, -0.25, 0.5, 0.0625},
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
		}
	},
	is_ground_content = false,
	sounds = default.node_sound_metal_defaults()
})

minetest.register_node("hyrule_mapgen:drain", {
	description = "Floor Drain",
	tiles = {
		"hyrule_mapgen_drain.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = {not_in_creative_inventory=1,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.49, 0.5},
		}
	},
	is_ground_content = false,
})

minetest.register_node("hyrule_mapgen:bones", {
	description = "Bones",
	tiles = {
		"hyrule_mapgen_bones.png",
	},
	inventory_image = "hyrule_mapgen_bones.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = {not_in_creative_inventory=1,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.49, 0.5},
		}
	},
	is_ground_content = false,
})

minetest.register_node("hyrule_mapgen:skull", {
	description = "Skull",
	is_ground_content = false,
	tiles = {
		"hyrule_mapgen_skull_top.png",
		"hyrule_mapgen_skull_top.png",
		"hyrule_mapgen_skull_side.png",
		"hyrule_mapgen_skull_side.png^[transformFX",
		"hyrule_mapgen_skull_back.png",
		"hyrule_mapgen_skull_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=0},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0.125, 0.3125}, -- NodeBox1
		}
	},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("hyrule_mapgen:chain", {
	description = "Wall Chain",
	tiles = {
		"hyrule_mapgen_chain1.png",
	},
	inventory_image = "hyrule_mapgen_chain1.png",
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	groups = {cracky=3, not_in_creative_inventory=1,},
	sounds = default.node_sound_metal_defaults(),
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	}
})

minetest.register_node("hyrule_mapgen:cracks", {
	description = "Wall Cracks",
	tiles = {
		"hyrule_mapgen_cracks.png",
	},
	inventory_image = "hyrule_mapgen_cracks.png",
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	use_texture_alpha = true,
	is_ground_content = false,
	groups = {cracky=1, not_in_creative_inventory=1,},
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = "wallmounted",
	},
	drop = ""
})

minetest.register_node("hyrule_mapgen:painting", {
	description = "Castle Painting",
	tiles = {
		"hyrule_mapgen_painting.png",
	},
	inventory_image = "hyrule_mapgen_painting.png",
	drawtype = "signlike",
	paramtype = "light",
	visual_scale = 2.5,
	paramtype2 = "wallmounted",
	walkable = false,
	is_ground_content = false,
	use_texture_alpha = true,
	groups = {cracky=1, not_in_creative_inventory=1,},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "wallmounted",
	},
})

minetest.register_node("hyrule_mapgen:painting2", {
	description = "Knight Painting",
	tiles = {
		"hyrule_mapgen_painting2.png",
	},
	inventory_image = "hyrule_mapgen_painting2.png",
	drawtype = "signlike",
	paramtype = "light",
	visual_scale = 2.5,
	paramtype2 = "wallmounted",
	walkable = false,
	use_texture_alpha = true,
	groups = {cracky=1, not_in_creative_inventory=1,},
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
})

minetest.register_node("hyrule_mapgen:chain2", {
	description = "Wall Chain 2",
	tiles = {
		"hyrule_mapgen_chain2.png",
	},
	inventory_image = "hyrule_mapgen_chain2.png",
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	groups = {cracky=3, not_in_creative_inventory=1,},
	sounds = default.node_sound_metal_defaults(),
	selection_box = {
		type = "wallmounted",
	},
	is_ground_content = false,
})

minetest.register_node("hyrule_mapgen:floor_light", {
	description = "Floor Light",
	tiles = {
		"hyrule_mapgen_floorlight.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 5,
	paramtype2 = "facedir",
	walkable = false,
	use_texture_alpha = true,
	groups = {not_in_creative_inventory=1,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.49, 0.5},
		}
	},
	is_ground_content = false,
})

minetest.register_node("hyrule_mapgen:floor_light2", {
	description = "Floor Light",
	tiles = {
		"hyrule_mapgen_floorlight2.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 5,
	paramtype2 = "facedir",
	walkable = false,
	use_texture_alpha = true,
	groups = {not_in_creative_inventory=1,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.49, 0.5},
		}
	},
	is_ground_content = false,
})

minetest.register_node("hyrule_mapgen:dungeon_carpet", {
	description = "Dungeon Carpet",
	tiles = {
		"hyrule_mapgen_carpet.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	groups = {cracky=1, not_in_creative_inventory=1,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
		}
	},
	drop = ""
})

if minetest.setting_getbool("lom_devmode") then
minetest.register_node("hyrule_mapgen:tower_toolchest", {
	description = "Tower Toolchest",
	tiles = {
		"default_chest_top.png",
		"default_chest_top.png",
		"default_chest_side.png",
		"default_chest_side.png",
		"default_chest_front.png",
		"default_chest_side.png",
	},
	groups = {cracky=1,},
	drop = "",
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_player_name() ~= "singleplayer" then
			minetest.chat_send_player(clicker:get_player_name(), "Toolchests only work in Singleplayer")
		elseif not minetest.setting_getbool("lom_devmode") then
			minetest.chat_send_player(clicker:get_player_name(), "Requires 'lom_devmode' to be 'true'")
		else
			minetest.remove_node(pos)
			minetest.env:add_item(pos, "hyrule_mapgen:tower_dev")
			minetest.env:add_item(pos, "hyrule_mapgen:lightshaft")
			minetest.env:add_item(pos, "hyrule_mapgen:lightshaft2")
			minetest.env:add_item(pos, "hyrule_mapgen:dungeon_carpet")
			minetest.env:add_item(pos, "hyrule_mapgen:dungeon_trapdoor")
			minetest.env:add_item(pos, "hyrule_mapgen:tower_generator")
			minetest.env:add_item(pos, "hyrule_mapgen:cracks")
			minetest.env:add_item(pos, "hyrule_mapgen:chain")
			minetest.env:add_item(pos, "hyrule_mapgen:chain2")
			minetest.env:add_item(pos, "hyrule_mapgen:fog")
			minetest.env:add_item(pos, "hyrule_mapgen:quartz_table")
			minetest.env:add_item(pos, "hyrule_mapgen:goddess_statue")
			minetest.env:add_item(pos, "hyrule_mapgen:candles")
			minetest.env:add_item(pos, "hyrule_mapgen:bones")
			minetest.env:add_item(pos, "hyrule_mapgen:skull")
			minetest.env:add_item(pos, "hyrule_mapgen:drain")
			minetest.env:add_item(pos, "hyrule_mapgen:floor_light")
			minetest.env:add_item(pos, "hyrule_mapgen:floor_light2")
			minetest.env:add_item(pos, "hyrule_mapgen:bars")
			minetest.env:add_item(pos, "hyrule_mapgen:barrel")
			minetest.env:add_item(pos, "hyrule_mapgen:painting")
			minetest.env:add_item(pos, "hyrule_mapgen:painting2")
			minetest.env:add_item(pos, "quartz:wall_immortal")
			minetest.env:add_item(pos, "quartz:block_immortal")
			minetest.env:add_item(pos, "quartz:pillar_immortal")
		end
	end,
})
end

minetest.register_node("hyrule_mapgen:dungeon_trapdoor", {
	description = "Dungeon Trapdoor",
	tiles = {
		"hyrule_mapgen_trapdoor.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	walkable = true,
	groups = {not_in_creative_inventory=1,},
	on_blast = function(radius, intensity)
	end,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
		}
	},
	drop = "",
	is_ground_content = false,
	on_rightclick = function(pos, node, clicker, itemstack)
		if clicker:get_wielded_item():get_name() == "loot:key" then
			itemstack:take_item()
			minetest.remove_node(pos)
			return itemstack
		end
	end,
})

minetest.register_node("hyrule_mapgen:fog", {
	description = "Fog",
	tiles = {{
		name = "hyrule_mapgen_fog.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.0},
	},
	"hyrule_mapgen_trans.png",
	},
	drawtype = "nodebox",
	is_ground_content = false,
	paramtype = "light",
	light_source = 1,
	walkable = false,
	pointable = false,
	use_texture_alpha = true,
	groups = {cracky=1, not_in_creative_inventory=1,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
		}
	},
	drop = ""
})

minetest.register_node("hyrule_mapgen:quartz_table", {
	description = "Quartz Table",
	tiles = {
		"quartz_wall.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky=4, not_in_creative_inventory=0},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.4375, 0.25, -0.4375, 0.4375, 0.4375, 0.5}, -- NodeBox2
			{0.3125, -0.5, -0.5, 0.5, -0.4375, -0.3125}, -- NodeBox3
			{-0.5, -0.5, -0.5, -0.3125, -0.4375, -0.3125}, -- NodeBox4
			{-0.4375, -0.5, -0.4375, -0.3125, 0.25, -0.3125}, -- NodeBox5
			{0.3125, -0.5, -0.4375, 0.4375, 0.25, -0.3125}, -- NodeBox6
		}
	},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("hyrule_mapgen:candles", {
	description = "Candles",
	tiles = {
		"hyrule_mapgen_candle.png",
	},
	drawtype = "mesh",
	mesh = "candles.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.2, 0.2, -0.2, 0.2},
		}
	},
	groups = {choppy=1, not_in_creative_inventory=0,},
	sounds = default.node_sound_wood_defaults(),
	drop = "xdecor:candle 2",
	is_ground_content = false,
})

minetest.register_node("hyrule_mapgen:goddess_statue", {
	description = "Goddess Statue",
	tiles = {
		"hyrule_mapgen_goddess_statue.png",
	},
	drawtype = "mesh",
	mesh = "goddess_statue.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.2, 0, -0.2, 0.2, 2, 0.2,},
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5,},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.2, 0, -0.2, 0.2, 2, 0.2,},
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5,},
		}
	},
	visual_scale = 0.5,
	is_ground_content = false,
	groups = {cracky=1,},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("hyrule_mapgen:lightshaft", {
	description = "Lightshaft",
	tiles = {
		"hyrule_mapgen_lightshaft.png",
	},
	drawtype = "mesh",
	mesh = "lightshaft.obj",
	use_texture_alpha = true,
	walkable = false,
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0, 0.5, 0.5,},
		}
	},
	visual_scale = 0.5,
	is_ground_content = false,
	light_source = 5,
	groups = {not_in_creative_inventory=1,},
	sounds = default.node_sound_glass_defaults(),
	drop = ""
})

minetest.register_node("hyrule_mapgen:lightshaft2", {
	description = "Lightshaft",
	tiles = {
		"hyrule_mapgen_lightshaft.png",
	},
	drawtype = "mesh",
	mesh = "lightshaft2.obj",
	use_texture_alpha = true,
	walkable = false,
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	visual_scale = 0.5,
	light_source = 5,
	groups = {not_in_creative_inventory=1,},
	climbable = true,
	is_ground_content = false,
	sounds = default.node_sound_glass_defaults(),
	drop = ""
})

minetest.register_node("hyrule_mapgen:double_ladder", {
	description = "Double Ladder",
	tiles = {
	"default_wood.png",
	},
	walkable = true,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.3125, 0.5, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- NodeBox2
			{-0.5, 0.3125, 0.375, 0.5, 0.4375, 0.5}, -- NodeBox3
			{-0.5, 0.0625, 0.375, 0.5, 0.1875, 0.5}, -- NodeBox4
			{-0.5, -0.1875, 0.375, 0.5, -0.0625, 0.5}, -- NodeBox5
			{-0.5, -0.4375, 0.375, 0.5, -0.3125, 0.5}, -- NodeBox6
			{-0.4375, -0.5+1, 0.4375, -0.3125, 0.5+1, 0.5}, -- NodeBox1
			{0.3125, -0.5+1, 0.4375, 0.4375, 0.5+1, 0.5}, -- NodeBox2
			{-0.5, 0.3125+1, 0.375, 0.5, 0.4375+1, 0.5}, -- NodeBox3
			{-0.5, 0.0625+1, 0.375, 0.5, 0.1875+1, 0.5}, -- NodeBox4
			{-0.5, -0.1875+1, 0.375, 0.5, -0.0625+1, 0.5}, -- NodeBox5
			{-0.5, -0.4375+1, 0.375, 0.5, -0.3125+1, 0.5}, -- NodeBox6
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.3125, 0.5, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- NodeBox2
			{-0.5, 0.3125, 0.375, 0.5, 0.4375, 0.5}, -- NodeBox3
			{-0.5, 0.0625, 0.375, 0.5, 0.1875, 0.5}, -- NodeBox4
			{-0.5, -0.1875, 0.375, 0.5, -0.0625, 0.5}, -- NodeBox5
			{-0.5, -0.4375, 0.375, 0.5, -0.3125, 0.5}, -- NodeBox6
			{-0.4375, -0.5+1, 0.4375, -0.3125, 0.5+1, 0.5}, -- NodeBox1
			{0.3125, -0.5+1, 0.4375, 0.4375, 0.5+1, 0.5}, -- NodeBox2
			{-0.5, 0.3125+1, 0.375, 0.5, 0.4375+1, 0.5}, -- NodeBox3
			{-0.5, 0.0625+1, 0.375, 0.5, 0.1875+1, 0.5}, -- NodeBox4
			{-0.5, -0.1875+1, 0.375, 0.5, -0.0625+1, 0.5}, -- NodeBox5
			{-0.5, -0.4375+1, 0.375, 0.5, -0.3125+1, 0.5}, -- NodeBox6
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.4375, -0.3125, 0.5, 0.5}, -- NodeBox1
			{0.3125, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- NodeBox2
			{-0.5, 0.3125, 0.375, 0.5, 0.4375, 0.5}, -- NodeBox3
			{-0.5, 0.0625, 0.375, 0.5, 0.1875, 0.5}, -- NodeBox4
			{-0.5, -0.1875, 0.375, 0.5, -0.0625, 0.5}, -- NodeBox5
			{-0.5, -0.4375, 0.375, 0.5, -0.3125, 0.5}, -- NodeBox6
			{-0.4375, -0.5+1, 0.4375, -0.3125, 0.5+1, 0.5}, -- NodeBox1
			{0.3125, -0.5+1, 0.4375, 0.4375, 0.5+1, 0.5}, -- NodeBox2
			{-0.5, 0.3125+1, 0.375, 0.5, 0.4375+1, 0.5}, -- NodeBox3
			{-0.5, 0.0625+1, 0.375, 0.5, 0.1875+1, 0.5}, -- NodeBox4
			{-0.5, -0.1875+1, 0.375, 0.5, -0.0625+1, 0.5}, -- NodeBox5
			{-0.5, -0.4375+1, 0.375, 0.5, -0.3125+1, 0.5}, -- NodeBox6
		}
	},
	sounds = default.node_sound_wood_defaults(),
	climbable = true,
	is_ground_content = false,
	groups = {choppy=1, not_in_creative_inventory=1},
	drop = "default:ladder_wood 2"
})

minetest.register_node("hyrule_mapgen:tower_dev", {
	description = "Tower Builder Node",
	tiles = {"hyrule_mapgen_dev.png",},
	drawtype = "glasslike",
	walkable = false,
	groups = {cracky=1, not_in_creative_inventory=1},
	on_blast = function(pos, intensity)
	end,
	sunlight_propagates = false,
	is_ground_content = false,
	paramtype = "light",
	on_rightclick = function(pos, node)
		minetest.place_schematic({x=pos.x-15,y=pos.y+3,z=pos.z-15}, minetest.get_modpath("hyrule_mapgen").."/schematics/tower_ground.mts", 0, {}, true)
	end,
})

minetest.register_node("hyrule_mapgen:tower_generator", {
	description = "Tower Generator node",
	tiles = {"hyrule_mapgen_dev.png^[colorize:blue:100",},
	drawtype = "glasslike",
	walkable = false,
	pointable = true,
	groups = {not_in_creative_inventory=1},
	on_blast = function(pos, intensity)
	end,
	drops = "",
	sunlight_propagates = false,
	is_ground_content = false,
	paramtype = "light",
})
