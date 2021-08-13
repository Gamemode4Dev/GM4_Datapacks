# checks whether the placed sapling is a custom sapling, and if so allows further execution
# @s raycast AEC
# at @s align xyz
# run from TODO

# get mutations from held sapling
data modify storage gm4_garden_variety:data/garden_variety_nbt place_sapling set from entity @s SelectedItem.tag.gm4_garden_variety

# plant sapling
execute if data storage gm4_fruiting_trees:data Sapling{type:"king_palm"} run function gm4_natural_trees:generate/king_palm/integration/fruiting_trees/spawn_sapling_marker

# store nbt
execute positioned ~0.5 ~ ~0.5 run data modify entity @e[type=marker,distance=..1,limit=1,tag=gm4_fruiting_sapling,sort=nearest] data.gm4_garden_variety set from storage gm4_garden_variety:data/garden_variety_nbt place_sapling
