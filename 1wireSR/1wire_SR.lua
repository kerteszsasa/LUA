print("hello")
GPIO0 =   3
function send_one()
    gpio.write(GPIO0, gpio.LOW)
    gpio.write(GPIO0, gpio.HIGH)
end

function send_zero()
    gpio.write(GPIO0, gpio.LOW)
    tmr.delay(300)
    gpio.write(GPIO0, gpio.HIGH)
end

function send_latch()
    gpio.write(GPIO0, gpio.LOW)
    tmr.delay(2000)
    gpio.write(GPIO0, gpio.HIGH)

function send_SR (data)
gpio.mode(GPIO0, gpio.OUTPUT)
gpio.write(GPIO0, gpio.HIGH)
tmr.delay(1000)
if bit.isset(data, 7) then 
send_one()
else
send_zero()
end

if bit.isset(data, 6) then 
send_one()
else
send_zero()
end

if bit.isset(data, 5) then 
send_one()
else
send_zero()
end

if bit.isset(data, 4) then 
send_one()
else
send_zero()
end

if bit.isset(data, 3) then 
send_one()
else
send_zero()
end

if bit.isset(data, 2) then 
send_one()
else
send_zero()
end

if bit.isset(data, 1) then 
send_one()
else
send_zero()

send_latch()

print( bit.isset(data, 0) )
print( bit.isset(data, 1) )
print( bit.isset(data, 2) )
print( bit.isset(data, 3) )
print( bit.isset(data, 4) )
print( bit.isset(data, 5) )
print( bit.isset(data, 6) )
print( bit.isset(data, 7) )

end
send_SR(32)
