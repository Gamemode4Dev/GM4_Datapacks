# run from active_tool
# @s = player holding the moneo tool

scoreboard players operation $tool_max_damage gm4_ml_data -= $tool_current_damage gm4_ml_data

execute if score $tool_max_damage gm4_ml_data matches 6..10 run effect give @s minecraft:mining_fatigue 2 0
execute if score $tool_max_damage gm4_ml_data matches ..10 at @s run playsound minecraft:block.lantern.hit master @s ~ ~ ~ 5 1.4
execute if score $tool_max_damage gm4_ml_data matches ..5 run effect give @s minecraft:mining_fatigue 2 1
