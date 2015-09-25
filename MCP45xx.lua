--

id=0  -- need this to identify (software) IC2 bus?
sda=3 -- connect to pin GPIO0
scl=4 -- connect to pin GPIO2

ADDRESS = 47

i2c.setup(id,sda,scl,i2c.SLOW)

function my_write_reg(dev_addr, reg_addr, reg_val)
reg_addr=reg_addr*16--hack
    i2c.start(id)
    i2c.address(id, dev_addr, i2c.TRANSMITTER)
    i2c.write(id, reg_addr)
    i2c.write(id, reg_val)
    i2c.stop(id)
end 

    function my_read_reg(dev_addr, reg_addr)
    reg_addr=reg_addr*16--hack
    reg_addr=reg_addr+12--hack
      i2c.start(id)
      i2c.address(id, dev_addr ,i2c.TRANSMITTER)
      i2c.write(id,reg_addr)
      i2c.stop(id)
      i2c.start(id)
      i2c.address(id, dev_addr,i2c.RECEIVER)
      c=i2c.read(id,2)
      i2c.stop(id)
       --  print(string.byte(c, 1))
              print(string.byte(c, 2))
      
      return c
    end

    
--my_write_reg(ADDRESS,2,0)
my_write_reg(ADDRESS,0,255)
my_write_reg(ADDRESS,0,200)
my_write_reg(ADDRESS,0,100)
my_write_reg(ADDRESS,0,7)
my_write_reg(ADDRESS,0,0)
--my_write_reg(ADDRESS,2,7)

my_read_reg(ADDRESS, 0)  -- read ram

my_read_reg(ADDRESS, 2) -- read eeprom

