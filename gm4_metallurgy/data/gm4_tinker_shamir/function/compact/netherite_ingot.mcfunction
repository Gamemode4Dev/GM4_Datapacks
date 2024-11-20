# @s = player holding tinker pickaxe
# at @s
# run from tool/pickaxe

clear @s netherite_ingot 63
give @s netherite_block 7
playsound block.metal.fall ambient @a ~ ~ ~ 0.2 0.8
scoreboard players set $success gm4_ml_data 1
