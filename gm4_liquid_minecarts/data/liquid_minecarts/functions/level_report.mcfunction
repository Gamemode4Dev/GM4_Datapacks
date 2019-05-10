#run from level_report_ray
#@s = players looking at liquid minecart
execute as @e[type=command_block_minecart,tag=gm4_liquid_minecart,distance=..1,limit=1,sort=nearest] run function liquid_minecarts:liquid_value_update
title @s actionbar ["",{"score":{"name":"@e[type=command_block_minecart,tag=gm4_liquid_minecart,distance=..1,limit=1,sort=nearest]","objective":"gm4_lt_disp_val"},"color":"dark_green"},{"text":"% Full","color":"dark_green"}]
tag @s add gm4_lt_found_tank
