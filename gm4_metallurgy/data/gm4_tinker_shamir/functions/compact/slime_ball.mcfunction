# @s = player holding tinker sword
# at @s
# run from tool/sword

clear @s slime_ball 63
give @s slime_block 7
playsound minecraft:block.slime_block.fall player @s ~ ~ ~ 0.2 0.8
scoreboard players set $success gm4_ml_data 1
