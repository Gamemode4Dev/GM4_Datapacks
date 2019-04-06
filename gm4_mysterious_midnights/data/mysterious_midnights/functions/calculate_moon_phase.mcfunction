#@s = none
#at world spawn
#run from main, only during night, only once per night.
#say mysterious_midnights.calculate_moon_phase

#query day
execute store result score moon_phase gm4_nights_data run time query day

#modulo 8 to get moon phase
scoreboard players operation moon_phase gm4_nights_data %= 8 gm4_nights_data

#moon phase 0 = full moon. Calculate mysterious midnight difficulty.
execute if score moon_phase gm4_nights_data matches 0 run function mysterious_midnights:expansion_selection/calculate_midnight_difficulty
