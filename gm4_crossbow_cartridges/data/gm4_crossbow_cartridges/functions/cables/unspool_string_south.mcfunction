#run from cables/determine_direction
#@s = player using the crossbow

#if the block is string, adjust scoreboards and return string so net effect is 0
execute if block ~ ~ ~ minecraft:tripwire run function gm4_crossbow_cartridges:cables/compensate

#place string conditionally (first and last need to be attached)
execute if score @s gm4_cb_strplace matches 0 run setblock ~ ~ ~ minecraft:tripwire[attached=true,north=true,south=true] replace
execute if score @s gm4_cb_strplace matches 1..39 run setblock ~ ~ ~ minecraft:tripwire[north=true,south=true] replace
execute if score @s gm4_cb_strplace matches 40 run setblock ~ ~ ~ minecraft:tripwire[attached=true,north=true,south=true] replace

#particle for effect
particle dust 1 1 1 1 ~ ~ ~ 0 0 0 1 5 normal

#remove a string from the player
clear @s[gamemode=!creative] minecraft:string 1

#adjust scoreboards
scoreboard players remove @s gm4_cb_strcount 1
scoreboard players add @s gm4_cb_strplace 1

#give advancement
execute if score @s gm4_cb_strplace matches 40 run advancement grant @s only gm4:crossbow_cartridges_string

#recursion
execute positioned ~ ~ ~1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if score @s gm4_cb_strcount matches 1.. if score @s gm4_cb_strplace matches ..39 run function gm4_crossbow_cartridges:cables/unspool_string_south