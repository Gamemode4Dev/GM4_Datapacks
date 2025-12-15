
data modify storage gm4_timelines:temp day set from storage gm4_timelines:temp all_days[0]
data remove storage gm4_timelines:temp all_days[0]

# check if this day is possible
execute store result score $allow_day gm4_timelines.data run function gm4_timelines:pick_day/verify with storage gm4_timelines:data last_day

# not possible
execute if score $allow_day gm4_timelines.data matches 0 if data storage gm4_timelines:temp all_days[0] run return run function gm4_timelines:pick_day/loop
execute if score $allow_day gm4_timelines.data matches 0 run return fail

# possible
data modify storage gm4_timelines:temp possible_days append from storage gm4_timelines:temp day
execute store result score $this_weight gm4_timelines.data run data get storage gm4_timelines:temp day.weight
scoreboard players operation $total_weight gm4_timelines.data += $this_weight gm4_timelines.data
execute if data storage gm4_timelines:temp all_days[0] run function gm4_timelines:pick_day/loop
