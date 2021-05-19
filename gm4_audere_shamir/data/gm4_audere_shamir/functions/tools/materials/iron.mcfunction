# run from active_tool
# @s = player holding an Audere tool

scoreboard players operation tool_max_damage gm4_ml_data -= tool_current_damage gm4_ml_data

execute if score tool_max_damage gm4_ml_data matches 150..200 run effect give @s minecraft:haste 2 0
execute if score tool_max_damage gm4_ml_data matches 100..149 run effect give @s minecraft:haste 2 1
execute if score tool_max_damage gm4_ml_data matches 50..99 run effect give @s minecraft:haste 2 2
execute if score tool_max_damage gm4_ml_data matches 25..49 run effect give @s minecraft:haste 2 3
execute if score tool_max_damage gm4_ml_data matches ..24 run effect give @s minecraft:haste 2 4
