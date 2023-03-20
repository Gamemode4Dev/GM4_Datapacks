# tag fish as having found tall seagrass
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s, raycasted down to seagrass
# run from fish/search_goal/seagrass/search

scoreboard players set $max_search_depth gm4_hy_data 0
tag @s add gm4_hy_found_tall_grass
scoreboard players add @s gm4_hy_charge 1
execute if entity @s[tag=gm4_hy_found_short_grass] run function gm4_hydromancy:fish/search_goal/seagrass/both
