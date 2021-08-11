# generate the tree's palm segments (about 1 block)
# @s = TREE_TYPE palm AEC marker
# run from gm4_garden_variety:generation/trees/palm_tree/palm_segment

# place wood to construct the trunk
execute if score $current_palm_layer gm4_gv_gen_data matches ..4 at @s run fill ~ ~ ~ ~ ~ ~ birch_leaves[persistent=false] keep
execute if score $current_palm_layer gm4_gv_gen_data matches 5.. at @s run fill ~ ~ ~ ~ ~ ~ birch_leaves[persistent=true] keep

# move forward
execute at @s run tp @s ^ ^ ^.1

# loop function until segment_loop hits 0
scoreboard players remove $palm_segment_loop gm4_gv_gen_data 1
execute if score $palm_segment_loop gm4_gv_gen_data matches 1.. run function gm4_natural_trees:generate/king_palm/integration/garden_variety/generation/palm_segment


