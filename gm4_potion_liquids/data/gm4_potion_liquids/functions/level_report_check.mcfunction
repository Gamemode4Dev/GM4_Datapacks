#@s = player looking at tank positioned at tank stand
#run from #liquid_tanks:level_report_check in liquid_tanks:level_report_ray

#actual max of 300
execute if score @e[type=armor_stand,tag=gm4_liquid_tank,distance=..0.5,limit=1] gm4_lt_max matches 300 run function gm4_potion_liquids:level_report/300
