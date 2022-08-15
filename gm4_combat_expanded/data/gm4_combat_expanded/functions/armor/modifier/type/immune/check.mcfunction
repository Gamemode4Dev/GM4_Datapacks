# check if player is above 50% health
# @s = player being checked
# at world spawn
# run from armor/check_modifier/highhp

function gm4_combat_expanded:player/calculate_hp

execute if score @s gm4_ce_health > $half_health gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/immune/get_immunities
