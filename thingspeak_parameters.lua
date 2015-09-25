-- Measure temperature and post data to thingspeak.com
-- 2014 OK1CDJ
--- Tem sensor DS18B20 is conntected to GPIO0
--- 2015.01.21 sza2 temperature value concatenation bug correction

GPIO0 = 3

freq = 999



--- Get temp and send data to thingspeak.com
function sendData(key, field, value)

-- conection to thingspeak.com
print("Sending data to thingspeak.com")
conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload) print(payload) end)
-- api.thingspeak.com 184.106.153.149
conn:connect(80,'184.106.153.149') 
conn:send("GET /update?key="..key.."&"..field.."="..value.." HTTP/1.1\r\n") 
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
  
end



--sendData("27IXJHBG1IDIM9WS" , "field1", "-44")
