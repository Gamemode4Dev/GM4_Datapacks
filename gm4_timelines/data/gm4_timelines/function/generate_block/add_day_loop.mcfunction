

# default looking_for
data modify storage gm4_timelines:temp looking_for set value {moon_phase:"full_moon",in_type:"clear"}
# check which moon phase we want for this day, default full_moon
execute if score $moon_phase gm4_timelines_data matches 1 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waning_gibbous",in_type:"clear"}
execute if score $moon_phase gm4_timelines_data matches 2 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"third_quarter",in_type:"clear"}
execute if score $moon_phase gm4_timelines_data matches 3 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waning_crescent",in_type:"clear"}
execute if score $moon_phase gm4_timelines_data matches 4 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"new_moon",in_type:"clear"}
execute if score $moon_phase gm4_timelines_data matches 5 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waxing_crescent",in_type:"clear"}
execute if score $moon_phase gm4_timelines_data matches 6 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"first_quarter",in_type:"clear"}
execute if score $moon_phase gm4_timelines_data matches 7 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waxing_gibbous",in_type:"clear"}
# add 1 to moon phase for next time
scoreboard players add $moon_phase gm4_timelines_data 1
scoreboard players operation $moon_phase gm4_timelines_data %= #8 gm4_timelines_data
# check which in_type we want, default clear
execute if data storage gm4_timelines:data day_block[-1] run data modify storage gm4_timelines:temp looking_for.in_type set from storage gm4_timelines:data day_block[-1].out_type

# get possible days
function gm4_timelines:generate_block/technical/eval_possible_days with storage gm4_timelines:temp looking_for
data remove storage gm4_timelines:temp looking_for
# if last day only use ones with clear out_type
execute unless score $days_in_block gm4_timelines_data matches 2.. run function gm4_timelines:generate_block/technical/filter_clear_days
# get the total weight of all entries
scoreboard players set $total_weight gm4_timelines_data 0
data modify storage gm4_timelines:temp count_weight set from storage gm4_timelines:temp possible_days
function gm4_timelines:generate_block/technical/loop_count_weights
data remove storage gm4_timelines:temp count_weight
# get a random weight between 0 and total weight
execute store result score $picked_weight gm4_timelines_data run random value 0..2147483646 gm4_timelines:rng
scoreboard players operation $picked_weight gm4_timelines_data %= $total_weight gm4_timelines_data
scoreboard players add $picked_weight gm4_timelines_data 1
# loop to get the picked day and add it to the block
function gm4_timelines:generate_block/technical/loop_to_picked_day
data modify storage gm4_timelines:data day_block append from storage gm4_timelines:temp possible_days[0]
data remove storage gm4_timelines:temp possible_days

scoreboard players remove $days_in_block gm4_timelines_data 1
execute if score $days_in_block gm4_timelines_data matches 1.. run function gm4_timelines:generate_block/add_day_loop
