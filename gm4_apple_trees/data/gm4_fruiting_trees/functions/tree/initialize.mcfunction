# gets tree constants from the expansion
# @s = sapling marker area_effect_cloud
# at @s align xyz
# run from TODO

# set fake players
scoreboard players set $cancel_generation gm4_tree_layer 1
scoreboard players set $current_layer gm4_tree_layer 0

# obtain tree stats and store into scoreboard
function #gm4_fruiting_trees:tree/initialize

# start generation, unless expansion force quit generation (e.g. due to missing dy). Kill marker afterwards
execute unless score $cancel_generation gm4_tree_layer matches 1.. run function gm4_fruiting_trees:tree/analyze_seed
kill @s
