print("hello")
GPIO0 =   3
function shift_bit(data,pos)
    if bit.isset(data, pos) then 
        gpio.write(GPIO0, gpio.LOW)
        gpio.write(GPIO0, gpio.HIGH)
    else
        gpio.write(GPIO0, gpio.LOW)
        tmr.delay(300)
        gpio.write(GPIO0, gpio.HIGH)
    end
end
function send_latch()
    gpio.write(GPIO0, gpio.LOW)
    tmr.delay(2000)
    gpio.write(GPIO0, gpio.HIGH)
end
function send_SR (data)
    gpio.mode(GPIO0, gpio.OUTPUT)
    gpio.write(GPIO0, gpio.HIGH)
    tmr.delay(1000)
    shift_bit(data,7)
    shift_bit(data,6)
    shift_bit(data,5)
    shift_bit(data,4)
    shift_bit(data,3)
    shift_bit(data,2)
    shift_bit(data,1)
    send_latch()
end
send_SR(64)
