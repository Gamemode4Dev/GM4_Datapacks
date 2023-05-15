#@s = players looking at liquid minecart
#run from level_report_ray

execute as @e[type=command_block_minecart,tag=gm4_liquid_minecart,distance=..1,limit=1,sort=nearest] run function gm4_liquid_minecarts:liquid_value_update
title @s actionbar [{"score":{"name":"@e[type=command_block_minecart,tag=gm4_liquid_minecart,distance=..1,limit=1,sort=nearest]","objective":"gm4_lm_data"},"color":"dark_green"},{"translate":"text.gm4.liquid_minecarts.level_report","fallback":"% Full","color":"dark_green"}]
tag @s add gm4_lt_found_tank
