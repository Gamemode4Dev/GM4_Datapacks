#@s = around the area of the unchecked arrow
#runs by dest_arrows:run/test_block

#tests if the block is breakable
execute if block ~ ~ ~ #dest_arrows:break_block run setblock ~ ~ ~ air destroy
#tests if the block is changable
execute if block ~ ~ ~ #dest_arrows:change_block run function dest_arrows:run/change_block