# generate the tree's trunk layers (about 1 block)
# @s = TREE_TYPE trunk AEC marker
# run from TODO

# generate fruit leaves on side of tree
execute if score fruit_leaves gm4_gv_gen_data matches 1.. if score current_trunk_layer gm4_gv_gen_data >= trunk_fruit_start_height gm4_gv_gen_data positioned ~ ~.5 ~ run function gm4_garden_variety:generation/trunk_fruit/initialize
