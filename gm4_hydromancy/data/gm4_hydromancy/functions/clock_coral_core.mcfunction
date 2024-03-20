schedule function gm4_hydromancy:clock_coral_core 30s

# remove all fish tracking (gets reapplied near coral cores)
tag @e[type=tropical_fish,tag=gm4_hy_tracked_fish] remove gm4_hy_tracked_fish

# process coral cores
execute as @e[type=item_display,tag=gm4_hy_coral_core] at @s run function gm4_hydromancy:coral_core/process
