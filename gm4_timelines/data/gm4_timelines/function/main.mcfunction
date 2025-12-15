schedule function gm4_timelines:main 16t

execute store result score $daytime gm4_timelines.data run time query daytime
execute store result score $day gm4_timelines.data run time query day
scoreboard players operation $current_time gm4_timelines.data = $day gm4_timelines.data
scoreboard players operation $current_time gm4_timelines.data *= #24000 gm4_timelines.data
scoreboard players operation $current_time gm4_timelines.data += $daytime gm4_timelines.data

scoreboard players operation $time_passed gm4_timelines.data = $current_time gm4_timelines.data
scoreboard players operation $time_passed gm4_timelines.data -= $previous_time gm4_timelines.data

scoreboard players operation $previous_time gm4_timelines.data = $current_time gm4_timelines.data

scoreboard players operation $daytime_left gm4_timelines.data -= $time_passed gm4_timelines.data

execute unless score $daytime_left gm4_timelines.data matches 1.. run function gm4_timelines:pick_day/run
