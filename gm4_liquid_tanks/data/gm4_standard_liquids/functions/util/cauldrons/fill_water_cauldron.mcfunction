#@s = liquid tank, positioned at empty cauldron
#run from standard_liquids:util/water_tank

execute if score @s gm4_lt_util matches 3.. run scoreboard players remove @s gm4_lt_value 3
execute if score @s gm4_lt_util matches 3.. run setblock ~ ~ ~ minecraft:water_cauldron[level=3]
execute if score @s gm4_lt_util matches 3.. run playsound item.bucket.empty block @a[distance=..10]
execute if score @s gm4_lt_util matches 3.. run scoreboard players remove @s gm4_lt_util 3
