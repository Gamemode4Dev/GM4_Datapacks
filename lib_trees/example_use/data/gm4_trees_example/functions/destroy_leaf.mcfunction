# removes a leaf marker if it's no longer in a leaf block
# @s = gm4_example_leaf marker
# located at @s
# run from gm4_trees_example:verify/destroy_leaf

# drop sapling
loot spawn ~ ~ ~ loot gm4_trees_example:blocks/apple_tree_leaf
# (if you want special drops from silk touch, you can instead use these command below)
##execute if entity @e[type=item,nbt={Age:0s,Item:{id:"minecraft:oak_leaves",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0] run loot spawn ~ ~ ~ loot gm4_trees_example:blocks/apple_tree_leaf_silk_touch
##execute unless entity @e[type=item,nbt={Age:0s,Item:{id:"minecraft:oak_leaves",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0] run loot spawn ~ ~ ~ loot gm4_trees_example:blocks/apple_tree_leaf

# if desired, these commands can be used to replace all normally dropped items
# this should really only be used if there's a marker in every leaf from this tree
##kill @e[type=item,nbt={Age:0s,Item:{id:"minecraft:stick",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
##kill @e[type=item,nbt={Age:0s,Item:{id:"minecraft:oak_sapling",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]
##kill @e[type=item,nbt={Age:0s,Item:{id:"minecraft:oak_leaves",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,dx=0]

# kill marker
kill @s
