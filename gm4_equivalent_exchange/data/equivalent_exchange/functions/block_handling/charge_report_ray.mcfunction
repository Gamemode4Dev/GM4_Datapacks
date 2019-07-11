#@s = all players 6 blocks around a recharge altar
#run from block_handling/recharge_altar

execute anchored eyes positioned ^ ^ ^.5 if block ~ ~ ~ dropper align xyz positioned ~0.5 ~ ~0.5 if entity @e[type=armor_stand,tag=gm4_alchemical_crafter,distance=..0.5] run function equivalent_exchange:block_handling/charge_report_check
execute unless entity @s[tag=gm4_ee_found_altar] anchored eyes positioned ^ ^ ^1.5 if block ~ ~ ~ dropper align xyz positioned ~0.5 ~ ~0.5 if entity @e[type=armor_stand,tag=gm4_alchemical_crafter,distance=..0.5] run function equivalent_exchange:block_handling/charge_report_check
execute unless entity @s[tag=gm4_ee_found_altar] anchored eyes positioned ^ ^ ^2.5 if block ~ ~ ~ dropper align xyz positioned ~0.5 ~ ~0.5 if entity @e[type=armor_stand,tag=gm4_alchemical_crafter,distance=..0.5] run function equivalent_exchange:block_handling/charge_report_check
execute unless entity @s[tag=gm4_ee_found_altar] anchored eyes positioned ^ ^ ^3.5 if block ~ ~ ~ dropper align xyz positioned ~0.5 ~ ~0.5 if entity @e[type=armor_stand,tag=gm4_alchemical_crafter,distance=..0.5] run function equivalent_exchange:block_handling/charge_report_check

tag @s remove gm4_ee_found_altar
