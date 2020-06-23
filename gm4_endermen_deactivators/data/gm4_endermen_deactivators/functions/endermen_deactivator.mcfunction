#@s=endermen_deactivator armour stand
#from clock

#destroy
execute at @s unless block ~ ~ ~ minecraft:cobblestone_wall[east=false,north=false,south=false,up=true,waterlogged=false,west=false] run function gm4_endermen_deactivators:destroy
execute at @s unless block ~ ~1 ~ minecraft:grass_block run function gm4_endermen_deactivators:destroy
execute at @s unless block ~ ~2 ~ minecraft:air run function gm4_endermen_deactivators:destroy
execute at @s unless block ~1 ~2 ~ minecraft:air run function gm4_endermen_deactivators:destroy
execute at @s unless block ~-1 ~2 ~ minecraft:air run function gm4_endermen_deactivators:destroy
execute at @s unless block ~ ~2 ~1 minecraft:air run function gm4_endermen_deactivators:destroy
execute at @s unless block ~ ~2 ~-1 minecraft:air run function gm4_endermen_deactivators:destroy