# @s = player holding tinker pickaxe
# at @s
# run from tool/pickaxe

clear @s redstone 63
give @s redstone_block 7
playsound block.stone.fall player @s ~ ~ ~ 0.2 0.8
scoreboard players set $success gm4_ml_data 1
