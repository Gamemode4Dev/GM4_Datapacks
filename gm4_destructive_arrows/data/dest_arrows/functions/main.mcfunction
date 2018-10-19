#runs the block checks if an arrow hits a surface
execute as @e[type=arrow,tag=!gm4_dest_arrows_checked,nbt={inGround:1b}] at @s run function dest_arrows:run/test_block