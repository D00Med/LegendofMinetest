-- init file for thunder
if minetest.get_modpath("lightning") ~= nil then
  local modpath = minetest.get_modpath("thunder");
  dofile(modpath.."/thunder.lua")
end