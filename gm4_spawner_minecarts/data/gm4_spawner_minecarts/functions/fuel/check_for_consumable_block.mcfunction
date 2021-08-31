#@s = flower_checker area_effect_cloud at @s
#run from spawner_minecarts:fuel/active_regeneration

#move the AEC to the chosen x and z
execute at @s if score randomX gm4_spawner_fuel matches 8.. run tp @s ~8 ~ ~
execute if score randomX gm4_spawner_fuel matches 8.. run scoreboard players remove randomX gm4_spawner_fuel 8
execute at @s if score randomX gm4_spawner_fuel matches 4.. run tp @s ~4 ~ ~
execute if score randomX gm4_spawner_fuel matches 4.. run scoreboard players remove randomX gm4_spawner_fuel 4
execute at @s if score randomX gm4_spawner_fuel matches 2.. run tp @s ~2 ~ ~
execute if score randomX gm4_spawner_fuel matches 2.. run scoreboard players remove randomX gm4_spawner_fuel 2
execute at @s if score randomX gm4_spawner_fuel matches 1.. run tp @s ~1 ~ ~
execute if score randomX gm4_spawner_fuel matches 1.. run scoreboard players remove randomX gm4_spawner_fuel 1

execute at @s if score randomZ gm4_spawner_fuel matches 8.. run tp @s ~ ~ ~8
execute if score randomZ gm4_spawner_fuel matches 8.. run scoreboard players remove randomZ gm4_spawner_fuel 8
execute at @s if score randomZ gm4_spawner_fuel matches 4.. run tp @s ~ ~ ~4
execute if score randomZ gm4_spawner_fuel matches 4.. run scoreboard players remove randomZ gm4_spawner_fuel 4
execute at @s if score randomZ gm4_spawner_fuel matches 2.. run tp @s ~ ~ ~2
execute if score randomZ gm4_spawner_fuel matches 2.. run scoreboard players remove randomZ gm4_spawner_fuel 2
execute at @s if score randomZ gm4_spawner_fuel matches 1.. run tp @s ~ ~ ~1
execute if score randomZ gm4_spawner_fuel matches 1.. run scoreboard players remove randomZ gm4_spawner_fuel 1

#check if location has a valid fuel source
execute at @s if block ~ ~ ~ #gm4_spawner_minecarts:consumable_block run function gm4_spawner_minecarts:fuel/analyze_consumable_block
