# checks the maximum height of the tree
# @s any gm4_apple_tree_sapling
# at @s align xyz
# run from gm4_apple_trees:tree/validate_species

# determine available height
function gm4_apple_trees:tree/layer/check_clear_space
# $max_layer is now the height available to the tree to grow
execute if score $max_layer gm4_tree_layer >= #min_height gm4_apple_data run scoreboard players set $cancel_generation gm4_tree_layer 0
