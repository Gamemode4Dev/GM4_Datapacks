# @s = none
# at world spawn
# run from main

# set "night-active" flag
scoreboard players set night_active gm4_mm_data 1

# calculate difficulty
execute positioned 29999998 1 7134 run function gm4_mysterious_midnights:calculate_difficulty

# schedule continous clock start
schedule function gm4_mysterious_midnights:event_clock 1t
