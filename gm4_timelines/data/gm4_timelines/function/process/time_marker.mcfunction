
scoreboard players operation $timetick gm4_timelines_data -= $time_markers_start gm4_timelines_data
scoreboard players operation $timetick gm4_timelines_data /= #1001 gm4_timelines_data

# set to specific times in this day
execute if score $timetick gm4_timelines_data matches 0 run data modify storage gm4_timelines:data active_day.added_time set value 19000
execute if score $timetick gm4_timelines_data matches 1 run data modify storage gm4_timelines:data active_day.added_time set value 12000
execute if score $timetick gm4_timelines_data matches 2 run data modify storage gm4_timelines:data active_day.added_time set value 7000
execute if score $timetick gm4_timelines_data matches 3 run data modify storage gm4_timelines:data active_day.added_time set value 0
execute if score $timetick gm4_timelines_data matches 0..3 run return run function gm4_timelines:process/technical/eval_time with storage gm4_timelines:data active_day

# or get a specific day to force, then rebuild the block
execute store result storage gm4_timelines:temp get_day.index int 1 run scoreboard players remove $timetick gm4_timelines_data 4
function gm4_timelines:process/technical/eval_from_index with storage gm4_timelines:temp get_day
data modify storage gm4_timelines:temp get_day.moon_phase set from storage gm4_timelines:data active_day.moon_phase
function gm4_timelines:process/technical/eval_from_lookup with storage gm4_timelines:temp get_day

# rebuild a block starting from this day
execute store result score $days_in_block gm4_timelines_data run data get storage gm4_timelines:data day_block
data modify storage gm4_timelines:data day_block set value []
data modify storage gm4_timelines:data day_block append from storage gm4_timelines:temp get_day.day
scoreboard players remove $days_in_block gm4_timelines_data 1
function gm4_timelines:generate_block/add_day_loop

# set day as active and set to noon
data modify storage gm4_timelines:data active_day set from storage gm4_timelines:data day_block[0]
data modify storage gm4_timelines:data active_day.added_time set value 0
function gm4_timelines:process/technical/eval_time with storage gm4_timelines:data active_day

# mark active day
execute store result score $active_day gm4_timelines_data run time query minecraft:day
scoreboard players remove $active_day gm4_timelines_data 6000
scoreboard players operation $active_day gm4_timelines_data /= #24000 gm4_timelines_data

# cleanup
data remove storage gm4_timelines:temp get_day
