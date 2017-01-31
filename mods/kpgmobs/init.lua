
minetest.register_craftitem("kpgmobs:saddle", {
	description = "Saddle",
	inventory_image = "mobs_saddle.png",
})

minetest.register_craft({
	output = "kpgmobs:saddle",
	recipe = {
		{'mobs:leather', 'mobs:leather', 'mobs:leather'},
		{'mobs:leather', 'default:steel_ingot', 'mobs:leather'},
		{'mobs:leather', 'default:steel_ingot', 'mobs:leather'},
	}
})

mobs:register_mob("kpgmobs:horse", {
	type = "animal",
	hp_min = 5,
	hp_max = 10,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	textures = {
		{"mobs_horse.png"},
	},
	visual = "mesh",
	mesh = "mobs_horse.x",
	makes_footstep_sound = true,
	walk_velocity = 1,
	stepheight = 1.5,
	armor = 200,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		stand_start = 25,		stand_end = 75,
		walk_start = 75,		walk_end = 100,
	},
	follow = "farming:wheat",
	view_range = 5,
	on_rightclick = function(self, clicker)
				
		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		local item = clicker:get_wielded_item():get_name()
		local inv = clicker:get_inventory()

		if self.driver and clicker == self.driver then
		if inv:room_for_item("main", {name = "kpgmobs:saddle"}) then
				clicker:get_inventory():add_item("main", "kpgmobs:saddle")
		else
			local pos = self.object:getpos()
			minetest.env:add_item(pos, "kpgmobs:saddle")
		end
		object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver and self.tamed then
		if item == "kpgmobs:saddle" then
		inv:remove_item("main", "kpgmobs:saddle")
		object_attach(self, clicker, {x=0, y=19, z=0}, true, {x=0, y=6, z=0})
		end
		end
	end,
	do_custom = function(self, dtime)
	if self.driver then
		object_drive(self, dtime, {
			speed = 13,
			decell = 0.5,
			moving_anim = {x=75, y=100},
			stand_anim = {x=25, y=25},
			jump_type = "jump",
			jump_anim = {x=50, y=75},
			extra_yaw = 0
		})
		if self.state ~= "stand" then
		self.state = "stand"
		end
		return false
		end
		return true
	end,
})
mobs:register_spawn("kpgmobs:horse", {"default:dirt_with_grass"}, 20, 8, 11000, 1, 31000)

-- wild horse spawn eggs
mobs:register_egg("kpgmobs:horse", "Brown Horse", "mobs_horse_inv.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "kpgmobs loaded")
end
