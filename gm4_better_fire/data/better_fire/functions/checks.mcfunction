#check block at flame arrow
#@s - @e[nbt=!{Fire:-1s},type=arrow]
#called by better_fire:main

#set fire block if air
execute if data entity @s inBlockState if block ~ ~ ~ #better_fire:air run playsound minecraft:block.fire.extinguish block @a[distance=..20] ~ ~ ~ 100 2
setblock ~ ~ ~ fire keep

#campfire lighting
execute if block ~ ~ ~ minecraft:campfire[waterlogged=false,lit=false] run function better_fire:set_campfire
