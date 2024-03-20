# remove tag from fish after finding sea_pickles and giving points
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s, raycasted down to sea pickle
# run from fish/search_goal/sea_pickle/search

scoreboard players set $max_search_depth gm4_hy_data 0

tag @s remove gm4_hy_tracked_fish

# grant points equal to the amount of pickles, 4 pickles means 0 points
execute if block ~ ~ ~ sea_pickle[pickles=1] run scoreboard players add @s gm4_hy_charge 1
execute if block ~ ~ ~ sea_pickle[pickles=2] run scoreboard players add @s gm4_hy_charge 2
execute if block ~ ~ ~ sea_pickle[pickles=3] run scoreboard players add @s gm4_hy_charge 3
