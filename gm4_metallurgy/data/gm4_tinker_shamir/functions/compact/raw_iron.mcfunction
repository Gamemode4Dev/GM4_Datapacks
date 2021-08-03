# @s = player holding tinker pickaxe
# at @s
# run from tool/pickaxe

clear @s raw_iron 63
give @s raw_iron_block 7
playsound block.stone.fall ambient @a ~ ~ ~ 0.2 0.8
