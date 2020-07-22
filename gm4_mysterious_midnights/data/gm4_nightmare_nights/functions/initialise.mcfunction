#@s = none
#at world spawn
#called by event. Only runs once per nightmare night.

#red screen tint
#worldborder warning distance 300000000
#disabled in UHC pack

#activate all nightmare night expansions
function #gm4_nightmare_nights:nightmare_night_expansion

#tag all to be active
tag @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=!gm4_mysterious_midnights_active] add gm4_mysterious_midnights_active

#initialise is done
scoreboard players set started_nightmare_night gm4_nights_data 1
