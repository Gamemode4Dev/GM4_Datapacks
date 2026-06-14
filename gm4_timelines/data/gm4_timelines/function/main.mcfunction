schedule function gm4_timelines:main 1t

# check if we're still in the day we think we are in
execute store result score $current_day gm4_timelines_data run time query minecraft:day
scoreboard players remove $current_day gm4_timelines_data 6000
scoreboard players operation $daytime gm4_timelines_data = $current_day gm4_timelines_data
scoreboard players operation $daytime gm4_timelines_data %= #24000 gm4_timelines_data
scoreboard players operation $current_day gm4_timelines_data /= #24000 gm4_timelines_data
execute unless score $current_day gm4_timelines_data = $active_day gm4_timelines_data run function gm4_timelines:pick_day/run

# update dev stuff
function gm4_timelines:dev/update_panel
