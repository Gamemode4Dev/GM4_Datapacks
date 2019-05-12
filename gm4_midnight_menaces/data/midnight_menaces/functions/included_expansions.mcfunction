#@s = none
#at world spawn
#run from main, during mysterious midnight full moons, calls expansions that are included in the base module.

execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_slime_fests,tag=gm4_mysterious_midnights_active] run function slime_fests:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_sandy_husks,tag=gm4_mysterious_midnights_active] run function sandy_husks:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_icy_strays,tag=gm4_mysterious_midnights_active] run function icy_strays:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_enlarging_phantoms,tag=gm4_mysterious_midnights_active] run function enlarging_phantoms:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_menacing_goblins,tag=gm4_mysterious_midnights_active] run function menacing_goblins:event
execute if entity @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=gm4_illusioner_nights,tag=gm4_mysterious_midnights_active] run function illusioner_nights:event