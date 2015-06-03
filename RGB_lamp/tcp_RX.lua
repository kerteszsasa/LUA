srv=net.createServer(net.TCP) 
srv:listen(30303,function(conn) 
    conn:on("receive",function(conn,payload) 
    print("Input:"..payload)
    COM_H = string.byte(payload, 1)
    COM_L = string.byte(payload, 2)

    print("com H: ".. COM_H)
     print("com L: ".. COM_L)

     if(COM_H == 49 and COM_L == 51 )then
     print(string.byte(payload, 3))
     print(string.byte(payload, 4))
     print(string.byte(payload, 5))

  pwm.setup(6,1000,4*string.byte(payload, 3))
  pwm.setup(7,1000,4*string.byte(payload, 4))
  pwm.setup(5,1000,4*string.byte(payload, 5))
  pwm.start(6)
  pwm.start(7)
  pwm.start(5)
     end
    --lcd_init()
   -- LCD_string(payload)
   conn:send("ACK")
   --conn:close()
    end)
end)
