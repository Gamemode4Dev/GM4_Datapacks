# checks whether @s is a custom sapling, and if so allows further execution
# @s any gm4_fruiting_sapling
# at @s align xyz
# run from #gm4_fruiting_trees:tree/initialize

# set seed mode
scoreboard players set $seed_mode_sapling gm4_gv_gen_data 1

# merge random mutations
data modify storage gm4_garden_variety:merge/mutation mutations set from entity @s data.gm4_garden_variety.mutations
data modify storage gm4_garden_variety:merge/mutation random_mutations set from entity @s data.gm4_garden_variety.random_mutations
execute store result score $merge_mutations_loop gm4_gv_mutations run data get storage gm4_garden_variety:merge/mutation random_mutations
function gm4_garden_variety:mechanics/custom_sapling/mutations/merge_mutations
data modify storage gm4_garden_variety:data/garden_variety_nbt tree_offspring set from storage gm4_garden_variety:merge/mutation mutations
data remove entity @s data.gm4_garden_variety.random_mutations


# generate tree
function #gm4_garden_variety:mechanics/custom_sapling/generate_tree
