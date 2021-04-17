#@s = none
#at world spawn
#called by event. Only runs once per nightmare night.

#red screen tint
worldborder warning distance 300000000

#activate all nightmare night expansions
execute positioned 29999998 1 7134 run function #gm4_nightmare_nights:nightmare_night_expansion

#tag all to be active
tag @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion] add gm4_mysterious_midnights_active

#initialise is done
scoreboard players set started_nightmare_night gm4_mm_data 1
