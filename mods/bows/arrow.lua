bows.nothing=function(self,target,hp,user,lastpos)
	return self
end

bows.on_hit_object=function(self,target,hp,user,lastpos)
	local hp2=target:get_hp()-hp
	target:set_hp(hp2)
	target:punch(user,1,{full_punch_interval=1,damage_groups={fleshy=4}},nil)
	if hp2>0 then
		local pos=self.object:getpos()
		local opos=target:getpos()
		local dir = user:get_look_dir()
		self.object:set_attach(target, "", {x=(opos.x-pos.x)*4,y=(pos.y-opos.y)*4,z=(pos.z-opos.z)*4},{x=0,y=-90,z=0})
	else
	bows.arrow_remove(self)
	end
	return self
end


bows.on_hit_node=function(self,pos,user,lastpos)
	if not minetest.registered_nodes[minetest.get_node(pos).name].node_box then
		local mpos={x=(pos.x-lastpos.x),y=(pos.y-lastpos.y),z=(pos.z-lastpos.z)}
		local npos={x=bows.rnd(pos.x),y=bows.rnd(pos.y),z=bows.rnd(pos.z)}
		local m={x=-0.6,y=-0.6,z=-0.6}
		local bigest={x=mpos.x,y=mpos.y,z=mpos.z}
		if bigest.x<0 then bigest.x=bigest.x*-1 m.x=0.6 end
		if bigest.y<0 then bigest.y=bigest.y*-1 m.y=0.6 end
		if bigest.z<0 then bigest.z=bigest.z*-1 m.z=0.6 end
		local b=math.max(bigest.x,bigest.y,bigest.z)
		if b==bigest.x then
			pos.x=npos.x+m.x
		elseif b==bigest.y then
			pos.y=npos.y+m.y
		else
			pos.z=npos.z+m.z
		end
		self.object:setpos(pos)
	end
	return self
end

bows.rnd=function(r)
	return math.floor(r+ 0.5)
end

bows.arrow_remove=function(self)
	if self.object:get_attach() then self.object:set_detach() end
	if self.target then self.target:punch(self.object, 1,{full_punch_interval=1,damage_groups={fleshy=4}}, nil) end
	self.object:set_hp(0)
	self.object:punch(self.object, 1,{full_punch_interval=1.0,damage_groups={fleshy=4}}, nil)
	return self
end

minetest.register_entity("bows:arrow",{
	hp_max = 10,
	visual="wielditem",
	visual_size={x=.20,y=.20},
	collisionbox = {0,0,0,0,0,0},
	physical=false,
	textures={"air"},
		on_punch=function(self, puncher, time_from_last_punch, tool_capabilities, dir)
			if not self.target then return self end
			if not self.hp then self.hp=self.object:get_hp() end
			local hp=self.object:get_hp()
			local hurt=self.hp-self.object:get_hp()
			self.hp=self.object:get_hp()
			self.target:set_hp(self.target:get_hp()-hurt)
			self.target:punch(self.object, hurt,{full_punch_interval=1.0,damage_groups={fleshy=4}}, "default:sword_wood", nil)
			if hurt>100 or hp<=hurt then
				self.target:set_detach()
				self.target:setvelocity({x=0, y=4, z=0})
				self.target:setacceleration({x=0, y=-10, z=0})
				self.on_punch=function(self, puncher, time_from_last_punch, tool_capabilities, dir) end
				bows.arrow_remove(self)
			end
			return self
		end,
	on_activate = function(self, staticdata)
		if bows.tmp and bows.tmp.arrow ~= nil then
			self.arrow=bows.tmp.arrow
			self.user=bows.tmp.user
			self.name=bows.tmp.name
			self.dmg=bows.registed_arrows[self.name].damage
			bows.tmp=nil
			self.object:set_properties({textures={self.arrow}})
		else
			self.object:remove()
		end
	end,
	stuck=false,
	bow_arrow=true,
	timer=20,
	x=0,
	y=0,
	z=0,
	on_step=	function(self, dtime)
		self.timer=self.timer-dtime
		if self.stuck then
			if self.target and self.target:get_hp()<=1 then self.timer=-1 end
			if self.timer<0 then
				bows.arrow_remove(self)
			end
			local pos = self.object:getpos()
			local objs = minetest.get_objects_inside_radius(pos, 1.3)
			for _, obj in ipairs(objs) do
				if obj:is_player() then
					local pname = obj:get_player_name()
					local inv = minetest.get_inventory({type="player", name=pname});
					local remov = inv:add_item("main", self.name)
					bows.arrow_remove(self)
					minetest.sound_play("item_drop_pickup", {pos = pos, gain = 0.3, max_hear_distance = 16})
				end
			end
			return self
		end
		local pos=self.object:getpos()
		if (self.user==nil or self.timer<16 ) or minetest.get_node(pos) and minetest.registered_nodes[minetest.get_node(pos).name].walkable then
			if bows.mesecons and minetest.get_node(pos).name=="bows:target" then
				mesecon.receptor_on(pos)
				minetest.env:get_node_timer(pos):start(2)
			end
			self.object:setvelocity({x=0, y=0, z=0})
			self.object:setacceleration({x=0, y=0, z=0})
			self.stuck=true
			bows.registed_arrows[self.name].on_hit_node(self,pos,self.user,{x=self.x,y=self.y,z=self.z})
			minetest.sound_play(bows.registed_arrows[self.name].on_hit_sound, {pos=pos, gain = 1.0, max_hear_distance = 7})
			return self
		end
		bows.registed_arrows[self.name].on_step(self,dtime,self.user,pos,{x=self.x,y=self.y,z=self.z})
		self.x=pos.x
		self.y=pos.y
		self.z=pos.z
		for i, ob in pairs(minetest.get_objects_inside_radius(pos, 1)) do
			if ob and ((bows.pvp and ob:is_player() and ob:get_player_name()~=self.user:get_player_name()) or (ob:get_luaentity() and ob:get_luaentity().physical and ob:get_luaentity().bow_arrow==nil and ob:get_luaentity().name~="__builtin:item" )) then
				self.object:setvelocity({x=0, y=0, z=0})
				self.object:setacceleration({x=0, y=0, z=0})
				self.stuck=true
				bows.on_hit_object(self,ob,self.dmg,self.user,{x=self.x,y=self.y,z=self.z})
				bows.registed_arrows[self.name].on_hit_object(self,ob,self.dmg,self.user,{x=self.x,y=self.y,z=self.z})
				minetest.sound_play(bows.registed_arrows[self.name].on_hit_sound, {pos=pos, gain = 1.0, max_hear_distance = 7})
				return self
			end
		end
	return self
	end,
})