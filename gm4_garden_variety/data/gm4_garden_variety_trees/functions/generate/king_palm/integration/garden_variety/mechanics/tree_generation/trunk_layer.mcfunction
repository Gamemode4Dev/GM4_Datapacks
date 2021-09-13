# generates the trunk segment
# @s = @e[type=marker,tag=gm4_tree_trunk_marker]
# at @s
# run from gm4_garden_variety_trees:integration/garden_variety/mechanics/tree_generation/trunk_layer


# generate fruit leaves on side of tree
execute if score $fruiting_trees_installed gm4_gv_data matches 1.. if score $fruit_leaves gm4_gv_tree_gen matches 1.. if score $current_trunk_layer gm4_gv_tree_gen >= $trunk_decor_start_height gm4_gv_tree_gen positioned ~ ~.5 ~ run function gm4_garden_variety:mechanics/trunk_decor/initialize
