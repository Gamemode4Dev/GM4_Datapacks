


# generate mutation
function gm4_garden_variety:utility/mutations/random_mutation/generate
data modify entity @s data.gm4_garden_variety.random_mutations append from storage gm4_garden_variety:generate/mutation output

# reset storage
data remove storage gm4_garden_variety:merge/mutation input
data remove storage gm4_garden_variety:merge/mutation output
data remove storage gm4_garden_variety:merge/mutation merge

# merge random mutations
data modify storage gm4_garden_variety:merge/mutation input set from entity @s data.gm4_garden_variety.mutations
data modify storage gm4_garden_variety:merge/mutation output set from storage gm4_garden_variety:merge/mutation input
data modify storage gm4_garden_variety:merge/mutation merge set from entity @s data.gm4_garden_variety.random_mutations
execute store result score $merge_mutations_loop gm4_gv_mutations run data get storage gm4_garden_variety:merge/mutation merge
function gm4_garden_variety:utility/mutations/merge_mutations
data remove entity @s data.gm4_garden_variety.random_mutations

# apply mutation to offspring
data modify storage gm4_garden_variety:transfer/gv_nbt tree_offspring.mutations set from storage gm4_garden_variety:merge/mutation output
