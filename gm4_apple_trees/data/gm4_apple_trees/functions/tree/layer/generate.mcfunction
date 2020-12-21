# generates a layer of the tree
# @s = sapling marker area_effect_cloud
# at @s align xyz
# run from gm4_fruiting_trees:generate via #gm4_ruiting_trees:layer/generate

execute if score $current_layer gm4_tree_layer matches 0 run function gm4_apple_trees:tree/layer/0
execute if score $current_layer gm4_tree_layer matches 1 run function gm4_apple_trees:tree/layer/1
execute if score $current_layer gm4_tree_layer matches 2 run function gm4_apple_trees:tree/layer/2
execute if score $current_layer gm4_tree_layer matches 3 run function gm4_apple_trees:tree/layer/3
execute if score $current_layer gm4_tree_layer matches 4 run function gm4_apple_trees:tree/layer/4
execute if score $current_layer gm4_tree_layer matches 5 run function gm4_apple_trees:tree/layer/5
