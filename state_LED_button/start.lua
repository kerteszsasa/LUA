--start.lua
print("Setting up WIFI...")
wifi.setmode(wifi.STATION)
--modify according your wireless router settings
--wifi.sta.config("SSID","PASSWORD")
wifi.sta.connect()
tmr.alarm(1, 1000, 1, function() 
if wifi.sta.getip()== nil then 
print("IP unavaiable, Waiting...")
ws2812.writergb(4, string.char(15, 10, 0)) 
else 
tmr.stop(1)
print("Config done, IP is "..wifi.sta.getip())
ws2812.writergb(4, string.char(0, 15, 15))
--dofile("ds1820.lua")
tmr.alarm(1, 2000, 0, startprogram)
end 
end)

function startprogram()
ws2812.writergb(4, string.char(15, 0, 0))
print ("START")
dofile("state_LED_button.lua")
end