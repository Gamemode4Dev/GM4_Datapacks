# coral flower clock (30s)
# @s = undefined
# at undefined
# run from slow_clock

scoreboard players set $clock.coral_flower_growth gm4_hy_data 0

tag @e[type=tropical_fish,tag=gm4_hy_tracked_fish] remove gm4_hy_tracked_fish
execute as @e[type=item_display,tag=gm4_hy_coral_flower] at @s run function gm4_hydromancy:coral_flower/process
