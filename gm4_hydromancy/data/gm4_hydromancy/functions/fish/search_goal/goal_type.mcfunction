# check if tagged fish is at its goal (except lily pad)
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s raycasted up to water surface
# run from fish/search_goal/lily_pad/surface

scoreboard players set $max_search_depth gm4_hy_data 8

execute if score @s gm4_hy_goal matches 1 run function gm4_hydromancy:fish/search_goal/seagrass/search
execute if score @s gm4_hy_goal matches 2 run function gm4_hydromancy:fish/search_goal/sea_pickle/search
execute if score @s gm4_hy_goal matches 3 if block ~ ~ ~ #gm4_hydromancy:kelp run function gm4_hydromancy:fish/search_goal/kelp
