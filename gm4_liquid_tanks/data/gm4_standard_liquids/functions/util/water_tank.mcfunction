#@s = water liquid tank
#run from util_above

execute at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_cauldron,dx=0] run scoreboard players add @s gm4_lt_util 3
scoreboard players operation @s gm4_lt_util < @s gm4_lt_value
execute at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_cauldron,dx=0,limit=4] positioned ^ ^-1 ^1 if block ~ ~ ~ cauldron[level=0] run function gm4_standard_liquids:util/water_cauldron
scoreboard players reset @s gm4_lt_util
