# generates the leaf segment
# @s = @e[type=marker,tag=gm4_tree_leaf_marker]
# at @s
# run from gm4_garden_variety_trees:integration/garden_variety/mechanics/tree_generation/leaf_segment


# move forward
execute at @s run tp @s ~ ~.5 ~

# loop function until segment_loop hits 0
scoreboard players remove $leaf_segment_loop gm4_gv_tree_gen 1
execute if score $leaf_segment_loop gm4_gv_tree_gen matches 1.. run function gm4_garden_variety_trees:generate/king_palm/integration/garden_variety/mechanics/tree_generation/leaf_segment
