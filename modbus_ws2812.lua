print("Modbus")
red =0
green=0
blue=0
val =0
registers ={1,0,0}
print(registers [1])

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
        addr =string.byte(payload, 10)
        val =string.byte(payload, 12)
        print(addr)
        print(val)
        conn:send(payload)
        registers [addr+1]=val
        ws2812.writergb(5, string.char(registers [1], registers [2], registers [3]):rep(8))
        end

        --reg olvasas
        if ( func== 3) then
        print("olvas")
        print(node.heap())
        tmr.wdclr()
       tid1 = string.byte(payload, 1)
       tid2 = string.byte(payload, 2)
       uid = string.byte(payload, 7)
       start = string.byte(payload, 9)*256
       start = start + string.byte(payload, 10)
       playload=nil
     --  node.collect
       print(node.heap())
       print(start)
       data1=0
       data2=getreg(start)
        tmr.wdclr()
       response=string.char(tid1, tid2, 0, 0, 0, 5, uid, 3, 2,      data1,data2)
        conn:send(response)
        end
   --conn:send("ACK")
   --conn:close()
    end)
end)


function getreg(addr)
return (registers [addr+1])
end