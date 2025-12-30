
execute store success score $waterlogged gm4_towering_trees_data if block ~ ~ ~ mangrove_propagule[waterlogged=true]

execute if score $waterlogged gm4_towering_trees_data matches 0 run fill ~ ~ ~ ~1 ~ ~1 air replace mangrove_propagule
execute if score $waterlogged gm4_towering_trees_data matches 1 run fill ~ ~ ~ ~1 ~ ~1 water replace mangrove_propagule
schedule function gm4_towering_trees:generate_tree_type/mangrove/roots/schedule 1t
