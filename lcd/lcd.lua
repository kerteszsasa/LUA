function lcd_send(data)
    i2c.start(id)
    i2c.address(id, dev_addr, i2c.TRANSMITTER)
    i2c.write(id, data)
    i2c.stop(id)
end

function i2c_init_lcd()
    id=0  -- need this to identify (software) IC2 bus?
    sda=3 -- connect to pin GPIO0
    scl=4 -- connect to pin GPIO2
    dev_addr =56
    ENABLE = 16
    RS = 64
    i2c.setup(id,sda,scl,i2c.SLOW)
end

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
i2c_init_lcd()

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
if(msg~=nil)then
    len = string.len(msg)
    for i=1, len do
       lcd_data(string.byte(msg, i))
    end
end
end

lcd_init()
LCD_string("hello"..45)
LCD_string(wifi.sta.getip())
lcd_cmd(0x80,0); 
LCD_string("11:26")




lcd_cmd(0x80,0)--#define GOTO_LINE1
lcd_cmd(0xC0,0)--#define GOTO_LINE2
lcd_cmd(0x94,0)--#define GOTO_LINE3
lcd_cmd(0xD4,0)--#define GOTO_LINE4

