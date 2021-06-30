# @s = player holding an Audere tool
# at @s
# run from active_tool

scoreboard players operation $tool_max_damage gm4_ml_data -= $tool_current_damage gm4_ml_data

execute if score $tool_max_damage gm4_ml_data matches 69..184 run effect give @s minecraft:haste 2 0
execute if score $tool_max_damage gm4_ml_data matches 26..68 run effect give @s minecraft:haste 2 1
execute if score $tool_max_damage gm4_ml_data matches 10..25 run effect give @s minecraft:haste 2 2
execute if score $tool_max_damage gm4_ml_data matches ..9 run effect give @s minecraft:haste 2 3
