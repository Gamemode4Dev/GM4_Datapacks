# @s = player holding tinker shovel
# at @s
# run from tool/shovel

clear @s snowball 16
give @s snow_block 4
playsound block.snow.fall player @s ~ ~ ~ 0.2 0.8
scoreboard players set $success gm4_ml_data 1
