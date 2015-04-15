conn=net.createConnection(net.TCP, 0)
    conn:on("receive", function(conn, payload)
        print (payload)
        conn:close()
    end)
conn:connect(8080,"192.168.1.100")
conn:send("HEAD / HTTP/1.1\r\n")

