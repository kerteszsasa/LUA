
message = "hello world"

--lcd_data(string.byte(message, 5))

--print(string.byte(message, 55))
--print( tonumber('01121'))

items= {1,2,nil,4,5}
items[10]=25
print(items)

print (time)
items= time


function cycle()
lcd_init() LCD_string("szomjas: "..freq) dofile('freq_noint.lua')
end



tmr.alarm(3, 2000, 1, cycle )-- use tmr 3, wait 2s , cycle run

