# remove tag from fish after finding kelp and giving points
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s
# run from fish/search_goal/goal_type

# needed to stop the lily pad raycast
scoreboard players set $max_search_depth gm4_hy_data 0

scoreboard players add @s gm4_hy_charge 1
tag @s remove gm4_hy_tracked_fish
