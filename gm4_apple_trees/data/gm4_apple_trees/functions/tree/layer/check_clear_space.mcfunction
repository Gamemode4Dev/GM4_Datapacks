# recursively checks how much clear space there is above a sapling
# @s = sapling marker
# at positioned ~ ~n ~ where n is the current iteration of the recursion
# run from gm4_apple_trees:tree/initialize

# set min height
scoreboard players add $max_layer gm4_tree_layer 1

# recurse if max_height for species was not reached yet
execute unless score $max_layer gm4_tree_layer >= #max_height gm4_apple_data positioned ~ ~1 ~ if predicate gm4_fruiting_trees:5x5_clear run function gm4_apple_trees:tree/layer/check_clear_space
