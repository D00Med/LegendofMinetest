--This is built off cave realms
-- Parameters
caverealms = {}
hell = {}
hell.sky_color_timer = 0
hell.player_teleporting = {}
-- -0.5 massive lava sea and lots of space
-- 0 for huge caves
-- 0.5 for smaller caves
local TCAVE = 0

local BLEND = 128 -- Cave blend distance near YMIN, YMAX

--local DM_TOP = caverealms.config.dm_top -- -4000 --level at which Dungeon Master Realms start to appear
--local DM_BOT = caverealms.config.dm_bot -- -5000 --level at which "" ends
--local DEEP_CAVE = caverealms.config.deep_cave -- -7000 --level at which deep cave biomes take over

-- 3D noise for caves

local np_cave = {
	offset = 0,
	scale = 1,
	spread = {x=512, y=256, z=512}, -- squashed 2:1
	seed = 59033,
	octaves = 6,
	persist = 0.63
}


-- Stuff


local YMAX = -20000
local YMIN = -30000
local lava_level = -25000

local yblmin = YMIN + BLEND * 1.5
local yblmax = YMAX - BLEND * 1.5

minetest.register_on_generated(function(minp, maxp, seed)
	--if out of range of caverealms limits
	if minp.y > YMAX or maxp.y < YMIN then
		return --quit; otherwise, you'd have stalagmites all over the place
	end

	--easy reference to commonly used values
	local t1 = os.clock()
	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z
	
	print ("Hell generated at ("..x0.." "..y0.." "..z0..")") --tell people you are generating a chunk
	
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()
	
	--grab content IDs
	local c_air = minetest.get_content_id("air")
	local c_lava = minetest.get_content_id("default:lava_source")
	local c_soul_stone = minetest.get_content_id("hyrule_mapgen:subrosian_sand")
	
	--mandatory values
	local sidelen = x1 - x0 + 1 --length of a mapblock
	local chulens = {x=sidelen, y=sidelen, z=sidelen} --table of chunk edges
	local chulens2D = {x=sidelen, y=sidelen, z=1}
	local minposxyz = {x=x0, y=y0, z=z0} --bottom corner
	
	local nvals_cave = minetest.get_perlin_map(np_cave, chulens):get3dMap_flat(minposxyz) --cave noise for structure
	
	local nixyz = 1 --3D node index
	
	--generate lava check
	local lava_generation = false
	if maxp.y < lava_level then
		lava_generation = true
	end
	
	for z = z0, z1 do -- for each xy plane progressing northwards
		--structure loop
		for y = y0, y1 do -- for each x row progressing upwards		
			local vi = area:index(x0, y, z) --current node index
			--print(nvals_cave[nixyz]*10000, tcave)
			for x = x0, x1 do --Times 10000 for massive caves
				--print(nvals_cave[nixyz])
				if nvals_cave[nixyz] > TCAVE then --if node falls within cave threshold
					--if below lava level then generate lava
					if lava_generation == true then
						data[vi] = c_lava
					else
						data[vi] = c_air --hollow it out to make the cave
					end
				else
					--create cave structure
					data[vi] = c_soul_stone
				end
				--increment indices
				nixyz = nixyz + 1
				vi = vi + 1
			end
		end
	end
	
	--send data back to voxelmanip
	
	vm:set_data(data)
	
	--calc lighting
	--vm:set_lighting({day=1, night=0})
	--vm:calc_lighting()
	--generate ores
	minetest.generate_ores(vm, minp, maxp)
	--minetest.generate_decorations(vm, minp, maxp)
	--write it to world
	vm:write_to_map(data)
	vm:update_map()
	
	local chugent = math.ceil((os.clock() - t1) * 1000) --grab how long it took
	print ("Hell generated chunk in "..chugent.." ms") --tell people how long
end)

--the player's default sky color
minetest.register_on_joinplayer(function(player)
	local pos = player:getpos().y
	if pos < YMAX and pos > YMIN then
		print("set player to hell color")
		player:set_sky({r=66, g=0, b=0},"plain",{})
	end
end)

--this changes the player's sky color to red
minetest.register_globalstep(function(dtime)
	hell.sky_color_timer = hell.sky_color_timer + dtime
	if hell.sky_color_timer >= 10 then
		for i, player in pairs(minetest.get_connected_players()) do
			local pos = player:getpos().y
			if pos < YMAX and pos > YMIN then
				print("set player to hell color")
				player:set_sky({r=66, g=0, b=0},"plain",{})
			else
				--if not in hell, change back to default sky
				player:set_sky({r=0, g=0, b=0},"regular",{})
			end
		end
		hell.sky_color_timer = 0
	end
end)



minetest.register_lbm({
	name = "hell:geysers",
	nodenames = {"hyrule_mapgen:subrosian_sand"},
	action = function(pos, node)
		if pos.y < YMAX and pos.y > YMIN and math.random(1,500) == 1 and minetest.find_node_near(pos, 1, {"air"}) and not minetest.find_node_near(pos, 5, {"hyrule_mapgen:geyser"}) then
			minetest.set_node(pos, {name = "hyrule_mapgen:geyser"})
		end
	end,
})

--remove water when spawned in hell
minetest.register_lbm({
	name = "hell:water_removal",
	nodenames = {"default:water_source", "default:water_flowing"},
	action = function(pos, node)
		if pos.y < YMAX and pos.y > YMIN then
			minetest.set_node(pos, {name = "air"})
		end
	end,
})
-- --nodes
-- minetest.register_node("hell:soul_stone", {
	-- description = "Soul Stone",
	-- tiles = {"nether_rack.png"},
	-- is_ground_content = true,
	-- groups = {cracky = 3, level = 2},
	-- light_source = 10,
	-- paramtype = "light",
	-- sounds = default.node_sound_stone_defaults(),
-- })
-- --ore
-- local def = {
	-- name = "hell:ore_explosion",
	-- description = "Ore Explosion (you hacker you!)",
	-- radius = 6,
	-- tiles = {
		-- side = "nether_rack.png",
		-- top = "nether_rack.png",
		-- bottom = "nether_rack.png",
		-- burning = "nether_rack.png"
	-- },
-- }

-- tnt.register_tnt(def)
-- --ore explosion function
-- hell.explode_ore = function(pos)
	-- if math.random() > 0.5 then
		-- minetest.sound_play("tnt_ignite", {
			-- max_hear_distance = 20,
			-- pos = pos,
			-- gain = 10.0,
		-- })
		-- minetest.after(3, function(pos)
			-- tnt.boom(pos, def)
		-- end, pos)
	-- end
-- end

-- minetest.register_node("hell:hell_coal", {
	-- description = "Hell Coal Ore",
	-- tiles = {"nether_rack.png^default_mineral_coal.png"},
	-- groups = {cracky = 3},
	-- drop = 'default:coal_lump 4',
	-- light_source = 10,
	-- paramtype = "light",
	-- sounds = default.node_sound_stone_defaults(),
	-- after_dig_node = function(pos, oldnode, oldmetadata, digger)
		-- hell.explode_ore(pos)
	-- end,
-- })
-- minetest.register_node("hell:hell_iron", {
	-- description = "Hell Iron Ore",
	-- tiles = {"nether_rack.png^default_mineral_iron.png"},
	-- groups = {cracky = 2},
	-- light_source = 10,
	-- paramtype = "light",
	-- drop = 'default:iron_lump 4',
	-- sounds = default.node_sound_stone_defaults(),
	-- after_dig_node = function(pos, oldnode, oldmetadata, digger)
		-- hell.explode_ore(pos)
	-- end,
-- })
-- minetest.register_node("hell:hell_copper", {
	-- description = "Hell Copper Ore",
	-- tiles = {"nether_rack.png^default_mineral_copper.png"},
	-- groups = {cracky = 2},
	-- light_source = 10,
	-- paramtype = "light",
	-- drop = 'default:copper_lump 4',
	-- sounds = default.node_sound_stone_defaults(),
	-- after_dig_node = function(pos, oldnode, oldmetadata, digger)
		-- hell.explode_ore(pos)
	-- end,
-- })
-- minetest.register_node("hell:hell_mese", {
	-- description = "Hell Mese Ore",
	-- tiles = {"nether_rack.png^default_mineral_mese.png"},
	-- groups = {cracky = 1},
	-- light_source = 10,
	-- paramtype = "light",
	-- drop = "default:mese_crystal 4",
	-- sounds = default.node_sound_stone_defaults(),
	-- after_dig_node = function(pos, oldnode, oldmetadata, digger)
		-- hell.explode_ore(pos)
	-- end,
-- })
-- minetest.register_node("hell:hell_gold", {
	-- description = "Hell Gold Ore",
	-- tiles = {"nether_rack.png^default_mineral_gold.png"},
	-- groups = {cracky = 2},
	-- light_source = 10,
	-- paramtype = "light",
	-- drop = "default:gold_lump 4",
	-- sounds = default.node_sound_stone_defaults(),
	-- after_dig_node = function(pos, oldnode, oldmetadata, digger)
		-- hell.explode_ore(pos)
	-- end,
-- })
-- minetest.register_node("hell:hell_diamond", {
	-- description = "Hell Diamond Ore",
	-- tiles = {"nether_rack.png^default_mineral_diamond.png"},
	-- groups = {cracky = 1},
	-- light_source = 10,
	-- paramtype = "light",
	-- drop = "default:diamond 4",
	-- sounds = default.node_sound_stone_defaults(),
	-- after_dig_node = function(pos, oldnode, oldmetadata, digger)
		-- hell.explode_ore(pos)
	-- end,
-- })
--ore registration

--tnt.register_tnt(def)
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "hyrule_mapgen:red_ore",
	wherein        = "hyrule_mapgen:subrosian_sand",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 9,
	clust_size     = 3,
	y_min          = -30000,
	y_max          = -20000,
})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "hyrule_mapgen:blue_ore",
		wherein        = "hyrule_mapgen:subrosian_sand",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 12,
		clust_size     = 3,
		y_min          = -30000,
		y_max          = -20000,
	})
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "hyrule_mapgen:subrosian_stone",
		wherein        = "hyrule_mapgen:subrosian_sand",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 12,
		clust_size     = 6,
		y_min          = -30000,
		y_max          = -20000,
	})
	-- minetest.register_ore({
		-- ore_type       = "scatter",
		-- ore            = "hell:hell_gold",
		-- wherein        = "hell:soul_stone",
		-- clust_scarcity = 13 * 13 * 13,
		-- clust_num_ores = 5,
		-- clust_size     = 3,
		-- y_min          = -30000,
		-- y_max          = -20000,
	-- })
	-- minetest.register_ore({
		-- ore_type       = "scatter",
		-- ore            = "hell:hell_mese",
		-- wherein        = "hell:soul_stone",
		-- clust_scarcity = 14 * 14 * 14,
		-- clust_num_ores = 5,
		-- clust_size     = 3,
		-- y_min          = -30000,
		-- y_max          = -20000,
	-- })
	-- minetest.register_ore({
		-- ore_type       = "scatter",
		-- ore            = "hell:hell_diamond",
		-- wherein        = "hell:soul_stone",
		-- clust_scarcity = 15 * 15 * 15,
		-- clust_num_ores = 4,
		-- clust_size     = 3,
		-- y_min          = -30000,
		-- y_max          = -20000,
	-- })
	
	
	
	
--portal.register_filler("hell:portal_filler","Hell Portal Filler","hell_portal.png","hell_portal_particle.png",{a = 180, r = 128, g = 0, b = 128})
--portal.register_portal("default:torch","default:obsidian","hell:portal_filler")

-- minetest.register_abm({
	-- nodenames = {"hell:portal_filler"},
	-- interval = 1,
	-- chance = 1,
	-- action = function(pos, node)
		-- for _, obj in ipairs(minetest.get_objects_inside_radius(pos, 1)) do
			-- if obj:is_player() then
				-- print("start teleport sequence")
				-- hell.teleport_player(obj, pos)
			-- end
		-- end
	-- end,
-- })

--used for teleporting player
-- hell.teleport_player = function(player,pos)
	-- if hell.player_teleporting[player:get_player_name()] == nil then
		-- hell.player_teleporting[player:get_player_name()] = true
		-- local pos2 = player:getpos()
		-- pos.x = pos.x + math.random(-100,100)
		-- pos.z = pos.z + math.random(-100,100)
		-- pos.y = math.random(-22000,-25000)
				
		-- player:set_physics_override({
				-- gravity = 0,
				-- jump = 0,
				-- speed = 0,
			-- })
		
		-- minetest.sound_play("hell_teleport", {
			-- to_player = player,
			-- gain = 2.0,
		-- })
		
		-- minetest.add_particlespawner({
			-- amount = 1000,
			-- time = 2.5,
			-- minpos = {x = pos2.x, y = pos2.y + 1.6, z = pos2.z},
			-- maxpos = {x = pos2.x, y = pos2.y + 1.6, z = pos2.z},
			-- minvel = {x = -0.8, y = -0.8, z = -0.8},
			-- maxvel = {x = 0.8, y = 0.8, z = 0.8},
			-- minacc = {x=0, y=0, z=0},
			-- maxacc = {x=0, y=0, z=0},
			-- minexptime = 0.5,
			-- maxexptime = 1,
			-- minsize = 1,
			-- maxsize = 1,
			-- collisiondetection = false,
			-- vertical = false,
			-- texture = "hell_portal_particle.png",
		-- })
		-- --move the player and allow world to load before releasing them
		-- minetest.after(2.5, function(player, pos)
			-- player:setpos(pos)
		-- end, player, pos)
		
		-- minetest.after(3.5, function(player, pos)
			-- minetest.forceload_block(pos,true)
			-- minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name="air"})
			-- minetest.set_node({x=pos.x,y=pos.y,z=pos.z}, {name="air"})
			-- minetest.set_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="default:obsidian"})
			
			-- player:set_physics_override({
				-- gravity = 1,
				-- jump = 1,
				-- speed = 1,
			-- })
			-- hell.player_teleporting[player:get_player_name()] = nil
			-- minetest.forceload_free_block(pos,true)
			
		-- end, player, pos)
	-- end
-- end
