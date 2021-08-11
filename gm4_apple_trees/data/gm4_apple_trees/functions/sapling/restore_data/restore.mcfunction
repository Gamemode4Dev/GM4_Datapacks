# restores the data of the sapling when breaking the block
# @s apple tree sapling AEC
# at @s align xyz
# run from gm4_apple_trees:sapling/restore_data/validate_species

kill @e[type=item,nbt={Item:{id:"minecraft:oak_sapling",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
loot spawn ~0.5 ~0.5 ~0.5 loot gm4_apple_trees:blocks/apple_tree_sapling
