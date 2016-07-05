minetest.register_chatcommand("whoami", {
	params = "",
	description = "Check your name",
	privs = {},
	func = function(name)
		minetest.chat_send_player(name, "Your name is: " .. name)
	end,
})

minetest.register_chatcommand("ip", {
	params = "",
	description = "Show your IP address",
	privs = {},
	func = function(name)
		minetest.chat_send_player(name, "Your IP address is: " .. minetest.get_player_ip(name))
	end
})

minetest.register_chatcommand("kill", {
	params = "",
	description = "Kill yourself",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
      			return
    		end

		if minetest.setting_getbool("enable_damage") == false then
			minetest.chat_send_player(name, "Can't kill yourself. Damage is disabled on this server.")
		else
			player:set_hp(0)
			minetest.chat_send_player(name, "You suicided.")
		end
	end
})
