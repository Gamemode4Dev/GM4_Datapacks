#@s = server. Scheduled function
#scheduled by standard_liquids:util/furnace_fueling/furnace_start

#provide lava to tanks ignited last tick
execute as @e[type=marker,tag=gm4_liquid_tank,tag=gm4_lt_furnace_start] at @s align xyz positioned ~ ~1 ~ at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_furnace,dx=0,limit=4] positioned ^ ^-1 ^1 run function gm4_standard_liquids:util/furnace_fueling/fuel_furnace
