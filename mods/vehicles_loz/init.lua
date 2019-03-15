local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

--load api
dofile(minetest.get_modpath("vehicles").."/api.lua")

--register vehicles

minetest.register_entity("vehicles:horse", {
	visual = "mesh",
	mesh = "horse.x",
	textures = {"vehicles_horse.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 1.5,
	hp_max = 200,
	physical = true,
	collisionbox = {-0.5, 0, -0.5, 0.5, 1.3, 0.5},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=8, z=0}, true, {x=0, y=4, z=0})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 13,
			decell = 0.5,
			moving_anim = {x=75, y=100},
			stand_anim = {x=25, y=25},
			jump_type = "jump",
			jump_anim = {x=25, y=50},
			extra_yaw = 1.57,
			handling = {initial=2, braking=3}
		})
	end,
})

--register_vehicle_spawner("vehicles:horse", "Horse", "vehicles_horse_inv.png")

minetest.register_entity("vehicles:wooden_boat", {
	visual = "mesh",
	mesh = "boats_boat.obj",
	textures = {"default_wood.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 0,
	hp_max = 200,
	physical = true,
	collisionbox = {-0.5, -0.4, -0.5, 0.5, 0.3, 0.5},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=12, z=-5}, true, {x=0, y=1, z=1})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 6, 
			decell = 0.85,
			is_watercraft = true,
			gravity = 0,
			boost = true,
			boost_duration = 10,
			boost_effect = "vehicles_splash.png",
			brakes = false,
			braking_effect = "vehicles_splash.png",
			handling = {initial=3, braking=1.8}
		})
	end,
})

vehicles.register_spawner("vehicles:wooden_boat", S("Wooden Boat"), "boats_inventory.png", true)

minetest.register_craft({
	output = "vehicles:wooden_boat_spawner",
	recipe = {
		{"",           "",           ""          },
		{"group:wood", "",           "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	},
})


minetest.register_entity("vehicles:ship", {
	visual = "mesh",
	mesh = "ship.b3d",
	textures = {"vehicles_ship.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 0,
	hp_max = 200,
	physical = true,
	collisionbox = {-1, 0.4, -1, 1.3, 1, 1},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=20, z=4}, true, {x=0, y=5, z=4})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 12, 
			decell = 0.85,
			is_watercraft = true,
			gravity = 0,
			boost = true,
			boost_duration = 10,
			boost_effect = "vehicles_splash.png",
			brakes = true,
			braking_effect = "vehicles_splash.png",
			handling = {initial=1, braking=1.8}
		})
	end,
})

vehicles.register_spawner("vehicles:ship", S("Sail Boat"), "vehicles_ship_inv.png", true)

minetest.register_craft( {
	output = "vehicles:ship_spawner 1",
	recipe = {
		{ "wool:white", "wool:white", "" },
		{ "default:acacia_wood", "hyrule_mapgen:crystal_1", "default:acacia_wood" },
		{ "default:acacia_wood", "default:acacia_wood", "default:acacia_wood" }
	}
})

minetest.register_entity("vehicles:spinner", {
	visual = "mesh",
	mesh = "spinner.b3d",
	textures = {"vehicles_spinner.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 1.5,
	hp_max = 200,
	physical = true,
	collisionbox = {-0.4, -0.2, -0.4, 0.4, 0.3, 0.4},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		vehicles.object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		vehicles.object_attach(self, clicker, {x=0, y=10, z=0}, true, {x=0, y=2, z=0})
		end
	end,
	on_punch = vehicles.on_punch,
	on_step = function(self, dtime)
		return vehicles.on_step(self, dtime, {
			speed = 11, 
			decell = 0.6,
			moving_anim = {x=3, y=18},
			stand_anim = {x=1, y=1},
			jump_type = "jump",
			jump_anim = {x=3, y=18},
			brakes = false,
			braking_effect = "hyrule_mapgen_trans.png",
			handling = {initial=3, braking=3}
		})
	end,
})

vehicles.register_spawner("vehicles:spinner", "Spinner", "vehicles_spinner_inv.png")