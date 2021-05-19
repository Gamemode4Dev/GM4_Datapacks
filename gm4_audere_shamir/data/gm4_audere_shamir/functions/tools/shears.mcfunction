# run from active_tool
# @s = player holding an Audere tool

scoreboard players operation tool_max_damage gm4_ml_data -= tool_current_damage gm4_ml_data

execute if score tool_max_damage gm4_ml_data matches 142..190 run effect give @s minecraft:haste 2 0
execute if score tool_max_damage gm4_ml_data matches 95..143 run effect give @s minecraft:haste 2 1
execute if score tool_max_damage gm4_ml_data matches 47..94 run effect give @s minecraft:haste 2 2
execute if score tool_max_damage gm4_ml_data matches 23..46 run effect give @s minecraft:haste 2 3
execute if score tool_max_damage gm4_ml_data matches ..22 run effect give @s minecraft:haste 2 4
