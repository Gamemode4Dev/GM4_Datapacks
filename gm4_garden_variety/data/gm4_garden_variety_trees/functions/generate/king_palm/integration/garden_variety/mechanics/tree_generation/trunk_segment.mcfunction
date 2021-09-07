# generate the tree's trunk segments (about 1 block)
# @s = TREE_TYPE trunk AEC marker
# run from gm4_garden_variety:mechanics/tree_generation/palm_tree/trunk_segment

# place wood to construct the trunk
execute if score $trunk_layer_eo2 gm4_gv_gen_data matches 0 at @s run fill ~ ~ ~ ~ ~ ~ stripped_oak_wood replace #gm4_fruiting_trees:tree_part
execute if score $trunk_layer_eo2 gm4_gv_gen_data matches 1 at @s run fill ~ ~ ~ ~ ~ ~ stripped_birch_wood replace #gm4_fruiting_trees:tree_part
execute at @s if block ~ ~-1 ~ stripped_oak_wood run setblock ~ ~-1 ~ stripped_oak_log
execute at @s if block ~ ~-1 ~ stripped_birch_wood run setblock ~ ~-1 ~ stripped_birch_log
execute at @s unless block ~ ~-2 ~ #minecraft:logs run fill ~ ~-1 ~ ~ ~-1 ~ stripped_oak_wood replace stripped_oak_log
execute at @s unless block ~ ~-2 ~ #minecraft:logs run fill ~ ~-1 ~ ~ ~-1 ~ stripped_birch_wood replace stripped_birch_log

# move forward
execute at @s run tp @s ^ ^ ^.1

# loop function until segment_loop hits 0
scoreboard players remove $trunk_segment_loop gm4_gv_gen_data 1
execute if score $trunk_segment_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety_trees:generate/king_palm/integration/garden_variety/mechanics/tree_generation/trunk_segment


