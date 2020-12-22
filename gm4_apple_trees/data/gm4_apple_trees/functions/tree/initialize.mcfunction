# initializes the apple tree's marker AEC
# @s = raycast area_effect_cloud
# at @s align xyz
# run from gm4_fruiting_trees:sapling/place_sapling via #gm4_fruiting_trees:sapling/initialize

# determine available height
scoreboard players set $max_layer gm4_tree_layer -1
function gm4_apple_trees:tree/layer/check_clear_space
# $max_layer is now the height available to the tree to grow
execute if score $max_layer gm4_tree_layer >= #min_height gm4_apple_data run scoreboard players set $cancel_generation gm4_tree_layer 0
