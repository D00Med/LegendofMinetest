-- init file for weather_core
if minetest.setting_getbool("enable_weather") then
local modpath = minetest.get_modpath("weather_core");
dofile(modpath.."/weather_core.lua")
end