# generates the 3rd layer of this apple tree
# @s = sapling marker area_effect_cloud
# at @s align xyz
# run from tree/layer/generate

# place dummy block (DEBUG)
fill ~ ~ ~ ~ ~ ~ oak_log[axis=y] replace #gm4_apple_trees:tree_replaceable
fill ~ ~ ~-1 ~ ~ ~-1 oak_log[axis=z] replace #gm4_apple_trees:tree_replaceable
