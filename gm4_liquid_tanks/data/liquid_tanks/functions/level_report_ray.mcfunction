#@s = all players at @s
#run from main

execute positioned ^ ^ ^.5 if block ~ ~ ~ hopper align xyz positioned ~0.5 ~ ~0.5 if entity @e[type=armor_stand,tag=gm4_liquid_tank,distance=..0.5] run function #liquid_tanks:level_report_check
execute unless entity @s[tag=gm4_lt_found_tank] positioned ^ ^ ^1.5 if block ~ ~ ~ hopper align xyz positioned ~0.5 ~ ~0.5 if entity @e[type=armor_stand,tag=gm4_liquid_tank,distance=..0.5] run function #liquid_tanks:level_report_check
execute unless entity @s[tag=gm4_lt_found_tank] positioned ^ ^ ^2.5 if block ~ ~ ~ hopper align xyz positioned ~0.5 ~ ~0.5 if entity @e[type=armor_stand,tag=gm4_liquid_tank,distance=..0.5] run function #liquid_tanks:level_report_check
execute unless entity @s[tag=gm4_lt_found_tank] positioned ^ ^ ^3.5 if block ~ ~ ~ hopper align xyz positioned ~0.5 ~ ~0.5 if entity @e[type=armor_stand,tag=gm4_liquid_tank,distance=..0.5] run function #liquid_tanks:level_report_check

tag @s remove gm4_lt_found_tank
