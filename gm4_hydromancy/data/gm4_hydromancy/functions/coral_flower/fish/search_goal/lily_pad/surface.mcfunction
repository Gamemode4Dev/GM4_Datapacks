# check block at water surface
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s, raycasted up to water surface
# run from fish/search_goal/lily_pad/search

scoreboard players set $max_search_depth gm4_hy_data 0

# if lily pad was the goal check for points
execute if score @s gm4_hy_goal matches 0 if block ~ ~ ~ lily_pad run function gm4_hydromancy:coral_flower/fish/search_goal/lily_pad/found
# if lily pad was not the goal and surface is free check other goals
execute if score @s gm4_hy_goal matches 1.. if block ~ ~ ~ #gm4:air at @s run function gm4_hydromancy:coral_flower/fish/search_goal/goal_type
