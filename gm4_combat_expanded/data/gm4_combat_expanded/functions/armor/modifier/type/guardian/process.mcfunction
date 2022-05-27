# check if guardian is above 50% health
# @s = player guarding
# run from armor/check_modifier

function gm4_combat_expanded:player/calculate_hp

execute if score @s gm4_ce_health >= $half_health gm4_ce_data unless score @s gm4_ce_t_guard matches 1.. at @s run function gm4_combat_expanded:armor/modifier/type/guardian/activate
