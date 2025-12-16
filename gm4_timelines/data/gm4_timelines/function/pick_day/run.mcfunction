
scoreboard players set $previous_time gm4_timelines.data 0

scoreboard players set $total_weight gm4_timelines.data 0

data modify storage gm4_timelines:temp possible_days set value []
data modify storage gm4_timelines:temp all_days set from storage gm4_timelines:data day_registry

function gm4_timelines:pick_day/loop

# TODO: pick properly
data modify storage gm4_timelines:temp picked_day set from storage gm4_timelines:temp possible_days[0]
execute unless data storage gm4_timelines:temp possible_days[0] run function gm4_timelines:pick_day/no_valid_day

# TODO: do this better
execute if data storage gm4_timelines:temp picked_day{moon_phase:"full_moon"} run data modify storage gm4_timelines:data last_day.next_moon_phase set value "waning_gibbous"
execute if data storage gm4_timelines:temp picked_day{moon_phase:"waning_gibbous"} run data modify storage gm4_timelines:data last_day.next_moon_phase set value "third_quarter"
execute if data storage gm4_timelines:temp picked_day{moon_phase:"third_quarter"} run data modify storage gm4_timelines:data last_day.next_moon_phase set value "waning_crescent"
execute if data storage gm4_timelines:temp picked_day{moon_phase:"waning_crescent"} run data modify storage gm4_timelines:data last_day.next_moon_phase set value "new_moon"
execute if data storage gm4_timelines:temp picked_day{moon_phase:"new_moon"} run data modify storage gm4_timelines:data last_day.next_moon_phase set value "waxing_crescent"
execute if data storage gm4_timelines:temp picked_day{moon_phase:"waxing_crescent"} run data modify storage gm4_timelines:data last_day.next_moon_phase set value "first_quarter"
execute if data storage gm4_timelines:temp picked_day{moon_phase:"first_quarter"} run data modify storage gm4_timelines:data last_day.next_moon_phase set value "waxing_gibbous"
execute if data storage gm4_timelines:temp picked_day{moon_phase:"waxing_gibbous"} run data modify storage gm4_timelines:data last_day.next_moon_phase set value "full_moon"
data modify storage gm4_timelines:data last_day.out_type set from storage gm4_timelines:temp picked_day.out_type

function gm4_timelines:pick_day/eval_day with storage gm4_timelines:temp picked_day
execute store result score $daytime_left gm4_timelines.data run data get storage gm4_timelines:data day_duration
