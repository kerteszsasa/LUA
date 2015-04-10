function lcd_send(data)
    write_reg(56,0,data)--pcf
end

ENABLE = 16
RS = 64

function lcd_data(data)
    high = data/16
    low = bit.band(data,0x0F)
    lcd_send(high+RS)
    lcd_send(high+ENABLE+RS)
    lcd_send(high+RS)       
    lcd_send(low+RS)
    lcd_send(low+ENABLE+RS)
    lcd_send(low+RS)
end
function lcd_cmd(data)
    high = data/16
    low = bit.band(data,0x0F)
    lcd_send(high)
    lcd_send(high+ENABLE)
    lcd_send(high)
    lcd_send(low)
    lcd_send(low+ENABLE)
    lcd_send(low)
end



function lcd_init()
lcd_send(3)
lcd_send(19)
lcd_send(3)
tmr.delay(5000)

lcd_send(3)
lcd_send(19)
lcd_send(3)
tmr.delay(5000)

lcd_send(3)
lcd_send(19)
lcd_send(3)
tmr.delay(5000)

lcd_send(2)
lcd_send(18)
lcd_send(2)
tmr.delay(5000)
--8bit mode
lcd_cmd(0x28)
tmr.delay(5000)
lcd_cmd(0x08,0);
lcd_cmd(0x01,0);
lcd_cmd(0x0C,0); 
tmr.delay(5000)
end

function LCD_string(msg)
    for i=1, string.len(msg) do
        lcd_data(string.byte(msg, i))
    end
end


lcd_init()
LCD_string("hello"..45)
LCD_string(wifi.ap.getip())
lcd_cmd(0x80,0); 
LCD_string("11:26")


lcd_cmd(0x80,0)--#define GOTO_LINE1
lcd_cmd(0xC0,0)--#define GOTO_LINE2
lcd_cmd(0x94,0)--#define GOTO_LINE3
lcd_cmd(0xD4,0)--#define GOTO_LINE4

