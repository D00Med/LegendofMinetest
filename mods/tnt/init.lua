tnt = {}
-- Default to enabled in singleplayer and disabled in multiplayer
local singleplayer = minetest.is_singleplayer()
local setting = minetest.setting_getbool("enable_tnt")
if (not singleplayer and setting ~= true) or
		(singleplayer and setting == false) then
	return
end

-- loss probabilities array (one in X will be lost)
local loss_prob = {}

loss_prob["default:cobble"] = 3
loss_prob["default:dirt"] = 4

local radius = tonumber(minetest.setting_get("tnt_radius") or 3)

-- Fill a list with data for content IDs, after all nodes are registered
local cid_data = {}
minetest.after(0, function()
	for name, def in pairs(minetest.registered_nodes) do
		cid_data[minetest.get_content_id(name)] = {
			name = name,
			drops = def.drops,
			flammable = def.groups.flammable,
			on_blast = def.on_blast,
		}
	end
end)

local function rand_pos(center, pos, radius)
	local def
	local reg_nodes = minetest.registered_nodes
	local i = 0
	repeat
		-- Give up and use the center if this takes too long
		if i > 4 then
			pos.x, pos.z = center.x, center.z
			break
		end
		pos.x = center.x + math.random(-radius, radius)
		pos.z = center.z + math.random(-radius, radius)
		def = reg_nodes[minetest.get_node(pos).name]
		i = i + 1
	until def and not def.walkable
end

local function eject_drops(drops, pos, radius)
	local drop_pos = vector.new(pos)
	for _, item in pairs(drops) do
		local count = item:get_count()
		while count > 0 do
			local take = math.max(1,math.min(radius * radius,
					count,
					item:get_stack_max()))
			rand_pos(pos, drop_pos, radius)
			local dropitem = ItemStack(item)
			dropitem:set_count(take)
			local obj = minetest.add_item(drop_pos, dropitem)
			if obj then
				obj:get_luaentity().collect = true
				obj:setacceleration({x = 0, y = -10, z = 0})
				obj:setvelocity({x = math.random(-3, 3),
						y = math.random(0, 10),
						z = math.random(-3, 3)})
			end
			count = count - take
		end
	end
end

local function add_drop(drops, item)
	item = ItemStack(item)
	local name = item:get_name()
	if loss_prob[name] ~= nil and math.random(1, loss_prob[name]) == 1 then
		return
	end

	local drop = drops[name]
	if drop == nil then
		drops[name] = item
	else
		drop:set_count(drop:get_count() + item:get_count())
	end
end


local function destroy(drops, npos, cid, c_air, c_fire, on_blast_queue, ignore_protection, ignore_on_blast)
	if not ignore_protection and minetest.is_protected(npos, "") then
		return cid
	end

	local def = cid_data[cid]

	if not def then
		return c_air
	elseif not ignore_on_blast and def.on_blast then
		on_blast_queue[#on_blast_queue + 1] = {pos = vector.new(npos), on_blast = def.on_blast}
		return cid
	elseif def.flammable then
		return c_fire
	else
		local node_drops = minetest.get_node_drops(def.name, "")
		for _, item in ipairs(node_drops) do
			add_drop(drops, item)
		end
		return c_air
	end
end


local function calc_velocity(pos1, pos2, old_vel, power)
	-- Avoid errors caused by a vector of zero length
	if vector.equals(pos1, pos2) then
		return old_vel
	end

	local vel = vector.direction(pos1, pos2)
	vel = vector.normalize(vel)
	vel = vector.multiply(vel, power)

	-- Divide by distance
	local dist = vector.distance(pos1, pos2)
	dist = math.max(dist, 1)
	vel = vector.divide(vel, dist)

	-- Add old velocity
	vel = vector.add(vel, old_vel)

	-- randomize it a bit
	vel = vector.add(vel, {
		x = math.random() - 0.5,
		y = math.random() - 0.5,
		z = math.random() - 0.5,
	})

	-- Limit to terminal velocity
	dist = vector.length(vel)
	if dist > 250 then
		vel = vector.divide(vel, dist / 250)
	end
	return vel
end

local function entity_physics(pos, radius, drops, disable_playerdamage)
	local objs = minetest.get_objects_inside_radius(pos, radius)
	for _, obj in pairs(objs) do
		local obj_pos = obj:getpos()
		local dist = math.max(1, vector.distance(pos, obj_pos))

		local damage = (4 / dist) * radius
		if obj:is_player() and not disable_playerdamage then
			-- currently the engine has no method to set
			-- player velocity. See #2960
			-- instead, we knock the player back 1.0 node, and slightly upwards
			local dir = vector.normalize(vector.subtract(obj_pos, pos))
			local moveoff = vector.multiply(dir, dist + 1.0)
			local newpos = vector.add(pos, moveoff)
			local newpos = vector.add(newpos, {x = 0, y = 0.2, z = 0})
			obj:setpos(newpos)

			obj:set_hp(obj:get_hp() - damage)
		elseif not obj:is_player() then
			local do_damage = true
			local do_knockback = true
			local entity_drops = {}
			local luaobj = obj:get_luaentity()
			local objdef = minetest.registered_entities[luaobj.name]

			if objdef and objdef.on_blast then
				do_damage, do_knockback, entity_drops = objdef.on_blast(luaobj, damage)
			end

			if do_knockback then
				local obj_vel = obj:getvelocity()
				obj:setvelocity(calc_velocity(pos, obj_pos,
						obj_vel, radius * 10))
			end
			if do_damage then
				if not obj:get_armor_groups().immortal then
					obj:punch(obj, 1.0, {
						full_punch_interval = 1.0,
						damage_groups = {fleshy = damage},
					}, nil)
				end
			end
			for _, item in ipairs(entity_drops) do
				add_drop(drops, item)
			end
		end
	end
end

local function add_effects(pos, radius, drops)
	minetest.add_particle({
		pos = pos,
		velocity = vector.new(),
		acceleration = vector.new(),
		expirationtime = 0.4,
		size = radius * 10,
		collisiondetection = false,
		vertical = false,
		texture = "tnt_boom.png",
	})
	minetest.add_particlespawner({
		amount = 64,
		time = 0.5,
		minpos = vector.subtract(pos, radius / 2),
		maxpos = vector.add(pos, radius / 2),
		minvel = {x = -10, y = -10, z = -10},
		maxvel = {x = 10, y = 10, z = 10},
		minacc = vector.new(),
		maxacc = vector.new(),
		minexptime = 1,
		maxexptime = 2.5,
		minsize = radius * 3,
		maxsize = radius * 5,
		texture = "tnt_smoke.png",
	})

	-- we just dropped some items. Look at the items entities and pick
	-- one of them to use as texture
	local texture = "tnt_blast.png" --fallback texture
	local most = 0
	for name, stack in pairs(drops) do
		local count = stack:get_count()
		if count > most then
			most = count
			local def = minetest.registered_nodes[name]
			if def and def.tiles and def.tiles[1] then
				texture = def.tiles[1]
			end
		end
	end

	minetest.add_particlespawner({
		amount = 64,
		time = 0.1,
		minpos = vector.subtract(pos, radius / 2),
		maxpos = vector.add(pos, radius / 2),
		minvel = {x = -3, y = 0, z = -3},
		maxvel = {x = 3, y = 5,  z = 3},
		minacc = {x = 0, y = -10, z = 0},
		maxacc = {x = 0, y = -10, z = 0},
		minexptime = 0.8,
		maxexptime = 2.0,
		minsize = radius * 0.66,
		maxsize = radius * 2,
		texture = texture,
		collisiondetection = true,
	})
end

function tnt.burn(pos)
	local name = minetest.get_node(pos).name
	local group = minetest.get_item_group(name, "tnt")
	if group > 0 then
		minetest.sound_play("tnt_ignite", {pos = pos})
		minetest.set_node(pos, {name = name .. "_burning"})
		minetest.get_node_timer(pos):start(1)
	elseif name == "tnt:gunpowder" then
		minetest.set_node(pos, {name = "tnt:gunpowder_burning"})
	end
end

local function tnt_explode(pos, radius, ignore_protection, ignore_on_blast)
	local pos = vector.round(pos)
	-- scan for adjacent TNT nodes first, and enlarge the explosion
	local vm1 = VoxelManip()
	local p1 = vector.subtract(pos, 2)
	local p2 = vector.add(pos, 2)
	local minp, maxp = vm1:read_from_map(p1, p2)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm1:get_data()
	local count = 0
	local c_tnt = minetest.get_content_id("tnt:tnt")
	local c_tnt_burning = minetest.get_content_id("tnt:tnt_burning")
	local c_tnt_boom = minetest.get_content_id("tnt:boom")
	local c_air = minetest.get_content_id("air")

	for z = pos.z - 2, pos.z + 2 do
	for y = pos.y - 2, pos.y + 2 do
		local vi = a:index(pos.x - 2, y, z)
		for x = pos.x - 2, pos.x + 2 do
			local cid = data[vi]
			if cid == c_tnt or cid == c_tnt_boom or cid == c_tnt_burning then
				count = count + 1
				data[vi] = c_air
			end
			vi = vi + 1
		end
	end
	end

	vm1:set_data(data)
	vm1:write_to_map()

	-- recalculate new radius
	radius = math.floor(radius * math.pow(count, 1/3))

	-- perform the explosion
	local vm = VoxelManip()
	local pr = PseudoRandom(os.time())
	local p1 = vector.subtract(pos, radius)
	local p2 = vector.add(pos, radius)
	local minp, maxp = vm:read_from_map(p1, p2)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	local drops = {}
	local on_blast_queue = {}

	local c_fire = minetest.get_content_id("fire:basic_flame")
	for z = -radius, radius do
	for y = -radius, radius do
	local vi = a:index(pos.x + (-radius), pos.y + y, pos.z + z)
	for x = -radius, radius do
		local r = vector.length(vector.new(x, y, z))
		if (radius * radius) / (r * r) >= (pr:next(80, 125) / 100) then
			local cid = data[vi]
			local p = {x = pos.x + x, y = pos.y + y, z = pos.z + z}
			if cid ~= c_air then
				data[vi] = destroy(drops, p, cid, c_air, c_fire,
					on_blast_queue, ignore_protection,
					ignore_on_blast)
			end
		end
		vi = vi + 1
	end
	end
	end

	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
	vm:update_liquids()

	-- call nodeupdate for everything within 1.5x blast radius
	for z = -radius * 1.5, radius * 1.5 do
	for x = -radius * 1.5, radius * 1.5 do
	for y = -radius * 1.5, radius * 1.5 do
		local s = vector.add(pos, {x = x, y = y, z = z})
		local r = vector.distance(pos, s)
		if r / radius < 1.4 then
			nodeupdate(s)
		end
	end
	end
	end

	for _, data in ipairs(on_blast_queue) do
		local dist = math.max(1, vector.distance(data.pos, pos))
		local intensity = (radius * radius) / (dist * dist)
		local node_drops = data.on_blast(data.pos, intensity)
		if node_drops then
			for _, item in ipairs(node_drops) do
				add_drop(drops, item)
			end
		end
	end

	return drops, radius
end

function tnt.boom(pos, def)
	local disable_playerdamage = def.disable_playerdamage or false
	minetest.sound_play("tnt_explode", {pos = pos, gain = 1.2, max_hear_distance = 2*64})
	minetest.set_node(pos, {name = "tnt:boom"})
	local drops, radius = tnt_explode(pos, def.radius, def.ignore_protection,
			def.ignore_on_blast)
	-- append entity drops
	local damage_radius = (radius / def.radius) * def.damage_radius
	entity_physics(pos, damage_radius, drops, disable_playerdamage)
	if not def.disable_drops then
		eject_drops(drops, pos, radius)
	end
	add_effects(pos, radius, drops)
end

minetest.register_node("tnt:boom", {
	drawtype = "airlike",
	light_source = default.LIGHT_MAX,
	walkable = false,
	drop = "",
	groups = {dig_immediate = 3},
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(0.4)
	end,
	on_timer = function(pos, elapsed)
		minetest.remove_node(pos)
	end,
	-- unaffected by explosions
	on_blast = function() end,
})

minetest.register_node("tnt:gunpowder", {
	description = "Gun Powder",
	drawtype = "raillike",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	tiles = {"tnt_gunpowder_straight.png", "tnt_gunpowder_curved.png", "tnt_gunpowder_t_junction.png", "tnt_gunpowder_crossing.png"},
	inventory_image = "tnt_gunpowder_inventory.png",
	wield_image = "tnt_gunpowder_inventory.png",
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {dig_immediate = 2, attached_node = 1, connect_to_raillike = minetest.raillike_group("gunpowder")},
	sounds = default.node_sound_leaves_defaults(),

	on_punch = function(pos, node, puncher)
		if puncher:get_wielded_item():get_name() == "default:torch" then
			tnt.burn(pos)
		end
	end,
	on_blast = function(pos, intensity)
		tnt.burn(pos)
	end,
})

minetest.register_node("tnt:gunpowder_burning", {
	drawtype = "raillike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 5,
	tiles = {{
		name = "tnt_gunpowder_burning_straight_animated.png",
		animation = {
			type = "vertical_frames",
			aspect_w = 16,
			aspect_h = 16,
			length = 1,
		}
	},
	{
		name = "tnt_gunpowder_burning_curved_animated.png",
		animation = {
			type = "vertical_frames",
			aspect_w = 16,
			aspect_h = 16,
			length = 1,
		}
	},
	{
		name = "tnt_gunpowder_burning_t_junction_animated.png",
		animation = {
			type = "vertical_frames",
			aspect_w = 16,
			aspect_h = 16,
			length = 1,
		}
	},
	{
		name = "tnt_gunpowder_burning_crossing_animated.png",
		animation = {
			type = "vertical_frames",
			aspect_w = 16,
			aspect_h = 16,
			length = 1,
		}
	}},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	drop = "",
	groups = {dig_immediate = 2, attached_node = 1, connect_to_raillike = minetest.raillike_group("gunpowder")},
	sounds = default.node_sound_leaves_defaults(),
	on_timer = function(pos, elapsed)
		for dx = -1, 1 do
		for dz = -1, 1 do
		for dy = -1, 1 do
			if not (dx == 0 and dz == 0) then
				tnt.burn({
					x = pos.x + dx,
					y = pos.y + dy,
					z = pos.z + dz,
				})
			end
		end
		end
		end
		minetest.remove_node(pos)
	end,
	-- unaffected by explosions
	on_blast = function() end,
	on_construct = function(pos)
		minetest.sound_play("tnt_gunpowder_burning", {pos = pos, gain = 2})
		minetest.get_node_timer(pos):start(1)
	end,
})

minetest.register_abm({
	nodenames = {"group:tnt", "tnt:gunpowder"},
	neighbors = {"fire:basic_flame", "default:lava_source", "default:lava_flowing"},
	interval = 4,
	chance = 1,
	action = tnt.burn,
})

minetest.register_craft({
	output = "tnt:gunpowder",
	type = "shapeless",
	recipe = {"default:coal_lump", "default:gravel"}
})

minetest.register_craft({
	output = "tnt:tnt",
	recipe = {
		{"", "group:wood",    ""},
		{"group:wood", "tnt:gunpowder", "group:wood"},
		{"", "group:wood",    ""}
	}
})

minetest.register_entity("tnt:tnt_object", {
	visual = "mesh",
	mesh = "hyruletools_bomb.b3d",
	textures = {"hyruletools_bomb.png",},
	visual_size = {x=10, y=10},
	collision_box = {-0.1, 0, -0.1, 0.1, 0.2, 0.1},
	hp_max = 1000,
	physical = true,
	on_activate = function(self)
		minetest.after(3, function()
			if self.object ~= nil then
			local pos = self.object:getpos()
			local node = minetest.find_node_near(pos, 1, {"default:water_source", "default:water_flowing", "default:river_water_source", "default:river_water_flowing"})
			if node and not self.waterproof then
			minetest.add_particlespawner({
				amount = 5,
				time = 0.2,
				minpos = {x=pos.x-0.4, y=pos.y+0.1, z=pos.z-0.4},
				maxpos = {x=pos.x+0.4, y=pos.y+0.5, z=pos.z+0.4},
				minvel = {x=-0.5, y=0.5, z=0.5},
				maxvel = {x=1, y=1, z=1},
				minacc = {x=-0.2, y=1, z=-0.2},
				maxacc = {x=0.2, y=1, z=0.2},
				minexptime = 0.5,
				maxexptime = 1,
				minsize = 1,
				maxsize = 2,
				collisiondetection = false,
				texture = "bubble.png"
			})
			self.object:remove()
			elseif not node or self.waterproof then
			tnt.boom(pos, {damage_radius=3, radius=3})
			self.object:remove()
			if self.waterproof then
			minetest.add_particlespawner({
				amount = 5,
				time = 0.2,
				minpos = {x=pos.x-0.4, y=pos.y+0.1, z=pos.z-0.4},
				maxpos = {x=pos.x+0.4, y=pos.y+0.5, z=pos.z+0.4},
				minvel = {x=-0.5, y=0.5, z=0.5},
				maxvel = {x=1, y=1, z=1},
				minacc = {x=-0.2, y=1, z=-0.2},
				maxacc = {x=0.2, y=1, z=0.2},
				minexptime = 0.5,
				maxexptime = 1,
				minsize = 1,
				maxsize = 2,
				collisiondetection = false,
				texture = "bubble.png"
			})
			end
			end
			end
		end)
	end,
	on_step = function(self)
		local velo = self.object:getvelocity()
		if velo ~= nil then
		self.object:setvelocity({x=velo.x*0.95, y=velo.y, z=velo.z*0.95})
		end
		local pos = self.object:getpos()
		if pos ~= nil then
		minetest.add_particlespawner({
			amount = 2,
			time = 0.2,
			minpos = {x=pos.x, y=pos.y+0.4, z=pos.z},
			maxpos = {x=pos.x, y=pos.y+0.5, z=pos.z},
			minvel = {x=-0.5, y=-0.5, z=0.5},
			maxvel = {x=1, y=1, z=1},
			minacc = {x=-0.2, y=0, z=-0.2},
			maxacc = {x=0.2, y=0, z=0.2},
			minexptime = 0.5,
			maxexptime = 1,
			minsize = 1,
			maxsize = 2,
			collisiondetection = false,
			texture = "hyruletools_yellowstar.png"
		})
		end
	end,
})

function tnt.register_tnt(def)
	local name = ""
	if not def.name:find(':') then
		name = "tnt:" .. def.name
	else
		name = def.name
		def.name = def.name:match(":([%w_]+)")
	end
	if not def.tiles then def.tiles = {} end
	local tnt_top = def.tiles.top or def.name .. "_top.png"
	local tnt_bottom = def.tiles.bottom or def.name .. "_bottom.png"
	local tnt_side = def.tiles.side or def.name .. "_side.png"
	local tnt_burning = def.tiles.burning or def.name .. "_top_burning_animated.png"
	if not def.damage_radius then def.damage_radius = def.radius * 2 end

	minetest.register_node(":" .. name, {
		description = def.description,
		drawtype = def.drawtype,
		mesh = def.mesh,
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {dig_immediate = 2, mesecon = 2, tnt = 1},
		sounds = default.node_sound_wood_defaults(),
		on_construct = def.on_construct or nil,
		on_rightclick = def.on_rightclick or nil,
		on_punch = function(pos, node, puncher)
			if puncher:get_wielded_item():get_name() == "default:torch" then
				minetest.set_node(pos, {name = name .. "_burning"})
			end
		end,
		on_use = function(item, clicker)
			if clicker:get_wielded_item():get_name() == "tnt:tnt" then
			local pos = clicker:getpos()
			local dir = clicker:get_look_dir()
			local obj = minetest.env:add_entity({x=pos.x+dir.x*1, y=pos.y+1, z=pos.z+dir.z*1}, "tnt:tnt_object")
			obj:setvelocity({x=dir.x*8, y=dir.y*13, z=dir.z*8})
			obj:setacceleration({x=0, y=-12, z=0})
			item:take_item()
			return item
			end
		end,
		selection_box = def.selection_box,
		collision_box = def.selection_box,
		on_blast = function(pos, intensity)
			minetest.after(0.1, function()
				tnt.boom(pos, def)
			end)
		end,
		mesecons = {effector =
			{action_on =
				function(pos)
					tnt.boom(pos, def)
				end
			}
		},
	})

	minetest.register_node(":" .. name .. "_burning", {
		drawtype = def.drawtype,
		mesh = def.mesh,
		tiles = def.tiles,
		light_source = 5,
		paramtype = "light",
		drop = "",
		sounds = default.node_sound_wood_defaults(),
		groups = {falling_node = 1},
		on_timer = function(pos, elapsed)			
			local node = minetest.find_node_near(pos, 1, {"default:water_source", "default:water_flowing", "default:river_water_source", "default:river_water_flowing"})
			local name = minetest.get_node(pos).name
			if node and minetest.get_item_group(name, "waterproof") < 1 then
			minetest.add_particlespawner({
				amount = 5,
				time = 0.2,
				minpos = {x=pos.x-0.4, y=pos.y+0.1, z=pos.z-0.4},
				maxpos = {x=pos.x+0.4, y=pos.y+0.5, z=pos.z+0.4},
				minvel = {x=-0.5, y=0.5, z=0.5},
				maxvel = {x=1, y=1, z=1},
				minacc = {x=-0.2, y=1, z=-0.2},
				maxacc = {x=0.2, y=1, z=0.2},
				minexptime = 0.5,
				maxexptime = 1,
				minsize = 1,
				maxsize = 2,
				collisiondetection = false,
				texture = "bubble.png"
			})
			minetest.set_node(pos, {name="air"})
			elseif not node or minetest.get_item_group(name, "waterproof") > 0 then
			tnt.boom(pos, def)
			end
		end,
		-- unaffected by explosions
		on_blast = function() end,
		on_construct = function(pos)
			minetest.sound_play("tnt_ignite", {pos = pos})
			minetest.get_node_timer(pos):start(4)
			nodeupdate(pos)
		end,
	})
end

minetest.register_abm({
	nodenames = {"tnt:tnt_burning"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.add_particlespawner({
			amount = 10,
			time = 1,
			minpos = {x=pos.x, y=pos.y+0.4, z=pos.z},
			maxpos = {x=pos.x, y=pos.y+0.5, z=pos.z},
			minvel = {x=-0.5, y=-0.5, z=0.5},
			maxvel = {x=1, y=1, z=1},
			minacc = {x=-0.2, y=0, z=-0.2},
			maxacc = {x=0.2, y=0, z=0.2},
			minexptime = 0.5,
			maxexptime = 1,
			minsize = 1,
			maxsize = 2,
			collisiondetection = false,
			texture = "hyruletools_yellowstar.png"
		})
	end
})

tnt.register_tnt({
	name = "tnt:tnt",
	description = "Bomb",
	drawtype = "mesh",
	mesh = "hyruletools_bomb.b3d",
	tiles = {
		"hyruletools_bomb.png",
	},
	collision_box = {
	type = "fixed",
	fixed = { -0.3, -0.5, -0.3, 0.3, 0.2, 0.3 }
	},
	selection_box = {
	type = "fixed",
	fixed = { -0.3, -0.5, -0.3, 0.3, 0.2, 0.3 }
	},
	radius = radius,
})

