#check block at flame arrow
#@s - @e[type=minecraft:arrow,nbt=!{Fire:-1s}]
#called by better_fire:main

#set fire block if air
execute if data entity @s inBlockState if block ~ ~ ~ #better_fire:air run function better_fire:set_fire

#campfire lighting
execute if block ~ ~ ~ minecraft:campfire[waterlogged=false,lit=false] run function better_fire:set_campfire
