# checks whether the placed sapling is a custom sapling, and if so allows further execution
# @s raycast AEC
# at @s align xyz
# run from TODO

# plant sapling
execute if data storage gm4_garden_variety:transfer/gv_nbt placed_sapling.item{type:"king_palm"} run function gm4_garden_variety_trees:generate/king_palm/integration/fruiting_trees/spawn_sapling_marker
