# run from active
# @s = player holding the moneo tool

execute if score tool_max_damage gm4_ml_data matches 21..50 run effect give @s minecraft:mining_fatigue 2 0
execute if score tool_max_damage gm4_ml_data matches ..50 at @s run playsound minecraft:block.lantern.hit master @s ~ ~ ~ 5 2
execute if score tool_max_damage gm4_ml_data matches ..20 run effect give @s minecraft:mining_fatigue 2 1