# @s = player holding an Audere tool
# at @s
# run from active_tool

scoreboard players operation $tool_max_damage gm4_ml_data -= $tool_current_damage gm4_ml_data

execute if score $tool_max_damage gm4_ml_data matches 254..746 run effect give @s minecraft:haste 2 0
execute if score $tool_max_damage gm4_ml_data matches 86..253 run effect give @s minecraft:haste 2 1
execute if score $tool_max_damage gm4_ml_data matches 29..85 run effect give @s minecraft:haste 2 2
execute if score $tool_max_damage gm4_ml_data matches ..28 run effect give @s minecraft:haste 2 3
