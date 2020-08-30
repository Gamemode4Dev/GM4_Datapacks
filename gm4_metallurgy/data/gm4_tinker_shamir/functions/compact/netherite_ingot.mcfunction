# called to compact netherite ingots into blocks
# gm4_tinker_shamir:compact/netherite_ingot | called by gm4_tinker_shamir:compact/pickaxe

clear @s netherite_ingot 63
give @s netherite_block 7
playsound block.metal.fall ambient @a ~ ~ ~ 0.2 0.8
