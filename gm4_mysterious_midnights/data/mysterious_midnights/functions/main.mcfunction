#query daytime
execute store result score daytime gm4_nights_data run time query daytime

#send "night has ended" pulse
execute if score send_night_end_pulse gm4_nights_data matches 1 if score daytime gm4_nights_data matches 0..12906 run function mysterious_midnights:send_night_end_pulse

#check for moon phase
execute if score moon_phase gm4_nights_data matches -1 if score daytime gm4_nights_data matches 12907..23080 run function mysterious_midnights:calculate_moon_phase

#=====EXPANSIONS=====
#in non-included expansions this would go in their main.mcfunction
execute if score moon_phase gm4_nights_data matches 0 if score daytime gm4_nights_data matches 12907..23080 run function mysterious_midnights:expansion_selection/included_expansions
