schedule function gm4_timelines:main 1t

# check if we're still in the day we think we are in
execute store result score $time_check gm4_timelines_data run time query minecraft:day
scoreboard players operation $time_check gm4_timelines_data -= $current_day.end_tick gm4_timelines_data
execute unless score $time_check gm4_timelines_data matches -24000..0 run function gm4_timelines:pick_day/run
  