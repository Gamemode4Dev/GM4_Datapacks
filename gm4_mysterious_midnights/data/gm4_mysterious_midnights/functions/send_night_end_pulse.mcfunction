#@s = none
#at world spawn
#run from main, only during day, only once per day.

#remember that night end pulse was sent
scoreboard players set send_night_end_pulse gm4_nights_data 0

#set tracked moon phase to -1 (daytime)
scoreboard players set moon_phase gm4_nights_data -1

#send night end pulse to expansions
execute if score random gm4_nights_data matches 6.. run function #gm4_mysterious_midnights:dawn_event

#end expansion activity
kill @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_mysterious_midnights_active]
