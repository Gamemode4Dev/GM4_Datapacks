# @s = player holding an Audere tool
# at @s
# run from active_tool

scoreboard players operation $tool_max_damage gm4_ml_data -= $tool_current_damage gm4_ml_data

execute if score $tool_max_damage gm4_ml_data matches 551..1494 run effect give @s minecraft:haste 2 0
execute if score $tool_max_damage gm4_ml_data matches 203..550 run effect give @s minecraft:haste 2 1
execute if score $tool_max_damage gm4_ml_data matches 75..202 run effect give @s minecraft:haste 2 2
execute if score $tool_max_damage gm4_ml_data matches ..74 run effect give @s minecraft:haste 2 3
