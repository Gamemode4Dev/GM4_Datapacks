# check if player is above 50% health
# @s = player being checked
# run from armor/check_modifier

function gm4_combat_evolved:player/calculate_hp

execute if score @s gm4_ce_health > $half_health gm4_ce_data run function gm4_combat_evolved:armor/modifiers/type/immune/get_immunities
