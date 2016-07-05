--lavabiome by D00Med, specific materials for legendofminetest subgame

-- GENERATED CODE
-- Node Box Editor, version 0.8.1 - Glass
-- Namespace: test

minetest.register_node("lavabiome:geyser", {
	description = "geyser",
	tiles = {
		"lavabiome_geyser_top.png",
		"lavabiome_geyser_side.png",
		"lavabiome_geyser_side.png",
		"lavabiome_geyser_side.png",
		"lavabiome_geyser_side.png",
		"lavabiome_geyser_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {crumbly=2},
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

--end of generated code

minetest.register_abm({
	nodenames = {"lavabiome:geyser"},
	interval = 0.5,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 30,
			time = 4,
			minpos = {x=pos.x-0.2, y=pos.y, z=pos.z-0.2},
			maxpos = {x=pos.x+0.2, y=pos.y+1, z=pos.z+0.2},
			minvel = {x=-0.1, y=1, z=-0.1},
			maxvel = {x=0.1, y=2, z=0.1},
			minacc = {x=0, y=-0.5, z=0},
			maxacc = {x=0, y=-1, z=0},
			minexptime = 1,
			maxexptime = 2,
			minsize = 3,
			maxsize = 5,
			collisiondetection = false,
			texture = "lavabiome_spark.png"
		})
	end
})


minetest.register_node("lavabiome:dirt", {
	description = "burnt_dirt",
	tiles = {
		"lavabiome_dirt.png"
	},
	paramtype = "light",
	groups = {crumbly=1}
})
