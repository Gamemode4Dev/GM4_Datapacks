# choses second branched layer of this apple tree
# @s = sapling marker
# positioned ~ ~n ~ above the marker rotated as @s
# run from gm4_apple_trees:tree/layer/generate

# chose branch style
execute if score $bit4 gm4_tree_seed matches 0 run function gm4_apple_trees:tree/layer/place/branch_1a
execute if score $bit4 gm4_tree_seed matches 1 run function gm4_apple_trees:tree/layer/place/branch_1b
