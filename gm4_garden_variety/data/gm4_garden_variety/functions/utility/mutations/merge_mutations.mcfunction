# merges the 2 given sets of mutations into 1
# run from gm4_garden_variety:mechanics/custom_sapling/apply_random_mutation


# update mutation
function #gm4_garden_variety:utility/mutations/merge_mutations

# [loop]
data remove storage gm4_garden_variety:merge/mutation merge[0]
scoreboard players remove $merge_mutations_loop gm4_gv_mutations 1
execute if score $merge_mutations_loop gm4_gv_mutations matches 1.. run function gm4_garden_variety:utility/mutations/merge_mutations
