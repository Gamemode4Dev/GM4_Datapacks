# generates leaves ontop of apple trees with branching style 1a
# @s = sapling marker area_effect_cloud
# positioned ~ ~n ~ above the AEC rotated as @s
# run from gm4_apple_trees:tree/layer/place/branch_1a

# place leaves
# layer 0
fill ^-1 ^ ^-1 ^1 ^ ^2 minecraft:oak_leaves replace #gm4_fruiting_trees:tree_replaceable
execute if score $bit6 gm4_tree_seed matches 0 run fill ^-1 ^ ^2 ^-1 ^ ^2 air replace minecraft:oak_leaves
execute if score $bit7 gm4_tree_seed matches 0 run fill ^1 ^ ^2 ^1 ^ ^2 air replace minecraft:oak_leaves

# layer 1
fill ^ ^1 ^-1 ^ ^1 ^1 minecraft:oak_leaves replace #gm4_fruiting_trees:tree_replaceable
fill ^-1 ^1 ^ ^1 ^1 ^ minecraft:oak_leaves replace #gm4_fruiting_trees:tree_replaceable
