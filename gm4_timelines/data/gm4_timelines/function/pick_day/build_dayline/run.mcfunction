
# first get the last day in the build timeline
execute store result score $last_build_day gm4_timelines.data run data get storage gm4_timelines:data dayline

# check how many days should be build
scoreboard players operation $days_forward gm4_timelines.data = $index_change gm4_timelines.data

# build at most 32 days
execute if score $days_forward gm4_timelines.data matches 32.. run tellraw @a [{text:"[GM4 Timelines] ",color:"#4AA0C7"},{text:"Could only move 32 days into the future",color:"red"}]
execute if score $days_forward gm4_timelines.data matches 32.. run scoreboard players set $index_change gm4_timelines.data 32
execute if score $days_forward gm4_timelines.data matches 32.. run scoreboard players set $days_forward gm4_timelines.data 32

# get data from last build day
data modify storage gm4_timelines:data active_day set from storage gm4_timelines:data dayline[-1]

# build the amount of needed days
function gm4_timelines:pick_day/build_dayline/loop_run

# get the last day
data modify storage gm4_timelines:data active_day set from storage gm4_timelines:data dayline[-1]
scoreboard players operation $day.current gm4_timelines.data = $last_build_day gm4_timelines.data
