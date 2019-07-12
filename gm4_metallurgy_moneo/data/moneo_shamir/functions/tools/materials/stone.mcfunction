# run from active
# @s = player holding the moneo tool

scoreboard players set tool_max_damage gm4_ml_data 131

scoreboard players operation tool_max_damage gm4_ml_data -= tool_current_damage gm4_ml_data

execute if score tool_max_damage gm4_ml_data matches 21..30 run effect give @s minecraft:mining_fatigue 2 0
execute if score tool_max_damage gm4_ml_data matches 21..30 at @s run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.8
execute if score tool_max_damage gm4_ml_data matches ..20 run effect give @s minecraft:mining_fatigue 2 1
execute if score tool_max_damage gm4_ml_data matches ..20 at @s run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.5