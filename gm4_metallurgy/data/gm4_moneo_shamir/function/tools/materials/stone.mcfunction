# run from active_tool
# @s = player holding the moneo tool

scoreboard players operation $tool_max_damage gm4_ml_data -= $tool_current_damage gm4_ml_data

execute if score $tool_max_damage gm4_ml_data matches 21..30 run effect give @s minecraft:mining_fatigue 2 0
execute if score $tool_max_damage gm4_ml_data matches ..30 at @s run playsound minecraft:block.lantern.hit master @s ~ ~ ~ 5 0.7
execute if score $tool_max_damage gm4_ml_data matches ..20 run effect give @s minecraft:mining_fatigue 2 1
