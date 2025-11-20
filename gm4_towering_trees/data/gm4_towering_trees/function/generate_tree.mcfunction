# generates the tree
# @s = sapling marker
# located at @s
# run from gm4_towering_trees:verify/generate_tree

scoreboard players set $tree_placed gm4_towering_trees_data 0

# check if this is a big tree
execute store result score $big_tree gm4_towering_trees_data run function gm4_towering_trees:check_for_mega_tree

# generate mega tree positionionally based on which sapling grew
execute if score $big_tree gm4_towering_trees_data matches 1 run function gm4_towering_trees:generate_mega_tree
execute if score $big_tree gm4_towering_trees_data matches 2 positioned ~ ~ ~-1 run function gm4_towering_trees:generate_mega_tree
execute if score $big_tree gm4_towering_trees_data matches 3 positioned ~-1 ~ ~ run function gm4_towering_trees:generate_mega_tree
execute if score $big_tree gm4_towering_trees_data matches 4 positioned ~-1 ~ ~-1 run function gm4_towering_trees:generate_mega_tree
# small trees
execute if score $big_tree gm4_towering_trees_data matches 0 run function gm4_towering_trees:generate_small_tree

# remove the saplings
execute if score $tree_placed gm4_towering_trees_data matches 1 run kill @e[type=marker,tag=gm4_towering_trees_sapling.target,limit=4,distance=..3]
