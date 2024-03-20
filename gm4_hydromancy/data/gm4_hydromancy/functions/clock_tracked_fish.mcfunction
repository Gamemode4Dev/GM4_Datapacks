schedule function gm4_hydromancy:clock_tracked_fish 5s

# process fish with a goal
execute as @e[type=tropical_fish,tag=gm4_hy_tracked_fish,tag=!gm4_hy_charged_fish] at @s run function gm4_hydromancy:fish/search_goal/find_surface/initiate
