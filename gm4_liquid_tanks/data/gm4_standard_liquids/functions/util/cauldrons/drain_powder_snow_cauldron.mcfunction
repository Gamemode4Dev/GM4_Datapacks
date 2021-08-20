#@s = snow tank below a cauldron, at the cauldron
# run from standard_liquids:util/drain_cauldron

scoreboard players set $drain_success gm4_lt_util 0
execute store success score $drain_success gm4_lt_util if block ~ ~ ~ minecraft:powder_snow_cauldron[level=1] if score @s gm4_lt_value matches ..299 run scoreboard players add @s gm4_lt_value 1
execute unless score $drain_success gm4_lt_util matches 1 store success score $drain_success gm4_lt_util if block ~ ~ ~ minecraft:powder_snow_cauldron[level=2] if score @s gm4_lt_value matches ..298 run scoreboard players add @s gm4_lt_value 2
execute unless score $drain_success gm4_lt_util matches 1 store success score $drain_success gm4_lt_util if block ~ ~ ~ minecraft:powder_snow_cauldron[level=3] if score @s gm4_lt_value matches ..297 run scoreboard players add @s gm4_lt_value 3

execute if score $drain_success gm4_lt_util matches 1 run setblock ~ ~ ~ cauldron
execute if score $drain_success gm4_lt_util matches 1 run playsound item.bucket.fill_powder_snow block @a[distance=..10]
