schedule function gm4_timelines:main 1t

# get current time
execute store result score $timetick gm4_timelines_data run time query minecraft:day
scoreboard players operation $current_day gm4_timelines_data = $timetick gm4_timelines_data
scoreboard players remove $current_day gm4_timelines_data 6000
scoreboard players operation $daytime gm4_timelines_data = $current_day gm4_timelines_data
scoreboard players operation $daytime gm4_timelines_data %= #24000 gm4_timelines_data
scoreboard players operation $current_day gm4_timelines_data /= #24000 gm4_timelines_data

# 1. time is just into the next day
# the day has ended normally
# > generate the next one
scoreboard players operation $day_difference gm4_timelines_data = $current_day gm4_timelines_data
scoreboard players operation $day_difference gm4_timelines_data -= $active_day gm4_timelines_data
execute if score $day_difference gm4_timelines_data matches 1 if score $daytime gm4_timelines_data matches 0..1000 run function gm4_timelines:process/next_day

# 2. time is in the time markers
# it was set with a '/time set' command
# > set it to that day and ignore the seeded run until we reach a checkpoint
execute if score $timetick gm4_timelines_data >= $time_markers_start gm4_timelines_data run function gm4_timelines:process/time_marker

# update dev stuff
function gm4_timelines:dev/update_panel
