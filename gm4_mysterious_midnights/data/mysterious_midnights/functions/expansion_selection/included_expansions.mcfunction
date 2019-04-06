#@s = none
#at world spawn
#run from main, during mysterious midnight full moons, calls expansions that are included in the base module.
#external expansion modules have this code in their main.mcfunction
say mysterious_midnights.included_expansions

execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=gm4_harvest_moons] run function harvest_moons:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=gm4_buried_treasure] run function buried_treasure:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=gm4_falling_stars] run function falling_stars:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=gm4_resurrecting_skeletons] run function resurrecting_skeletons:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=gm4_resurrecting_zombies] run function resurrecting_zombies:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=gm4_slime_fests] run function slime_fests:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=gm4_tipped_skeletons] run function tipped_skeletons:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnight_expansion,tag=gm4_nightmare_nights] run function nightmare_nights:event
