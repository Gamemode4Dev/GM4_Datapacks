#run from cables/shoot_arrow
#@s = player using the crossbow

#check if player is facing roughly in one of the cardinal directions, unspool string if this is true
execute positioned ~ ~ ~-1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=170..190] run function gm4_crossbow_cartridges:cables/unspool_string_north
execute positioned ~1 ~ ~ if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=-100..-80] run function gm4_crossbow_cartridges:cables/unspool_string_east
execute positioned ~ ~ ~1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=-10..10] run function gm4_crossbow_cartridges:cables/unspool_string_south
execute positioned ~-1 ~ ~ if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=80..100] run function gm4_crossbow_cartridges:cables/unspool_string_west
