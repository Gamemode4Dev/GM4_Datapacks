#@s = all players at @s
#run from main

execute anchored eyes positioned ^ ^ ^.5 if entity @e[distance=..1,type=command_block_minecart,tag=gm4_liquid_minecart,limit=1,sort=nearest] run function liquid_minecarts:level_report
execute unless entity @s[tag=gm4_lt_found_tank] anchored eyes positioned ^ ^ ^1.5 if entity @e[distance=..1,type=command_block_minecart,tag=gm4_liquid_minecart,limit=1,sort=nearest] run function liquid_minecarts:level_report
execute unless entity @s[tag=gm4_lt_found_tank] anchored eyes positioned ^ ^ ^2.5 if entity @e[distance=..1,type=command_block_minecart,tag=gm4_liquid_minecart,limit=1,sort=nearest] run function liquid_minecarts:level_report
execute unless entity @s[tag=gm4_lt_found_tank] anchored eyes positioned ^ ^ ^3.5 if entity @e[distance=..1,type=command_block_minecart,tag=gm4_liquid_minecart,limit=1,sort=nearest] run function liquid_minecarts:level_report

tag @s remove gm4_lt_found_tank
