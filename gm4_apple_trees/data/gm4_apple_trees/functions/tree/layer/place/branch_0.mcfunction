# generates first branched layer of this apple tree
# @s = sapling marker
# positioned ~ ~n ~ above the marker rotated as @s
# run from gm4_apple_trees:tree/layer/generate

# place trunk
fill ^ ^ ^ ^ ^ ^ oak_log[axis=y] replace #gm4_fruiting_trees:tree_replaceable

# place branch block with axis depending on tree rotation
execute if score $bit0 gm4_tree_seed matches 0 run fill ^ ^ ^1 ^ ^ ^1 oak_log[axis=z] replace #gm4_fruiting_trees:tree_replaceable
execute if score $bit0 gm4_tree_seed matches 1 run fill ^ ^ ^1 ^ ^ ^1 oak_log[axis=x] replace #gm4_fruiting_trees:tree_replaceable
