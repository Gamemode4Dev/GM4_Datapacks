# generates second branched layer of this apple tree as style b
# @s = sapling marker area_effect_cloud
# positioned ~ ~n ~ above the AEC rotated as @s
# run from gm4_apple_trees:tree/layer/generate

# branches
fill ^ ^ ^2 ^ ^ ^2 oak_log[axis=y] replace #gm4_apple_trees:tree_replaceable
fill ^ ^ ^-1 ^ ^ ^-1 oak_log[axis=y] replace #gm4_apple_trees:tree_replaceable

# leaves
execute if score bit5 gm4_tree_seed matches 0 run function gm4_apple_trees:tree/layer/place/leaves_1ba
execute if score bit5 gm4_tree_seed matches 1 run function gm4_apple_trees:tree/layer/place/leaves_1bb
