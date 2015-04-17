print("Modbus")

srv=net.createServer(net.TCP) 
srv:listen(502,function(conn) 
    conn:on("receive",function(conn,payload) 
    --print("Input:"..payload) 
        --len = string.len(payload)
        func = string.byte(payload, 8)
        tmr.wdclr()

        --reg iras
        if ( func== 6) then
        print("ir")
        print(string.byte(payload, 10))
        print(string.byte(payload, 12))
        conn:send(payload)
        end

        --reg olvasas
        if ( func== 3) then
        print("olvas")
        print(node.heap())
        tmr.wdclr()
     --  tid1 = string.byte(payload, 1)
     --  tid2 = string.byte(payload, 2)
     --  uid = string.byte(payload, 7)
      -- start = string.byte(payload, 9)*256
      -- start = start + string.byte(payload, 10)
      --start =1

      -- print("start: "..start)
       data=83

tmr.wdclr()
      -- response=string.char(tid1, tid2, 0, 0, 0, 5, uid, 3, 1,      0,data)
      response=string.char(0, 1, 0, 0, 0, 5, 17, 3, 1,      0,data)
        conn:send(response)
        end
   --conn:send("ACK")
   --conn:close()
    end)
end)
