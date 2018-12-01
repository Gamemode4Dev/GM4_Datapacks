#@s = flower_checker area_effect_cloud
#Run from block_handling/recharge_altar

#move the AEC to the chosen x and z
execute if score randomX gm4_ee_charge matches 8.. at @s run tp @s ~8 ~ ~
execute if score randomX gm4_ee_charge matches 8.. run scoreboard players remove randomX gm4_ee_charge 8
execute if score randomX gm4_ee_charge matches 4.. at @s run tp @s ~4 ~ ~
execute if score randomX gm4_ee_charge matches 4.. run scoreboard players remove randomX gm4_ee_charge 4
execute if score randomX gm4_ee_charge matches 2.. at @s run tp @s ~2 ~ ~
execute if score randomX gm4_ee_charge matches 2.. run scoreboard players remove randomX gm4_ee_charge 2
execute if score randomX gm4_ee_charge matches 1.. at @s run tp @s ~1 ~ ~
execute if score randomX gm4_ee_charge matches 1.. run scoreboard players remove randomX gm4_ee_charge 1

execute if score randomZ gm4_ee_charge matches 8.. at @s run tp @s ~ ~ ~8
execute if score randomZ gm4_ee_charge matches 8.. run scoreboard players remove randomZ gm4_ee_charge 8
execute if score randomZ gm4_ee_charge matches 4.. at @s run tp @s ~ ~ ~4
execute if score randomZ gm4_ee_charge matches 4.. run scoreboard players remove randomZ gm4_ee_charge 4
execute if score randomZ gm4_ee_charge matches 2.. at @s run tp @s ~ ~ ~2
execute if score randomZ gm4_ee_charge matches 2.. run scoreboard players remove randomZ gm4_ee_charge 2
execute if score randomZ gm4_ee_charge matches 1.. at @s run tp @s ~ ~ ~1
execute if score randomZ gm4_ee_charge matches 1.. run scoreboard players remove randomZ gm4_ee_charge 1

execute at @s run tp @s ~ ~-1 ~

#check if location has a valid fuel source
execute at @s if block ~ ~ ~ #equivalent_exchange:consumable_block run function equivalent_exchange:recharge/consume_flower