# restores the data of the sapling when breaking the block
# @s TREE_TYPE sapling AEC
# at @s align xyz
# run from TODO


# kill sapling item and spawn correct sapling
kill @e[type=item,nbt={Item:{id:"minecraft:birch_sapling",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
loot spawn ~0.5 ~0.5 ~0.5 loot gm4_natural_trees:items/sapling/king_palm
