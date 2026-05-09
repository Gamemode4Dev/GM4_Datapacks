
# if we've just passed into the next day we randomly pick another day,
# else we think this was a set time and don't need to alter it, but we should look for this
execute if score $time_check gm4_timelines_data matches 1..24000 run return run function gm4_timelines:pick_day/randomize/run

say ERROR - you set the time, this isn't supported at the moment, please reload to fix things
