schedule function gm4_hydromancy:clock_tracked_fish 5s

execute as @e[type=tropical_fish,tag=gm4_hy_tracked_fish,tag=!gm4_hy_charged_fish] at @s run function gm4_hydromancy:fish/search_goal/find_surface/initiate
execute as @e[type=tropical_fish,tag=gm4_hy_charged_fish] at @s if entity @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=gm4_hy_coral_vine.flowering,distance=..1.5] run function gm4_hydromancy:fish/discharge
