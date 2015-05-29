print("freq_noint")

GPIO2 =   4
--freq = 0
local cycle = 0
local state1 = 0
local state2 = 0

function read_input ()
    gpio.mode(GPIO2, gpio.INPUT)
    state1 = gpio.read(GPIO2)
    if state1 > state2 then --rising edge
        freq = freq+1
    end
    state2 = state1
    cycle = cycle +1
    if cycle > 1000 then 
    tmr.stop(1)
    print("freq: "..freq)
    end
end

tmr.alarm(1, 1, 1, read_input )-- use tmr 1, wait 1ms , cycle run
