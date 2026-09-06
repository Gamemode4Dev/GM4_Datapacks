
# if no days left in block generate a new one
execute unless data storage gm4_timelines:data day_block[0] run function gm4_timelines:generate_block/run_normal

# set active day
data modify storage gm4_timelines:data active_day set from storage gm4_timelines:data day_block[0]

# set time to the picked day
execute store result storage gm4_timelines:data active_day.added_time int 1 run scoreboard players get $daytime gm4_timelines_data
function gm4_timelines:process/technical/eval_time with storage gm4_timelines:data active_day

# mark active day
execute store result score $active_day gm4_timelines_data run time query minecraft:day
scoreboard players remove $active_day gm4_timelines_data 6000
scoreboard players operation $active_day gm4_timelines_data /= #24000 gm4_timelines_data

# remove day from day block
data remove storage gm4_timelines:data day_block[0]
