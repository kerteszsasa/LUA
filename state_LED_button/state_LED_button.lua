GPIO2 = 4
--dofile("brightness.lua")

RELAY =0
ws2812.writergb(4, string.char(15, 0, 0))


    gpio.mode(GPIO2,gpio.INT)
    function GPIO2cb(level)

        if (RELAY == 0) then
            print("ON")
            RELAY =1
            ws2812.writergb(4, string.char(0, 15, 0))
            gpio.mode(GPIO2,gpio.INT)
            gpio.trig(GPIO2, "down",GPIO2cb)
        else
            print("OFF")
            RELAY =0
            ws2812.writergb(4, string.char(15, 0, 0))
            gpio.mode(GPIO2,gpio.INT)
            gpio.trig(GPIO2, "down",GPIO2cb)
        end  
    end

    gpio.trig(GPIO2, "down",GPIO2cb)


 --  gpio.mode(GPIO2,gpio.INPUT)

  --  print(gpio.read(GPIO2))

 --   print(brightness)
 print(RELAY)

