# activate armor effects
# @s = player wearing half armour
# at unspecified
# run from armor/modifier/check_modifier/hp_check

effect give @s resistance 2 2 true
execute if score @s[gamemode=!creative] gm4_ce_health.current >= @s gm4_ce_health.max_half run effect clear @s regeneration
execute if score @s[gamemode=!creative] gm4_ce_health.current > @s gm4_ce_health.max_half run function gm4_combat_expanded:armor/modifier/type/half/damage
