# run from active_tool
# @s = player holding an Audere tool

scoreboard players operation $tool_max_damage gm4_ml_data -= $tool_current_damage gm4_ml_data

execute if score $tool_max_damage gm4_ml_data matches 331..971 run effect give @s minecraft:haste 2 0
execute if score $tool_max_damage gm4_ml_data matches 112..330 run effect give @s minecraft:haste 2 1
execute if score $tool_max_damage gm4_ml_data matches 38..111 run effect give @s minecraft:haste 2 2
execute if score $tool_max_damage gm4_ml_data matches ..37 run effect give @s minecraft:haste 2 3
