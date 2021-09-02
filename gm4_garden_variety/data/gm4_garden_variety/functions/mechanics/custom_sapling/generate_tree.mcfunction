# checks whether @s is a custom sapling, and if so allows further execution
# @s any gm4_fruiting_sapling
# at @s align xyz
# run from #gm4_fruiting_trees:tree/initialize

# set seed mode
scoreboard players set $seed_mode_sapling gm4_gv_gen_data 1

# merge random mutations
data modify storage gm4_garden_variety:merge/mutation input set from entity @s data.gm4_garden_variety.mutations
data modify storage gm4_garden_variety:merge/mutation output set from storage gm4_garden_variety:merge/mutation input
data modify storage gm4_garden_variety:merge/mutation modifier set from entity @s data.gm4_garden_variety.random_mutations
execute store result score $merge_mutations_loop gm4_gv_mutations run data get storage gm4_garden_variety:merge/mutation modifier
function gm4_garden_variety:mechanics/custom_sapling/mutations/merge_mutations
data remove entity @s data.gm4_garden_variety.random_mutations

# store nbt for use
data modify storage gm4_garden_variety:transfer/gv_nbt tree_offspring set from entity @s data.gm4_garden_variety
data modify storage gm4_garden_variety:transfer/gv_nbt tree_offspring.mutations set from storage gm4_garden_variety:merge/mutation output


# generate tree
function #gm4_garden_variety:mechanics/custom_sapling/generate_tree
