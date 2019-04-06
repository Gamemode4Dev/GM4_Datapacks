#@s = none
#at world spawn
#called by mysterious midnights base upon the break of dawn. Only runs once. Techincal function to prevent inactive expansions from running their dawn event. Do NOT edit, just insert the expansion ID.
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=gm4_mysterious_midnights_expansion_template,tag=gm4_mysterious_midnight_active] run function mysterious_midnights_expansion_template:dawn_event
