# @s = player holding tinker pickaxe
# at @s
# run from tool/pickaxe

clear @s emerald 63
give @s emerald_block 7
playsound block.glass.fall ambient @a ~ ~ ~ 0.2 0.8
scoreboard players set $success gm4_ml_data 1
