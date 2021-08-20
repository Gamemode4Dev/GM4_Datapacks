#@s = liquid tank filling a cauldron
#run from util_above

execute at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_cauldron,dx=0] run scoreboard players add @s gm4_lt_util 3
scoreboard players operation @s gm4_lt_util < @s gm4_lt_value
execute if entity @s[tag=gm4_lt_water] at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_cauldron,dx=0,limit=4] positioned ^ ^-1 ^1 if block ~ ~ ~ minecraft:cauldron run function gm4_standard_liquids:util/cauldrons/fill_water_cauldron
execute if entity @s[tag=gm4_lt_lava] at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_cauldron,dx=0,limit=4] positioned ^ ^-1 ^1 if block ~ ~ ~ minecraft:cauldron run function gm4_standard_liquids:util/cauldrons/fill_lava_cauldron
execute if entity @s[tag=gm4_lt_powder_snow] at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_cauldron,dx=0,limit=4] positioned ^ ^-1 ^1 if block ~ ~ ~ minecraft:cauldron run function gm4_standard_liquids:util/cauldrons/fill_powder_snow_cauldron
scoreboard players reset @s gm4_lt_util
