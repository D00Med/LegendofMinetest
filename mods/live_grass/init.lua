local size = 9
local range = 15
local falloff = range/2
local ready = true
local lastpos = {x=0, y=0, z=0}
--[[
minetest.register_globalstep(function(dtime)
	for _, player in ipairs(minetest.get_connected_players()) do
	if player:get_player_name() ~= "singleplayer" then return end
	local pos = player:getpos()
	if pos == lastpos or math.abs(pos.x-lastpos.x+pos.z-lastpos.z) <= 4 then return end
	local nodes = minetest.find_nodes_in_area({x=pos.x-range, y=pos.y-range, z=pos.z-range}, {x=pos.x+range, y=pos.y+range, z=pos.z+range}, "default:dirt_with_grass")
	if nodes == nil or ready == false then
	return end
	for _, node in pairs(nodes) do
		if math.random(1,7)==1 then
		minetest.add_particle({
			pos = {x=node.x, y=node.y+0.9, z=node.z},
			velocity = {x=0, y=0, z=0},
			acceleration = {x=0, y=0, z=0},
			expirationtime = 6,
			size = math.random(size-1,size+1),
			collisiondetection = false,
			collisionremoval = false,
			vertical = true,
			texture = "grass_"..math.random(1,5)..".png",
		})
		end
	end
	ready = false
	minetest.after(1, function()
	ready = true
	end)
	end
end)]]