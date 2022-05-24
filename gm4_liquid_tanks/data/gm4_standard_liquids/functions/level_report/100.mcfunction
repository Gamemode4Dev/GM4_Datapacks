#@s = player looking at tank positioned as tank stand
#run from standard_liquids:level_report_check

title @s actionbar [{"score":{"name":"@e[type=marker,tag=gm4_liquid_tank,distance=..0.1,limit=1]","objective":"gm4_lt_value"},"color":"dark_green"},{"text":" / 100  ","color":"dark_green"},{"translate":"%1$s%3427655$s","with":["Buckets",{"translate":"text.gm4.liquid_tanks.level_report.buckets"}],"color":"dark_green"}]

tag @s add gm4_lt_found_tank
