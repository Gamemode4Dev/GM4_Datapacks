#@s = area around the arrow ready to change the blocks
#ran by dest_arrows:run/check_block

#makes changes to blocks
execute if block ~ ~ ~ cobblestone run setblock ~ ~ ~ gravel
execute if block ~ ~ ~ stone run setblock ~ ~ ~ cobblestone
execute if block ~ ~ ~ dirt run setblock ~ ~ ~ coarse_dirt
execute if block ~ ~ ~ grass_block run setblock ~ ~ ~ dirt
execute if block ~ ~ ~ mycelium run setblock ~ ~ ~ dirt
execute if block ~ ~ ~ podzol run setblock ~ ~ ~ dirt
execute if block ~ ~ ~ stone_bricks run setblock ~ ~ ~ cracked_stone_bricks