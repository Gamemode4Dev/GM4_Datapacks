# generates the tree
# @s = sapling marker
# located at @s
# run from gm4_expanded_trees:verify/generate_tree


# check if this is a big tree
execute store result score $big_tree gm4_expanded_trees_data run function gm4_expanded_trees:check_for_giant_tree

# make room for sapling
# TODO: remove if unneeded
#setblock ~ ~ ~ air
#execute if score $big_tree gm4_expanded_trees_data matches 1.. as @e[type=marker,tag=gm4_expanded_trees_sapling,limit=3,sort=nearest,distance=0.01..2] at @s run setblock ~ ~ ~ air

# oak
execute if entity @s[tag=gm4_oak_tree_sapling] if score $big_tree gm4_expanded_trees_data matches 1 store success score $tree_placed gm4_expanded_trees_data run place feature gm4_expanded_trees:tree_thick
execute if entity @s[tag=gm4_oak_tree_sapling] if score $big_tree gm4_expanded_trees_data matches 1 store success score $tree_placed gm4_expanded_trees_data run place feature gm4_expanded_trees:tree_thick ~ ~ ~-1
execute if entity @s[tag=gm4_oak_tree_sapling] if score $big_tree gm4_expanded_trees_data matches 1 store success score $tree_placed gm4_expanded_trees_data run place feature gm4_expanded_trees:tree_thick ~-1 ~ ~
execute if entity @s[tag=gm4_oak_tree_sapling] if score $big_tree gm4_expanded_trees_data matches 1 store success score $tree_placed gm4_expanded_trees_data run place feature gm4_expanded_trees:tree_thick ~-1 ~ ~-1


kill @s
