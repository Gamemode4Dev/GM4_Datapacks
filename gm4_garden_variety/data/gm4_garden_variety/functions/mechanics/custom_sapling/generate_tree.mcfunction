# checks whether @s is a custom sapling, and if so allows further execution
# @s any gm4_fruiting_sapling
# at @s align xyz
# run from #gm4_fruiting_trees:tree/initialize

# set seed mode
scoreboard players set $seed_mode_sapling gm4_gv_tree_gen 1

# convert nbt to scores
data remove storage gm4_garden_variety:convert/to_scores input
data modify storage gm4_garden_variety:convert/to_scores input set from entity @s data.gm4_garden_variety
function gm4_garden_variety:utility/convert/gv_nbt_to_scores

# store nbt for use
data remove storage gm4_garden_variety:transfer/gv_nbt tree_offspring
data modify storage gm4_garden_variety:transfer/gv_nbt tree_offspring set from entity @s data.gm4_garden_variety

# attempt random mutation
function gm4_garden_variety:mechanics/custom_sapling/attempt_mutation

# generate tree
function #gm4_garden_variety:mechanics/custom_sapling/generate_tree
