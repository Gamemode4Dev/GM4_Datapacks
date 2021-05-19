# run from active_tool
# @s = player holding an Audere tool

scoreboard players operation tool_max_damage gm4_ml_data -= tool_current_damage gm4_ml_data

execute if score tool_max_damage gm4_ml_data matches 78..104 run effect give @s minecraft:haste 2 0
execute if score tool_max_damage gm4_ml_data matches 52..77 run effect give @s minecraft:haste 2 1
execute if score tool_max_damage gm4_ml_data matches 26..51 run effect give @s minecraft:haste 2 2
execute if score tool_max_damage gm4_ml_data matches 13..25 run effect give @s minecraft:haste 2 3
execute if score tool_max_damage gm4_ml_data matches ..12 run effect give @s minecraft:haste 2 4
