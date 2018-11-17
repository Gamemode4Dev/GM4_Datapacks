#@s = player looking at tank positioned as tank stand
#run from standard_liquids:level_report_check

title @s actionbar ["",{"score":{"name":"@e[type=armor_stand,tag=gm4_liquid_tank,distance=..0.5]","objective":"gm4_lt_value"},"color":"dark_green"},{"text":" / 30 ","color":"dark_green"},{"text":" Buckets","color":"dark_green"}]

tag @s add gm4_lt_found_tank
