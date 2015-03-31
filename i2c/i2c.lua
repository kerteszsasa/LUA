print("hello I2C")
--http://www.esp8266-projects.com/2015/02/part3-esp8266-cheap-and-dirty-basic.html

GPIO16 =0
GPIO5=1
GPIO4=2
GPIO0=3
GPIO2=4
GPIO14=5
GPIO12=6
GPIO13=7
GPIO15=8
GPIO3=9
GPIO1=10
GPIO9=11
GPIO10=12


 -- Based on work by zeroday & sancho among many other open source authors
-- This code is public domain, attribution to gareth@l0l.org.uk appreciated.

id=0  -- need this to identify (software) IC2 bus?
sda=3 -- connect to pin GPIO0
scl=4 -- connect to pin GPIO2

-- initialize i2c with our id and pins in slow mode :-)
i2c.setup(id,sda,scl,i2c.SLOW)

-- user defined function: read from reg_addr content of dev_addr
function read_reg(dev_addr, reg_addr)
     i2c.start(id)
     i2c.address(id, dev_addr ,i2c.TRANSMITTER)
     i2c.write(id,reg_addr)
     i2c.stop(id)
     i2c.start(id)
     i2c.address(id, dev_addr,i2c.RECEIVER)
     c=i2c.read(id,1)
     i2c.stop(id)
     return c
end

function write_reg(dev_addr, reg_addr, reg_val)
    i2c.start(id)
    i2c.address(id, dev_addr, i2c.TRANSMITTER)
--    i2c.write(id, reg_addr)
    i2c.write(id, reg_val)
    i2c.stop(id)
end 




print("Scanning I2C Bus")
for i=1,127 do
     if (string.byte(read_reg(i, 0))==0) then
     print("Device found at address "..string.format("%02X",i))
     print(i)
     end
end


write_reg(39,0,255)
