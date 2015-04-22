GPIO0 =   3 --clk
GPIO2 =   4 -- dat
function shift_bit(data,pos)
    if bit.isset(data, pos) then 
        gpio.write(GPIO2, gpio.HIGH)
    else
        gpio.write(GPIO2, gpio.LOW)
    end
    gpio.write(GPIO0, gpio.HIGH)
    tmr.delay(500)
    gpio.write(GPIO0, gpio.LOW)
end
function send_SR (data)
    gpio.mode(GPIO0, gpio.OUTPUT)
    gpio.mode(GPIO2, gpio.OUTPUT)
    shift_bit(data,0)
    shift_bit(data,1)
    shift_bit(data,2)
    shift_bit(data,3)
    shift_bit(data,4)
    shift_bit(data,5)
    shift_bit(data,6)
    shift_bit(data,7)    
end
function decode(num)
    if num==0 then send_SR(119)end
    if num==1 then send_SR(20)end
    if num==2 then send_SR(110)end
    if num==3 then send_SR(62)end
    if num==4 then send_SR(29)end
    if num==5 then send_SR(59)end
    if num==6 then send_SR(123)end
    if num==7 then  send_SR(22)end
    if num==8 then send_SR(127)end
    if num==9 then send_SR(63)end
end
function seven_segment(num)
    egyes=num%10
    num=num/10
    tizes=num%10
    num=num/10
    szazas=num%10
    num=num/10
    ezres=num%10
    decode(egyes)
    decode(tizes)
    decode(szazas)
    decode(ezres)
end

function seven_segment_off()
send_SR(0)
send_SR(0)
send_SR(0)
send_SR(0)
end

seven_segment(1852)
seven_segment_off()


