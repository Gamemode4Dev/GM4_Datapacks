# @s = none
# at world spawn
# run from #gm4_mysterious_midnights:active_night

execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_slime_fests,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_slime_fests:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_sandy_husks,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_sandy_husks:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_icy_strays,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_icy_strays:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_enlarging_phantoms,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_enlarging_phantoms:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_menacing_goblins,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_menacing_goblins:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_illusioner_nights,tag=gm4_mysterious_midnights_active,limit=1] run function gm4_illusioner_nights:event
