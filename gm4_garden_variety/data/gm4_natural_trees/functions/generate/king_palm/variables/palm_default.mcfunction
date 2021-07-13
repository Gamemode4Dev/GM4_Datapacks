# generates variables for each palm based on the current seed
# run from gm4_garden_variety:generation/trees/variables/per_palm


########## PALM ##########

# arc rate for each palm (layer based)
execute if score current_leaf_layer gm4_gv_gen_data matches 1 run scoreboard players set palm_arc_minimum gm4_gv_gen_data 3
execute if score current_leaf_layer gm4_gv_gen_data matches 1 run scoreboard players set palm_arc_range gm4_gv_gen_data 5
execute if score current_leaf_layer gm4_gv_gen_data matches 1 run scoreboard players set palm_arc_addition_rate gm4_gv_gen_data 1
execute if score current_leaf_layer gm4_gv_gen_data matches 1 run scoreboard players set palm_arc_addition_amount gm4_gv_gen_data 5
execute if score current_leaf_layer gm4_gv_gen_data matches 2 run scoreboard players set palm_arc_minimum gm4_gv_gen_data 3
execute if score current_leaf_layer gm4_gv_gen_data matches 2 run scoreboard players set palm_arc_range gm4_gv_gen_data 5
execute if score current_leaf_layer gm4_gv_gen_data matches 2 run scoreboard players set palm_arc_addition_rate gm4_gv_gen_data 1
execute if score current_leaf_layer gm4_gv_gen_data matches 2 run scoreboard players set palm_arc_addition_amount gm4_gv_gen_data 5

# x rotation offset for each palm (1-10) (-/+)
scoreboard players set palm_offet_minimum gm4_gv_gen_data 1
scoreboard players set palm_offet_range gm4_gv_gen_data 10

# initial y rotation for each palm (layer based)
execute if score current_leaf_layer gm4_gv_gen_data matches 1 at @s run tp @s ~ ~ ~ ~ -55
execute if score current_leaf_layer gm4_gv_gen_data matches 2 at @s run tp @s ~ ~ ~ ~ -80

# length of each palm (layer based)
execute if score current_leaf_layer gm4_gv_gen_data matches 1 run scoreboard players set palm_layers_minimum gm4_gv_gen_data 7
execute if score current_leaf_layer gm4_gv_gen_data matches 1 run scoreboard players set palm_layers_range gm4_gv_gen_data 2
execute if score current_leaf_layer gm4_gv_gen_data matches 2 run scoreboard players set palm_layers_minimum gm4_gv_gen_data 6
execute if score current_leaf_layer gm4_gv_gen_data matches 2 run scoreboard players set palm_layers_range gm4_gv_gen_data 2



########## FINALIZE ##########

# apply trait override variables
#TODO# function gm4_natural_trees:generate/king_palm/generation/trees/variables/palm_trait_override

# convert input variables to generation variables
function gm4_garden_variety:generation/interpret_variables/palm
