# check if tagged fish is at its goal
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s, raycasting up
# run from fish/search_goal/goal_type

scoreboard players remove $max_search_depth gm4_hy_data 1

execute unless block ~ ~ ~ #gm4:water run function gm4_hydromancy:coral_flower/fish/search_goal/lily_pad/surface

execute if score $max_search_depth gm4_hy_data matches 1.. positioned ~ ~1 ~ run function gm4_hydromancy:coral_flower/fish/search_goal/lily_pad/search
