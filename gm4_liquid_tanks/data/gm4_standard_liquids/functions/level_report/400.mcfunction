#@s = player looking at tank positioned as tank stand
#run from standard_liquids:level_report_check

#calculate displayed value from raw value
scoreboard players operation $gm4_lt_report_calc gm4_lt_value = @e[type=marker,tag=gm4_liquid_tank,distance=..0.1,limit=1] gm4_lt_value
scoreboard players operation $gm4_lt_report_remain gm4_lt_value = $gm4_lt_report_calc gm4_lt_value
scoreboard players set #4 gm4_lt_value 4
scoreboard players operation $gm4_lt_report_calc gm4_lt_value /= #4 gm4_lt_value
scoreboard players operation $gm4_lt_report_remain gm4_lt_value %= #4 gm4_lt_value

execute if score $gm4_lt_report_calc gm4_lt_value matches 0 if score $gm4_lt_report_remain gm4_lt_value matches 1.. run scoreboard players reset $gm4_lt_report_calc gm4_lt_value
execute if score $gm4_lt_report_remain gm4_lt_value matches 0 run title @s actionbar [{"score":{"name":"$gm4_lt_report_calc","objective":"gm4_lt_value"},"color":"dark_green"},{"text":" / 100  ","color":"dark_green"},{"translate":"%1$s%3427655$s","with":["Buckets",{"translate":"text.gm4.liquid_tanks.level_report.buckets"}],"color":"dark_green"}]
execute if score $gm4_lt_report_remain gm4_lt_value matches 1 run title @s actionbar [{"score":{"name":"$gm4_lt_report_calc","objective":"gm4_lt_value"},"color":"dark_green"},{"text":"¼ / 100  ","color":"dark_green"},{"translate":"%1$s%3427655$s","with":["Buckets",{"translate":"text.gm4.liquid_tanks.level_report.buckets"}],"color":"dark_green"}]
execute if score $gm4_lt_report_remain gm4_lt_value matches 2 run title @s actionbar [{"score":{"name":"$gm4_lt_report_calc","objective":"gm4_lt_value"},"color":"dark_green"},{"text":"½ / 100  ","color":"dark_green"},{"translate":"%1$s%3427655$s","with":["Buckets",{"translate":"text.gm4.liquid_tanks.level_report.buckets"}],"color":"dark_green"}]
execute if score $gm4_lt_report_remain gm4_lt_value matches 3 run title @s actionbar [{"score":{"name":"$gm4_lt_report_calc","objective":"gm4_lt_value"},"color":"dark_green"},{"text":"¾ / 100  ","color":"dark_green"},{"translate":"%1$s%3427655$s","with":["Buckets",{"translate":"text.gm4.liquid_tanks.level_report.buckets"}],"color":"dark_green"}]

scoreboard players reset gm4_lt_report_calc gm4_lt_value
tag @s add gm4_lt_found_tank
