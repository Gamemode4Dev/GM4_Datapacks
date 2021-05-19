# run from active_tool
# @s = player holding an Audere tool

scoreboard players operation tool_max_damage gm4_ml_data -= tool_current_damage gm4_ml_data

execute if score tool_max_damage gm4_ml_data matches 1218..1624 run effect give @s minecraft:haste 2 0
execute if score tool_max_damage gm4_ml_data matches 812..1217 run effect give @s minecraft:haste 2 1
execute if score tool_max_damage gm4_ml_data matches 406..811 run effect give @s minecraft:haste 2 2
execute if score tool_max_damage gm4_ml_data matches 203..405 run effect give @s minecraft:haste 2 3
execute if score tool_max_damage gm4_ml_data matches ..202 run effect give @s minecraft:haste 2 4
