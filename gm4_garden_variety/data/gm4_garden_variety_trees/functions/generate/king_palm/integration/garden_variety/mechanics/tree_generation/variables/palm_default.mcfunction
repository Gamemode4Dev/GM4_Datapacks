# generates variables for each palm based on the current seed
# run from gm4_garden_variety:mechanics/tree_generation/variables/per_palm


# [Palm] arc rate for each palm (layer based)
execute if score $current_leaf_layer gm4_gv_tree_gen matches 1 run scoreboard players set $palm_arc_minimum gm4_gv_tree_gen 3
execute if score $current_leaf_layer gm4_gv_tree_gen matches 1 run scoreboard players set $palm_arc_range gm4_gv_tree_gen 5
execute if score $current_leaf_layer gm4_gv_tree_gen matches 1 run scoreboard players set $palm_arc_addition_rate gm4_gv_tree_gen 1
execute if score $current_leaf_layer gm4_gv_tree_gen matches 1 run scoreboard players set $palm_arc_addition_amount gm4_gv_tree_gen 5
execute if score $current_leaf_layer gm4_gv_tree_gen matches 2 run scoreboard players set $palm_arc_minimum gm4_gv_tree_gen 3
execute if score $current_leaf_layer gm4_gv_tree_gen matches 2 run scoreboard players set $palm_arc_range gm4_gv_tree_gen 5
execute if score $current_leaf_layer gm4_gv_tree_gen matches 2 run scoreboard players set $palm_arc_addition_rate gm4_gv_tree_gen 1
execute if score $current_leaf_layer gm4_gv_tree_gen matches 2 run scoreboard players set $palm_arc_addition_amount gm4_gv_tree_gen 5

# [Palm] initial y rotation for each palm (layer based)
execute if score $current_leaf_layer gm4_gv_tree_gen matches 1 at @s run tp @s ~ ~ ~ ~ -55
execute if score $current_leaf_layer gm4_gv_tree_gen matches 2 at @s run tp @s ~ ~ ~ ~ -80

# [Palm] length of each palm (layer based)
execute if score $current_leaf_layer gm4_gv_tree_gen matches 1 run scoreboard players set $palm_layers_minimum gm4_gv_tree_gen 7
execute if score $current_leaf_layer gm4_gv_tree_gen matches 1 run scoreboard players set $palm_layers_range gm4_gv_tree_gen 2
execute if score $current_leaf_layer gm4_gv_tree_gen matches 2 run scoreboard players set $palm_layers_minimum gm4_gv_tree_gen 6
execute if score $current_leaf_layer gm4_gv_tree_gen matches 2 run scoreboard players set $palm_layers_range gm4_gv_tree_gen 2

# [Mutations] apply mutation modifications
function gm4_garden_variety_trees:generate/king_palm/generation/variables/palm_mutations

# [Interpret] convert input variables to generation variables
function gm4_garden_variety:mechanics/tree_generation/interpret_variables/initial/palm
