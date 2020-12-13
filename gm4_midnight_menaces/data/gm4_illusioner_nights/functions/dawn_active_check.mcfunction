# @s = none
# at world spawn
# called by mysterious midnights base upon the break of dawn. Only runs once. Techincal function to prevent inactive expansions from running their dawn event.

execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_illusioner_nights,tag=gm4_mysterious_midnights_active] run scoreboard players reset illusioner_nights gm4_menace_data
