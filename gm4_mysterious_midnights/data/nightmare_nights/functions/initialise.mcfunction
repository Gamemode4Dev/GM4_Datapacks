#@s = none
#at world spawn
#called by event. Only runs once per nightmare night.
say nightmare_nights.initialise

#red screen tint
worldborder warning distance 300000000

#activate all expansions
#commons
function #mysterious_midnights:common_expansion
#uncommons
function #mysterious_midnights:uncommon_expansion
#rares
function #mysterious_midnights:rare_expansion

#tag all to be active and remove duplicate nightmare_nights expansion
tag @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=!gm4_mysterious_midnight_active] add gm4_mysterious_midnight_active
kill @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=gm4_nightmare_nights,limit=1]

#initialise is done
scoreboard players set started_nightmare_night gm4_nights_data 1
