#werk
scoreboard players add @e[type=armor_stand,tag=gm4_end_deact_live] gm4_end_deact 1
execute as @e[type=armor_stand,tag=gm4_end_deact] at @s run function gm4_endermen_deactivators:endermen_deactivator
execute as @e[type=armor_stand,tag=gm4_end_deact_live] at @s run function gm4_endermen_deactivators:endermen_deactivator_live
execute as @e[type=armor_stand,tag=gm4_end_deact_dead] at @s run function gm4_endermen_deactivators:endermen_deactivator_dead

#check for creation
execute as @e[type=item] if entity @s[nbt={Item:{id:"minecraft:emerald",Count:1b},OnGround:1b}] at @s if block ~ ~ ~ minecraft:wither_skeleton_skull if block ~ ~-1 ~ minecraft:grass_block if block ~ ~-2 ~ minecraft:cobblestone_wall[east=false,north=false,south=false,up=true,waterlogged=false,west=false] run function gm4_endermen_deactivators:check_deactivator_creation

#make it look at cha
execute as @e[type=minecraft:armor_stand,tag=gm4_end_deact_live] at @s run teleport @s ~ ~ ~ facing entity @p eyes

#clock
schedule function gm4_endermen_deactivators:main 16t