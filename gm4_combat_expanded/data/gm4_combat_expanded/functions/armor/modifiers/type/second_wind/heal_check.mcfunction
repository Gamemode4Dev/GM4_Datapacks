# check player health and heal if below 50%
# @s = player wearing armor
# run from armor/modifiers/type/second_wind/check

function gm4_combat_expanded:player/calculate_hp

execute if score @s gm4_ce_health < $half_health gm4_ce_data run function gm4_combat_expanded:armor/modifiers/type/second_wind/heal_store
