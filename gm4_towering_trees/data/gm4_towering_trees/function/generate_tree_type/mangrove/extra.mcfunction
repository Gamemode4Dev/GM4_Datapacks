# extra function for mangrove trees
# @s = sapling marker
# located at @s
# run from generate_tree_type/mangrove/place_tree

# remove the saplings, this doesn't always happen for mangrove trees
fill ~ ~ ~ ~1 ~ ~1 air replace mangrove_propagule[waterlogged=false]
fill ~ ~ ~ ~1 ~ ~1 water replace mangrove_propagule[waterlogged=true]

# place the roots after 1 tick to allow markers to load in
schedule function gm4_towering_trees:generate_tree_type/mangrove/roots/schedule 1t
