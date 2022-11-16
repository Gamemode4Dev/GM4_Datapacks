# restores the data of the sapling when breaking the block
# @s = example tree sapling marker
# located at @s
# run from gm4_trees_example:verify/destroy_sapling

# kill old sapling (in this case the base item is an oak sapling)
kill @e[type=item,nbt={Age:0s,Item:{id:"minecraft:oak_sapling",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
# spawn the new sapling
loot spawn ~ ~ ~ loot gm4_trees_example:items/apple_tree_sapling
