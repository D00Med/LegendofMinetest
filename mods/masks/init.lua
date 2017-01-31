
minetest.register_on_leaveplayer(function(player)
	local pos = player:getpos()
		local objs = minetest.env:get_objects_inside_radius(pos, 1)
			for _,obj in ipairs(objs) do
				if obj:get_luaentity() ~= nil and obj:get_luaentity().name == "masks:deku" then
					obj:remove()
				end
			end
end)

minetest.register_entity("masks:deku", {
	visual = "mesh",
	physical = false,
    hp_max = 1,
	mesh = "dekumask.b3d",
	textures = {"masks_deku.png"},
	collisionbox = {0,0,0,0,0,0},
})

minetest.register_craftitem("masks:deku_item", {
	description = "Deku Mask",
	inventory_image = "masks_deku_inv.png",
	on_use = function(itemstack, placer, pointed_thing)
		local pos = placer:getpos()
		-- local objs = minetest.env:get_objects_inside_radius(pos, 1)
			-- for _,obj in ipairs(objs) do
				-- if obj:get_luaentity() ~= nil and obj:get_luaentity().name == "masks:deku" then
					-- obj:remove()
				-- end
			-- end
		local ent = minetest.env:add_entity(pos, "masks:deku")
		ent:set_attach(placer, "", {x=0, y=0, z=0}, {x=0, y=0, z=0})
	end,
	on_place = function(itemstack, placer, pointed_thing)
		local pos = placer:getpos()
		local objs = minetest.env:get_objects_inside_radius(pos, 1)
			for _,obj in ipairs(objs) do
				if obj:get_luaentity() ~= nil and obj:get_luaentity().name == "masks:deku" then
					obj:remove()
				end
			end
	end
})