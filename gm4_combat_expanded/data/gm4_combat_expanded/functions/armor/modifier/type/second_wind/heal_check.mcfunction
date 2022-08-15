# check player health and heal if below 50%
# @s = player wearing armor
# at world spawn
# run from armor/modifier/type/second_wind/check

function gm4_combat_expanded:player/calculate_hp

execute if score @s gm4_ce_health < $half_health gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/second_wind/heal_store
