# check if tagged fish is in range of a coral core
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s, raycasted up to water surface
# run from fish/search_goal/find_surface/initiate

# check if coral core in range, in two commands to not alter the executing position of the next function
execute store success score $in_range gm4_hy_data align y positioned ~-7.5 ~-8 ~-7.5 if entity @e[type=item_display,tag=gm4_hy_coral_core,dx=14,dy=7,dz=14]
execute if score $in_range gm4_hy_data matches 1 run function gm4_hydromancy:fish/search_goal/find_surface/check_surface
