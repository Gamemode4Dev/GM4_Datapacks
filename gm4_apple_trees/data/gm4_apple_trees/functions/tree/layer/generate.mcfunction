# generates a layer of the tree
# @s = sapling marker area_effect_cloud
# at @s align xyz
# run from gm4_fruiting_trees:generate via #gm4_fruiting_trees:layer/generate

execute if score $current_layer gm4_tree_layer matches 0 run function gm4_apple_trees:tree/layer/randomize_height
execute if score $current_layer gm4_tree_layer matches 0..1 run fill ~ ~ ~ ~ ~ ~ oak_log[axis=y] replace #gm4_apple_trees:tree_replaceable

execute if score $current_layer gm4_tree_layer matches 2 run function gm4_apple_trees:tree/layer/place/branch_0
execute if score $current_layer gm4_tree_layer matches 3 run function gm4_apple_trees:tree/layer/place/branch_1
execute if score $current_layer gm4_tree_layer matches 4 run function gm4_apple_trees:tree/layer/place/leaves_0
execute if score $current_layer gm4_tree_layer matches 5 run function gm4_apple_trees:tree/layer/place/leaves_1
