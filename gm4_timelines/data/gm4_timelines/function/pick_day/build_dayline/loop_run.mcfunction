
# check moon cycle
scoreboard players operation $moon_cycle gm4_timelines.data = $last_build_day gm4_timelines.data
scoreboard players operation $moon_cycle gm4_timelines.data %= #8 gm4_timelines.data
execute if score $moon_cycle gm4_timelines.data matches 0 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"full_moon",in_type:"clear"}
execute if score $moon_cycle gm4_timelines.data matches 1 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waning_gibbous",in_type:"clear"}
execute if score $moon_cycle gm4_timelines.data matches 2 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"third_quarter",in_type:"clear"}
execute if score $moon_cycle gm4_timelines.data matches 3 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waning_crescent",in_type:"clear"}
execute if score $moon_cycle gm4_timelines.data matches 4 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"new_moon",in_type:"clear"}
execute if score $moon_cycle gm4_timelines.data matches 5 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waxing_crescent",in_type:"clear"}
execute if score $moon_cycle gm4_timelines.data matches 6 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"first_quarter",in_type:"clear"}
execute if score $moon_cycle gm4_timelines.data matches 7 run data modify storage gm4_timelines:temp looking_for set value {moon_phase:"waxing_gibbous",in_type:"clear"}
# check required in_type
data modify storage gm4_timelines:temp looking_for.in_type set from storage gm4_timelines:data active_day.out_type
# get possible days
function gm4_timelines:pick_day/build_dayline/eval_possible_days with storage gm4_timelines:temp looking_for
data remove storage gm4_timelines:temp looking_for

# get the total weight of all entries
scoreboard players set $total_weight gm4_timelines.data 0
data modify storage gm4_timelines:temp count_weight set from storage gm4_timelines:temp possible_days
function gm4_timelines:pick_day/build_dayline/loop_count_weights
data remove storage gm4_timelines:temp count_weight

# get a random weight between 0 and total weight
execute store result storage gm4_timelines:temp rng.max int 1 run scoreboard players get $total_weight gm4_timelines.data
function gm4_timelines:pick_day/build_dayline/eval_pick_weight with storage gm4_timelines:temp rng
data remove storage gm4_timelines:temp rng

# loop to get the picked day and add it to they dayline
execute if score $picked_weight gm4_timelines.data matches 1.. run function gm4_timelines:pick_day/build_dayline/loop_to_picked_day
data modify storage gm4_timelines:data dayline append from storage gm4_timelines:temp possible_days[0]
data remove storage gm4_timelines:temp possible_days

# continue doing this until we get to the desired day
scoreboard players add $last_build_day gm4_timelines.data 1
scoreboard players remove $days_forward gm4_timelines.data 1
execute if score $days_forward gm4_timelines.data matches 1.. run function gm4_timelines:pick_day/build_dayline/loop_run
