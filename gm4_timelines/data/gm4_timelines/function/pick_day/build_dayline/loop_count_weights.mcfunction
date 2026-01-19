
execute store result score $this_weight gm4_timelines.data run data get storage gm4_timelines:temp count_weight[0].weight
scoreboard players operation $total_weight gm4_timelines.data += $this_weight gm4_timelines.data

data remove storage gm4_timelines:temp count_weight[0]
execute if data storage gm4_timelines:temp count_weight[0] run function gm4_timelines:pick_day/build_dayline/loop_count_weights
