
-- setup I2c and connect display
function init_i2c_display()
     -- SDA and SCL can be assigned freely to available GPIOs
     --sda = 5 -- GPIO14
     --scl = 6 -- GPIO12
    sda=3 -- connect to pin GPIO0
    scl=4 -- connect to pin GPIO2
     sla = 0x3c
     i2c.setup(0, sda, scl, i2c.SLOW)
     disp = u8g.ssd1306_128x64_i2c(sla)
end

-- the draw() routine
function draw()
     disp:setFont(u8g.font_6x10)
     disp:drawStr( 0+0, 20+0, "Hehgfhfo!")
     disp:drawStr( 0+2, 20+16, "Hehhhhhhhhhhllo!")
     disp:drawBox(0, 0, 3, 3)
     disp:drawBox(disp:getWidth()-6, 0, 6, 6)
     disp:drawBox(disp:getWidth()-9, disp:getHeight()-9, 9, 9)
     disp:drawBox(0, disp:getHeight()-12, 12, 12)

     disp:drawCircle(80, 22, 9)


end

function draw2()
      disp:setFont(u8g.font_chikita)
     disp:drawStr(0, 10, "drawLine")
     
     disp:setFont(u8g.font_6x10)
     disp:drawStr(0, 30, "DRAWLINE")
     
     disp:setFont(u8g.font_9x18)
     disp:drawStr(0, 50, wifi.sta.getip() )
     disp:drawLine(64, 10, 100, 55)

end



function rotation_test()
          disp:firstPage()
          repeat
               draw(draw_state)
               --draw2()

          until disp:nextPage() == false
end

init_i2c_display()

rotation_test()



