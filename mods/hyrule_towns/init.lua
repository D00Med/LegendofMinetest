
--Hyrule towns - adds towns to Legend of Minetest

local regular = {
	"blue1",
	"blue2",
	"blue3",
	"pub",
	"red1",
	"red2",
	"red3",
	"shop",
}

local function place_building(pos, name, facing)
	minetest.place_schematic({x=pos.x-4, y=pos.y, z=pos.z-4}, minetest.get_modpath("hyrule_towns").."/schems/"..name..".mts", facing, {}, true)
end

local function place_town(pos, surface_type)
	--All buildings must be 9x9
	local building_positions = {
		{x=pos.x+1, y=pos.y, z=pos.z+2},
		{x=pos.x+1, y=pos.y, z=pos.z-9},
		{x=pos.x+1, y=pos.y, z=pos.z+13},
		{x=pos.x+12, y=pos.y, z=pos.z+2},
		{x=pos.x+12, y=pos.y, z=pos.z-9},
		{x=pos.x+12, y=pos.y, z=pos.z+13},
		{x=pos.x-10, y=pos.y, z=pos.z+2},
		{x=pos.x-10, y=pos.y, z=pos.z-9},
		{x=pos.x-10, y=pos.y, z=pos.z+13},
		{x=pos.x-21, y=pos.y, z=pos.z+2},
		{x=pos.x-21, y=pos.y, z=pos.z-9},
		{x=pos.x-21, y=pos.y, z=pos.z+13},
	}
	local used_positions = {}
	local schematics = {}
	if surface_type == "default:dirt_with_grass" or surface_type == "default:dirt_with_grass3" then
		schematics = regular
	else
		schematics = regular
	end
	for i = 1,12 do
		local position = building_positions[i]
		if used_positions[i] == building_positions[i] then 
		--minetest.chat_send_all("can't place building (position taken)")
		return end
		local building_name = schematics[math.random(1,8)]
		for j = -10,10 do
			position.y = position.y+j
			local ground = minetest.find_node_near(position, 1, {"default:dirt_with_grass", "default:dirt_with_grass3"}, true)
			if ground then
				--minetest.chat_send_all("ground has been found :)")
				--This doesn't look as good as I'd hoped. I'm leaving it in in case I change my mind.
				--[[local grass_nodes = minetest.find_nodes_in_area({x=ground.x-4, y=ground.y-4, z=ground.z-4}, {x=ground.x+4, y=ground.y+3, z=ground.z+4}, {"default:dirt_with_grass", "dirt_with_grass3"})
				for _, grass_pos in ipairs(grass_nodes) do
				minetest.set_node(grass_pos, {name="default:dirt_with_dry_grass"})
				end]]
				place_building(ground, building_name, random)
				used_positions[i] = position
				--minetest.chat_send_all("building placed")
			end
		end
	end
end

minetest.register_on_generated(function(minp, maxp)
	if math.random(1,5) == 1 then return end
	local hmap = minetest.get_mapgen_object("heightmap")
	local chunksize = minetest.settings:get("chunksize")*16
	local check1 = hmap[1]-hmap[chunksize]
	local check2 = hmap[3]-hmap[5]
	if check1 <= 4 and check2 <= 4 then
		local pos = {x=0, y=0, z=0}
		pos.x = (minp.x+maxp.x)/2
		pos.y = (minp.y+maxp.y)/2
		pos.z = (minp.z+maxp.z)/2
		local surface_type = minetest.get_node({x=pos.x, y=hmap[1], z=pos.z}).name
		place_town(pos, surface_type)
	end
end)