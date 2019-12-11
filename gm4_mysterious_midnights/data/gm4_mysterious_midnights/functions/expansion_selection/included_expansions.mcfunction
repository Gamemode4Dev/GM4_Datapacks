#@s = none
#at world spawn
#run from main, during mysterious midnight full moons, calls expansions that are included in the base module.
#external expansion modules have this code in their main.mcfunction

execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_harvest_moons,tag=gm4_mysterious_midnights_active] run function gm4_harvest_moons:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_falling_stars,tag=gm4_mysterious_midnights_active] run function gm4_falling_stars:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_resurrecting_skeletons,tag=gm4_mysterious_midnights_active] run function gm4_resurrecting_skeletons:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_resurrecting_zombies,tag=gm4_mysterious_midnights_active] run function gm4_resurrecting_zombies:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_tipped_skeletons,tag=gm4_mysterious_midnights_active] run function gm4_tipped_skeletons:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_nightmare_nights,tag=gm4_mysterious_midnights_active] run function gm4_nightmare_nights:event
