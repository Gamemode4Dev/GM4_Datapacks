# checks whether @s is a custom sapling, and if so allows further execution
# @s any gm4_fruiting_sapling
# at @s align xyz
# run from #gm4_fruiting_trees:tree/initialize

# set seed mode
scoreboard players set $seed_mode_sapling gm4_gv_gen_data 1

# convert nbt to scores
data modify storage gm4_garden_variety:convert/to_scores input set from entity @s data.gm4_garden_variety
function gm4_garden_variety:data/convert/nbt_to_scores

# attempt random mutation
function gm4_garden_variety:data/mutations/random_mutations/attempt

# store nbt for use
data modify storage gm4_garden_variety:transfer/gv_nbt tree_offspring set from entity @s data.gm4_garden_variety
data modify storage gm4_garden_variety:transfer/gv_nbt tree_offspring.mutations set from storage gm4_garden_variety:merge/mutation output


# generate tree
function #gm4_garden_variety:mechanics/custom_sapling/generate_tree
