#@s = lava liquid tank
#run from util_above

execute at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_furnace,dx=0] run scoreboard players add @s gm4_lt_util 1
scoreboard players operation @s gm4_lt_util < @s gm4_lt_value
execute at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_furnace,dx=0,limit=4] positioned ^ ^-1 ^1 if block ~ ~ ~ #gm4_standard_liquids:furnace[lit=false]{Items:[{Slot:0b}]} unless block ~ ~ ~ #gm4_standard_liquids:furnace{Items:[{Slot:1b}]} run function gm4_standard_liquids:util/furnace_fueling/furnace_start
scoreboard players reset @s gm4_lt_util
