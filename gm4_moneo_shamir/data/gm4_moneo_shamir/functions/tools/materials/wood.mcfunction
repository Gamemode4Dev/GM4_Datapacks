# run from active
# @s = player holding the moneo tool

scoreboard players operation tool_max_damage gm4_ml_data -= tool_current_damage gm4_ml_data

execute if score tool_max_damage gm4_ml_data matches 11..20 run effect give @s mining_fatigue 2 0
execute if score tool_max_damage gm4_ml_data matches ..20 at @s run playsound block.lantern.hit master @s ~ ~ ~ 5 0
execute if score tool_max_damage gm4_ml_data matches ..10 run effect give @s mining_fatigue 2 1
