# places the custom sapling
# @s = @e[type=marker,tag=gm4_ray_loc]
# at @s
# run from #gm4_garden_variety:mechanics/custom_sapling/place


execute if data storage gm4_garden_variety:transfer/gv_nbt placed_sapling.item{type:"king_palm"} run function gm4_garden_variety_trees:generate/king_palm/integration/fruiting_trees/spawn_sapling_marker
