# @s = none
# at world spawn
# run from start_midnight run on a loop as long as it a mysterious midnight

# call default expansions
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_harvest_moons,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_harvest_moons:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_falling_stars,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_falling_stars:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_resurrecting_skeletons,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_resurrecting_skeletons:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_resurrecting_zombies,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_resurrecting_zombies:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_tipped_skeletons,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_tipped_skeletons:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_nightmare_nights,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_nightmare_nights:event

# call other expansions
function #gm4_mysterious_midnights:active_night

# check if it is day again
execute unless predicate gm4_mysterious_midnights:is_full_moon_night run function gm4_mysterious_midnights:end_pulse

# reschedule if the night is still active
execute if score night_active gm4_mm_data matches 1 run schedule function gm4_mysterious_midnights:event_clock 16t
