# @s = none
# at world spawn
# called by mysterious midnights base upon the break of dawn. Only runs once. Techincal function to prevent inactive expansions from running their dawn event.

execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_enlarging_phantoms,tag=gm4_mysterious_midnights_active] run scoreboard players reset enlarging_phantoms gm4_menace_data
