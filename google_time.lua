time =0
conn=net.createConnection(net.TCP, 0)
conn:on("receive", function(conn, payload)
    --print (payload)
    print(string.sub(payload,string.find(payload,"Date: ")+6,string.find(payload,"Date: ")+35))
    time=(string.sub(payload,string.find(payload,"Date: ")+6,string.find(payload,"Date: ")+35))
    conn:close()
    end)
conn:dns('google.com',function(conn,ip) ipaddr=ip end)
conn:connect(80,ipaddr)
heap = node.heap()
conn:send("HEAD / HTTP/1.1\r\n")
conn:send("Accept: */*\r\n")
conn:send("User-Agent: Mozilla/4.0 (compatible; ESP8266 NodeMcu Lua;)\r\n")
conn:send("\r\n") 



--LCD_string (string.sub(time,18,25))