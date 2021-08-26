# generate the tree's palm segments (about 1 block)
# @s = TREE_TYPE palm AEC marker
# run from gm4_garden_variety:mechanics/tree_generation/palm_tree/palm_segment

# debug
execute if score $debug_generation gm4_gv_gen_data matches 1 at @s run particle happy_villager

# check blocks
execute unless block ~ ~ ~ #gm4_garden_variety:clearance_check run scoreboard players set $clearance_check gm4_gv_gen_data 0

# move forward
execute at @s run tp @s ^ ^ ^.1

# loop function until segment_loop hits 0
scoreboard players remove $clearance_check_segment_loop gm4_gv_gen_data 1
execute if score $clearance_check_segment_loop gm4_gv_gen_data matches 1.. run function gm4_garden_variety:mechanics/clearance_checker/segment


