
# TODO: how does this impact local difficulty?
time set 5999
data modify storage gm4_timelines:data dayline set value []
random reset gm4_timelines:pick_day 0 true true
scoreboard players set $day.active gm4_timelines.data -1
