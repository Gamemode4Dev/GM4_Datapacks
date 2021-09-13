# checks the blocks to see if the can be replaced
# @s = @e[type=marker,tag=gm4_gv_sapling,tag=gm4_TREE_TYPE_sapling]
# at @s align xyz
# run from gm4_garden_variety:mechanics/clearance_checker/check


# debug
execute if score $debug_generation gm4_gv_tree_gen matches 1 at @s run particle happy_villager

# check blocks
execute unless block ~ ~ ~ #gm4_garden_variety:clearance_check run scoreboard players set $clearance_check gm4_gv_tree_gen 0

# move forward
execute at @s run tp @s ^ ^ ^.1

# loop function until segment_loop hits 0
scoreboard players remove $clearance_check_segment_loop gm4_gv_tree_gen 1
execute if score $clearance_check_segment_loop gm4_gv_tree_gen matches 1.. run function gm4_garden_variety:mechanics/clearance_checker/segment
