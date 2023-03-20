# find the surface of the water
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s, raycasting up
# run from fish/search_goal/goal_type

scoreboard players remove $max_search_depth gm4_hy_data 1

execute unless block ~ ~ ~ #gm4_hydromancy:expected_aquarium_blocks run function gm4_hydromancy:fish/search_goal/find_surface/find_coral_core

execute if score $max_search_depth gm4_hy_data matches 1.. positioned ~ ~1 ~ run function gm4_hydromancy:fish/search_goal/find_surface/search
