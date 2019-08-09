# run from active
# @s = player holding the moneo tool

execute if score tool_max_damage gm4_ml_data matches 21..35 run effect give @s minecraft:mining_fatigue 2 0
execute if score tool_max_damage gm4_ml_data matches 21..35 at @s run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.8
execute if score tool_max_damage gm4_ml_data matches ..20 run effect give @s minecraft:mining_fatigue 2 1
execute if score tool_max_damage gm4_ml_data matches ..20 at @s run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.5