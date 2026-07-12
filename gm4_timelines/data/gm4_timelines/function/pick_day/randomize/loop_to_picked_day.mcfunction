
execute store result score $this_weight gm4_timelines_data run data get storage gm4_timelines:temp possible_days[0].weight
scoreboard players operation $picked_weight gm4_timelines_data -= $this_weight gm4_timelines_data

execute if score $picked_weight gm4_timelines_data matches ..0 run return 1

data remove storage gm4_timelines:temp possible_days[0]
execute if data storage gm4_timelines:temp possible_days[0] run function gm4_timelines:pick_day/randomize/loop_to_picked_day
