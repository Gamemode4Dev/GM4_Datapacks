# check if tagged fish is at its goal
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s, raycasting down
# run from fish/search_goal/goal_type

scoreboard players remove $max_search_depth gm4_hy_data 1

# grant 2 points for short seagrass, 1 for tall seagrass, both can be obtained in one tracking cycle
execute if entity @s[tag=!gm4_hy_found_short_grass] if block ~ ~ ~ seagrass run function gm4_hydromancy:fish/search_goal/seagrass/short
execute if entity @s[tag=!gm4_hy_found_tall_grass] if block ~ ~ ~ tall_seagrass run function gm4_hydromancy:fish/search_goal/seagrass/tall

execute if score $max_search_depth gm4_hy_data matches 1.. positioned ~ ~-1 ~ if block ~ ~ ~ #gm4_hydromancy:expected_aquarium_blocks run function gm4_hydromancy:fish/search_goal/seagrass/search
