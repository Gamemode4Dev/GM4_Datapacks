# run from active_tool
# @s = player holding an Audere tool

scoreboard players operation tool_max_damage gm4_ml_data -= tool_current_damage gm4_ml_data

execute if score tool_max_damage gm4_ml_data matches 936..1248 run effect give @s minecraft:haste 2 0
execute if score tool_max_damage gm4_ml_data matches 624..935 run effect give @s minecraft:haste 2 1
execute if score tool_max_damage gm4_ml_data matches 312..623 run effect give @s minecraft:haste 2 2
execute if score tool_max_damage gm4_ml_data matches 156..311 run effect give @s minecraft:haste 2 3
execute if score tool_max_damage gm4_ml_data matches ..155 run effect give @s minecraft:haste 2 4
