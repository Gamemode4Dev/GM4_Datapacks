schedule function gm4_hydromancy:slow_clock 30s

#tag @e[type=tropical_fish,tag=gm4_hy_tracked_fish] remove gm4_hy_tracked_fish
execute as @e[type=item_display,tag=gm4_hy_coral_flower] at @s run function gm4_hydromancy:coral_flower/process
