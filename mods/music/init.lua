
local music = false
local music_playing = false
local music_name = ""
local duration = 0
local gain = 0

minetest.register_globalstep(function()
	for _, player in ipairs(minetest.get_connected_players()) do	
		local playername = player:get_player_name()
		local pos = player:getpos()
		local village_nodes = minetest.find_nodes_in_area({x=pos.x-5, y=pos.y-3, z=pos.z-5}, {x=pos.x+5, y=pos.y+5, z=pos.z+5}, {"stairs:slab_red", "stairs:slab_blue", "farming:straw"})
		local boss_nodes = minetest.find_nodes_in_area({x=pos.x-5, y=pos.y-3, z=pos.z-5}, {x=pos.x+5, y=pos.y+5, z=pos.z+5}, {"hyrule_mapgen:volvagia_spawn", "hyrule_mapgen:ganon_spawn", "hyrule_mapgen:bongo_spawn", "hyrule_mapgen:dodongo_spawn"})
		--minetest.chat_send_all("boss_nodes:"..#boss_nodes.." village_nodes:"..#village_nodes)
		
		if #boss_nodes ~= nil and #village_nodes ~= nil then
		if #boss_nodes > 0 then
			music = true
			music_name = "BrassFleece"
			duration = 105
			gain = 0.8
		elseif #village_nodes > 5 and math.random(1, 5000) == 1 then
			music = true
			music_name = "Villageforest"
			duration = 93
			gain = 1
		elseif math.random(1, 10000) == 1 then
			music = true
			music_name = "Downtime"
			duration = 75
			gain = 1
		end
		end
		
		if music and not music_playing then
			minetest.sound_play(music_name, {to_player=playername, gain=gain})
			music_playing = true
			music = false
			minetest.after(duration, function()
				music_playing = false
			end)
		end
		
	end
end)