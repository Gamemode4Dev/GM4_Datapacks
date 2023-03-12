# process tagged tropical fish
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s
# run from main

execute if score @s gm4_hy_goal matches 0 if block ~ ~ ~ seagrass run function gm4_hydromancy:coral_flower/fish/goal_found
execute if score @s gm4_hy_goal matches 1 if block ~ ~ ~ sea_pickle run function gm4_hydromancy:coral_flower/fish/goal_found
execute if score @s gm4_hy_goal matches 2 if block ~ ~ ~ lily_pad run function gm4_hydromancy:coral_flower/fish/goal_found
execute if score @s gm4_hy_goal matches 3 if block ~ ~ ~ kelp run function gm4_hydromancy:coral_flower/fish/goal_found
