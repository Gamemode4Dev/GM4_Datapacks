execute as @a[scores={gm4_st_sand=1..}] at @s if block ~ ~ ~ minecraft:water if block ~ ~1 ~ minecraft:water if block ~ ~2 ~ minecraft:water if block ~ ~3 ~ minecraft:water if block ~ ~4 ~ minecraft:water anchored eyes positioned ^ ^ ^2 at @e[type=minecraft:item,limit=1,distance=..3,nbt={Item:{id:"minecraft:sand"},Age:0s}] run function sunken_treasure:spawn_treasure

scoreboard players reset @a gm4_st_sand

schedule function sunken_treasure:tick 1t
