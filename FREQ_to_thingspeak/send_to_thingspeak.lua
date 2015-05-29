-- Measure temperature and post data to thingspeak.com
-- 2014 OK1CDJ
--- Tem sensor DS18B20 is conntected to GPIO0
--- 2015.01.21 sza2 temperature value concatenation bug correction

GPIO0 = 3

freq = 0

--- Get temp and send data to thingspeak.com
function sendData()
--getTemp()

print("outside_freq: "..freq)
lasttemp = freq*10000

t1 = lasttemp / 10000
t2 = (lasttemp >= 0 and lasttemp % 10000) or (10000 - lasttemp % 10000)
print("Temp:"..t1 .. "."..string.format("%04d", t2).." C\n")
-- conection to thingspeak.com
print("Sending data to thingspeak.com")
conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload) print(payload) end)
-- api.thingspeak.com 184.106.153.149
conn:connect(80,'184.106.153.149') 
conn:send("GET /update?key=1CP03SBUHNESMDOW&field1="..t1.."."..string.format("%04d", t2).." HTTP/1.1\r\n") 
conn:send("Host: api.thingspeak.com\r\n") 
conn:send("Accept: */*\r\n") 
conn:send("User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n")
conn:send("\r\n")
conn:on("sent",function(conn)
                      print("Closing connection")
                      conn:close()
                  end)
conn:on("disconnection", function(conn)
                                print("Got disconnection...")
  end)
  dofile("freq_noint.lua")
end

-- send data every X ms to thing speak
tmr.alarm(0, 20000, 1, function() sendData() end )