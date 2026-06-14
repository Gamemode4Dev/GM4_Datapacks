
# if we've just passed into the next day we randomly pick another day,
# else we think this was a set time and don't need to alter it
scoreboard players operation $day_difference gm4_timelines_data = $current_day gm4_timelines_data
scoreboard players operation $day_difference gm4_timelines_data -= $active_day gm4_timelines_data
execute if score $day_difference gm4_timelines_data matches 1 if score $daytime gm4_timelines_data matches 0..1000 run return run function gm4_timelines:pick_day/randomize/run

execute store result storage gm4_timelines:temp day.index int 1 run scoreboard players operation $active_day gm4_timelines_data = $current_day gm4_timelines_data
function gm4_timelines:pick_day/store_day/eval_index with storage gm4_timelines:temp day
function gm4_timelines:pick_day/store_day/eval_day with storage gm4_timelines:temp day
data remove storage gm4_timelines:temp day
scoreboard players operation $moon_phase gm4_timelines_data = $current_day gm4_timelines_data
scoreboard players operation $moon_phase gm4_timelines_data %= #8 gm4_timelines_data
