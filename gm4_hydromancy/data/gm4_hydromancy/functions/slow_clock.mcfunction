schedule function gm4_hydromancy:slow_clock 5s

execute as @e[type=tropical_fish,tag=gm4_hy_tracked_fish] at @s run function gm4_hydromancy:coral_flower/fish/search_goal/find_surface/initiate

# run coral flower processing every 30s
scoreboard players add $clock.coral_flower_growth gm4_hy_data 1
execute if score $clock.coral_flower_growth gm4_hy_data matches 6.. run function gm4_hydromancy:coral_flower/clock

# grow magic vines every 5 min 
#scoreboard players add $clock.coral_flower_plant gm4_hy_data 1
#execute if score $clock.coral_flower_plant gm4_hy_data matches 60.. run function gm4_hydromancy:coral_flower/clock
