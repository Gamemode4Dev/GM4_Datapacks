# replaces the stone with a gold ore
# @s = gm4_golden_root_ray marker in stone
# located at @s
# run from gm4_golden_apple_trees:tree/root/grow


setblock ~ ~ ~ gold_ore

# visuals
particle block gold_block ~ ~ ~ 0.7 0.7 0.7 0.02 15
playsound minecraft:block.ancient_debris.place block @a[distance=..8] ~ ~ ~ 0.5 0.3
