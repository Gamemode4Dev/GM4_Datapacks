
# check moon cycle
scoreboard players add $current_day.moon_phase gm4_timelines_data 1
scoreboard players operation $current_day.moon_phase gm4_timelines_data %= #8 gm4_timelines_data
execute if score $current_day.moon_phase gm4_timelines_data matches 0 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"full_moon",in_type:"clear"}
execute if score $current_day.moon_phase gm4_timelines_data matches 1 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waning_gibbous",in_type:"clear"}
execute if score $current_day.moon_phase gm4_timelines_data matches 2 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"third_quarter",in_type:"clear"}
execute if score $current_day.moon_phase gm4_timelines_data matches 3 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waning_crescent",in_type:"clear"}
execute if score $current_day.moon_phase gm4_timelines_data matches 4 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"new_moon",in_type:"clear"}
execute if score $current_day.moon_phase gm4_timelines_data matches 5 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waxing_crescent",in_type:"clear"}
execute if score $current_day.moon_phase gm4_timelines_data matches 6 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"first_quarter",in_type:"clear"}
execute if score $current_day.moon_phase gm4_timelines_data matches 7 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waxing_gibbous",in_type:"clear"}
# check required in_type
data modify storage gm4_timelines:temp looking_for.in_type set from storage gm4_timelines:data active_day.out_type
# get possible days
function gm4_timelines:pick_day/randomize/eval_possible_days with storage gm4_timelines:temp looking_for
# data remove storage gm4_timelines:temp looking_for

# get the total weight of all entries
scoreboard players set $total_weight gm4_timelines_data 0
data modify storage gm4_timelines:temp count_weight set from storage gm4_timelines:temp possible_days
function gm4_timelines:pick_day/randomize/loop_count_weights
data remove storage gm4_timelines:temp count_weight

# get a random weight between 0 and total weight
execute store result score $picked_weight gm4_timelines_data run random value 0..2147483646
scoreboard players operation $picked_weight gm4_timelines_data %= $total_weight gm4_timelines_data
scoreboard players add $picked_weight gm4_timelines_data 1

# loop to get the picked day and set it as active
execute if score $picked_weight gm4_timelines_data matches 1.. run function gm4_timelines:pick_day/randomize/loop_to_picked_day
data modify storage gm4_timelines:data active_day set from storage gm4_timelines:temp possible_days[0]

# set time to the picked day
function gm4_timelines:pick_day/eval_time with storage gm4_timelines:data active_day

# mark when this day will end
execute store result score $current_day.end_tick gm4_timelines_data run time query minecraft:day
scoreboard players add $current_day.end_tick gm4_timelines_data 23999

# add leftover time
execute store result storage gm4_timelines:temp add.time int 1 run scoreboard players remove $time_check gm4_timelines_data 1
function gm4_timelines:pick_day/randomize/eval_add_time with storage gm4_timelines:temp add
data remove storage gm4_timelines:temp add
