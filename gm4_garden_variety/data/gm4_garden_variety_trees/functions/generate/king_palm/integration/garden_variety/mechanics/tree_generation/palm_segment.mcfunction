# generates the palm segment
# @s = @e[type=marker,tag=gm4_tree_palm_marker]
# at @s
# run from gm4_garden_variety_trees:integration/garden_variety/mechanics/tree_generation/palm_segment


# place wood to construct the trunk
execute if score $current_palm_layer gm4_gv_tree_gen matches ..4 at @s run fill ~ ~ ~ ~ ~ ~ birch_leaves[persistent=false] keep
execute if score $current_palm_layer gm4_gv_tree_gen matches 5.. at @s run fill ~ ~ ~ ~ ~ ~ birch_leaves[persistent=true] keep

# move forward
execute at @s run tp @s ^ ^ ^.1

# loop function until segment_loop hits 0
scoreboard players remove $palm_segment_loop gm4_gv_tree_gen 1
execute if score $palm_segment_loop gm4_gv_tree_gen matches 1.. run function gm4_garden_variety_trees:generate/king_palm/integration/garden_variety/mechanics/tree_generation/palm_segment
