# check if tagged fish is at its goal
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s, raycasting down
# run from fish/search_goal/goal_type

scoreboard players remove $max_search_depth gm4_hy_data 1

execute if block ~ ~ ~ sea_pickle run function gm4_hydromancy:fish/search_goal/sea_pickle/found

execute if score $max_search_depth gm4_hy_data matches 1.. positioned ~ ~-1 ~ if block ~ ~ ~ #gm4_hydromancy:expected_aquarium_blocks run function gm4_hydromancy:fish/search_goal/sea_pickle/search
