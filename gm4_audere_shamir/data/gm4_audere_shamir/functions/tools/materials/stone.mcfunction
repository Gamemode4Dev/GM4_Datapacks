# run from active_tool
# @s = player holding an Audere tool

scoreboard players operation $tool_max_damage gm4_ml_data -= $tool_current_damage gm4_ml_data

execute if score $tool_max_damage gm4_ml_data matches 22..63 run effect give @s minecraft:haste 2 0
execute if score $tool_max_damage gm4_ml_data matches 8..21 run effect give @s minecraft:haste 2 1
execute if score $tool_max_damage gm4_ml_data matches 3..7 run effect give @s minecraft:haste 2 2
execute if score $tool_max_damage gm4_ml_data matches ..2 run effect give @s minecraft:haste 2 3