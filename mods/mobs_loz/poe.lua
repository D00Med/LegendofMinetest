
mobs:register_mob("mobs_loz:poe", {
	type = "monster",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 12,
	hp_max = 22,
	armor = 110,
	collisionbox = {-0.3, 0, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "poe.b3d",
	textures = {
		{"mobs_poe.png"},
		{"mobs_poe2.png"},
		{"mobs_poe3.png"},
	},
	visual_size = {x=1.2, y=1.2},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 2,
	fall_speed = 0,
	fly = true,
	fly_in = "air",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 1,
	view_range = 10,
	drops = {
		{name = "hyruletools:lantern",
		chance = 5, min = 1, max = 1},
	},
	do_custom = function(self, dtime)
	if math.random(1,1000) ~= 1 then return end
	mobs_loz.speech(self, mobs_loz.mob_text)
	end,
	on_die = function(self)
		local pos = self.object:getpos()
		minetest.env:add_entity(pos, "experience:orb")
		if math.random(1,5) == 5 then 
			minetest.set_node(pos, {name="mobs_loz:soul"})
		end
	end,
	animation = {
	speed_normal = 12,
	speed_run = 12,
	walk_start = 1,
	walk_end = 20,
	punch_start = 20,
	punch_end = 40,
	},
})

mobs:register_egg("mobs_loz:poe", "Poe", "mobs_poe_soul.png", 1)

minetest.register_node("mobs_loz:soul", {
	description = "Poe soul",
	inventory_image = "mobs_poe_soul.png",
	wield_image = "mobs_poe_soul.png",
	drawtype = "plantlike",
	tiles = {{
		name = "mobs_poe_soul_anim.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.00},
	}},
	paramtype = "light",
	light_source = 9,
	selection_box = {
	type = "fixed",
	fixed = {-0.2,-0.2,-0.2,0.2,0.2,0.2},
	},
	groups = {cracky=1, oddly_breakeable_by_hand=1, dig_immediate=3},
	use_texture_alpha = true,
	walkable = false,
	drop = "",
	on_destruct = function(pos, oldnode)
		minetest.add_item(pos, "mobs_loz:soul")
	end,
})

minetest.register_abm({
	nodenames = {"mobs_loz:soul"},
	interval = 0.5,
	chance = 1,
	action = function(pos, node)
		local p = pos
		local daytime = minetest.get_timeofday()
		if daytime >= 6000/24000 and daytime <= 17000/24000 then 
		minetest.remove_node(pos)
		end
		for i=1,8 do
		minetest.after(i/10, function()
		if p == nil then return end
		minetest.add_particle({
			pos = {x=p.x+(math.random(-8,8)/100), y=p.y+(math.random(-8,8)/100), z=p.z+(math.random(-8,8)/100)},
			velocity = {x=0, y=0.5, z=0},
			acceleration = {x=0, y=1, z=0},
			expirationtime = 0.8,
			size = 1,
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "mobs_soul_glow.png",
			animation = {type = "vertical_frames", aspect_w = 1, aspect_h = 1, length = 0.8},
			glow = 14
		})
		end)
		end
	end,
})

minetest.register_craft({
	output = 'bucket:bucket_empty',
	recipe = {
		{'', '', ''},
		{'mobs_loz:soul', '', 'mobs_loz:soul'},
		{'', 'mobs_loz:soul', ''},
	}
})