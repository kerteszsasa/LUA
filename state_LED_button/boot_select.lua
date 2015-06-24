GPIO2=4
counter =0

function chk_btn()
print("Wait "..10-counter)
    if gpio.read(GPIO2)==1 then
        counter = counter + 1
    else
        tmr.stop(1)
        print ("button off, connect to wifi")
        dofile("start.lua")
    end
    if counter == 10 then
        tmr.stop(1)
        print("AP START")
         dofile('configServer.lua')
    end
end



gpio.mode(GPIO2,gpio.INPUT)
tmr.delay(500000)
if gpio.read(GPIO2)==1 then
    print ("button on")
    tmr.alarm(1, 1000, 1, chk_btn )
else
    print ("button off, connect to wifi")
    dofile("start.lua")
end





