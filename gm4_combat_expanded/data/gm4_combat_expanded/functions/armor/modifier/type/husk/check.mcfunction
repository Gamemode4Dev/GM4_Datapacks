# check if player wearing armor is high on health and sprinting
# @s = player being checked
# at world spawn
# run from armor/check_modifier/highhp

function gm4_combat_expanded:player/calculate_hp

execute if score @s gm4_ce_health > $half_health gm4_ce_data if score @s gm4_ce_sprinting matches 1.. run function gm4_combat_expanded:armor/modifier/type/husk/apply
