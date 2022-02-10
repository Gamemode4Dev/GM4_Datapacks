# @s = player holding tinker shovel
# at @s
# run from tool/shovel

clear @s clay_ball 64
give @s clay 16
playsound block.gravel.fall ambient @a ~ ~ ~ 0.2 0.8
scoreboard players set $success gm4_ml_data 1
