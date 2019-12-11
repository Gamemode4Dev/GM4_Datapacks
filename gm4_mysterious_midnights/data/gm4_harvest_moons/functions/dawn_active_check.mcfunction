#@s = none
#at world spawn
#called by mysterious midnights base upon the break of dawn. Only runs once. Techincal function to prevent inactive expansions from running their dawn event.
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_harvest_moons,tag=gm4_mysterious_midnights_active] run function gm4_harvest_moons:dawn_event
