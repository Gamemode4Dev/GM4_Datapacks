#run from cables/shoot_arrow
#@s = player using the crossbow

#kill arrow
kill @e[type=minecraft:arrow,distance=..2,limit=1,sort=nearest]

#south - extra check because -360, 0, and 360 are all the same angle
execute positioned ~ ~ ~1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=-10..10] run function gm4_crossbow_cartridges:cables/unspool_string_south
execute positioned ~ ~ ~1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=-360..-350] run function gm4_crossbow_cartridges:cables/unspool_string_south
execute positioned ~ ~ ~1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=350..360] run function gm4_crossbow_cartridges:cables/unspool_string_south

#west
execute positioned ~-1 ~ ~ if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=80..100] run function gm4_crossbow_cartridges:cables/unspool_string_west
execute positioned ~-1 ~ ~ if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=-280..-260] run function gm4_crossbow_cartridges:cables/unspool_string_west

#north
execute positioned ~ ~ ~-1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=170..190] run function gm4_crossbow_cartridges:cables/unspool_string_north
execute positioned ~ ~ ~-1 if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=-190..-170] run function gm4_crossbow_cartridges:cables/unspool_string_north

#east
execute positioned ~1 ~ ~ if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=260..280] run function gm4_crossbow_cartridges:cables/unspool_string_east
execute positioned ~1 ~ ~ if block ~ ~ ~ #gm4_crossbow_cartridges:string_replaceable if entity @s[y_rotation=-100..-80] run function gm4_crossbow_cartridges:cables/unspool_string_east
