conn=net.createConnection(net.TCP, 0)
    conn:on("receive", function(conn, payload)
        print (payload)
        conn:close()
    end)
conn:connect(30304,"192.168.1.103")
conn:send("HEAD / HTTP/1.1\r\n")



