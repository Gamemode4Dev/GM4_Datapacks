execute as @a[scores={gm4_st_sand=1..}] at @s if predicate gm4_sunken_treasure:in_deep_water anchored eyes positioned ^ ^ ^2 at @e[type=minecraft:item,limit=1,distance=..2.5,nbt={Item:{id:"minecraft:sand"},Age:0s}] run function gm4_sunken_treasure:treasure_sand
execute as @a[scores={gm4_st_gravel=1..}] at @s if predicate gm4_sunken_treasure:in_deep_water anchored eyes positioned ^ ^ ^2 run function gm4_sunken_treasure:check_gravel

scoreboard players reset @a gm4_st_sand
scoreboard players reset @a gm4_st_gravel

schedule function gm4_sunken_treasure:tick 1t
