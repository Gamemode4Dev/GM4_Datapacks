#@s refers to player shooting the arrow
#run from determine_direction

#place string conditionally (first and last need to be attached)
execute if score string_placed gm4_string_count matches 0 run setblock ~ ~ ~ minecraft:tripwire[attached=true,north=true,south=true] replace
execute if score string_placed gm4_string_count matches 1..39 run setblock ~ ~ ~ minecraft:tripwire[north=true,south=true] replace
execute if score string_placed gm4_string_count matches 40 run setblock ~ ~ ~ minecraft:tripwire[attached=true,north=true,south=true] replace

#particle for effect
particle dust 1 1 1 1 ~ ~ ~ 0 0 0 1 5 normal

#remove a string from the player
clear @s[gamemode=!creative] minecraft:string 1

#adjust scoreboards
scoreboard players remove @s gm4_string_count 1
scoreboard players add string_placed gm4_string_count 1

#recursion
execute positioned ~ ~ ~-1 if block ~ ~ ~ #crossbow_cables:airtype if score @s gm4_string_count matches 1.. if score string_placed gm4_string_count matches ..39 run function crossbow_cables:unspool_string_north