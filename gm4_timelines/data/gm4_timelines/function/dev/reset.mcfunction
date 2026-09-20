
scoreboard players set $moon_phase gm4_timelines_data 0
scoreboard players set $active_day gm4_timelines_data -1
data modify storage gm4_timelines:data day_block set value []
random reset gm4_timelines:rng 4 true true
time set 5999
