

# check how the days have changed
scoreboard players operation $index_change gm4_timelines.data = $day.current gm4_timelines.data
scoreboard players operation $index_change gm4_timelines.data -= $day.active gm4_timelines.data

scoreboard players operation $day_index gm4_timelines.data = $day.game gm4_timelines.data
scoreboard players operation $day_index gm4_timelines.data += $index_change gm4_timelines.data

# check what day index should be used
execute store result storage gm4_timelines:temp day.index int 1 run scoreboard players get $day_index gm4_timelines.data
data remove storage gm4_timelines:data active_day
function gm4_timelines:pick_day/eval_day_from_dayline with storage gm4_timelines:temp day

# if that index does not yet exist try to extend the dayline to it
execute unless data storage gm4_timelines:data active_day run function gm4_timelines:pick_day/build_dayline/run

# move time as needed
execute store result score $set_time gm4_timelines.data run data get storage gm4_timelines:data active_day.start_time
scoreboard players operation $add_time gm4_timelines.data = $daytime.real gm4_timelines.data
scoreboard players operation $add_time gm4_timelines.data -= #day.offset gm4_timelines.data
scoreboard players operation $add_time gm4_timelines.data %= #day.duration gm4_timelines.data
scoreboard players operation $set_time gm4_timelines.data += $add_time gm4_timelines.data
execute store result storage gm4_timelines:temp change.time int 1 run scoreboard players get $set_time gm4_timelines.data
function gm4_timelines:pick_day/eval_time with storage gm4_timelines:temp change
data remove storage gm4_timelines:temp change

# mark this as the active day
execute store result score $day.active gm4_timelines.data run data get storage gm4_timelines:data active_day.start_time
scoreboard players operation $day.active gm4_timelines.data -= #day.offset gm4_timelines.data
scoreboard players operation $day.active gm4_timelines.data /= #day.duration gm4_timelines.data
# move the game day so we remember what day we're actually at
scoreboard players operation $day.game gm4_timelines.data += $index_change gm4_timelines.data
