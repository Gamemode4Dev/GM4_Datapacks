# gets tree constants from the expansion
# @s = sapling marker area_effect_cloud
# at @s align xyz
# run from gm4_fruiting_trees:sapling/advance_stage

# set fake players
scoreboard players set $cancel_generation gm4_tree_layer 1
scoreboard players set $current_layer gm4_tree_layer 0
scoreboard players set $max_layer gm4_tree_layer -1

# obtain tree stats and store into scoreboard
function #gm4_fruiting_trees:tree/initialize

# start generation, unless expansion force quit generation (e.g. due to missing dy).
execute unless score $cancel_generation gm4_tree_layer matches 1.. at @s run function gm4_fruiting_trees:tree/analyze_seed
# if generation force quit, remove 1 from the stage of the sapling to allow another growth attempt
execute if score $cancel_generation gm4_tree_layer matches 1.. run scoreboard players remove @s gm4_sap_stage 1
