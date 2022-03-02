# run from armor/check_modifier
# @s = player guarding

function gm4_combat_evolved:player/calculate_hp

execute if score @s gm4_ce_health >= $half_health gm4_ce_data unless score @s gm4_ce_t_guard matches 1.. at @s run function gm4_combat_evolved:armor/modifiers/type/guardian/activate
