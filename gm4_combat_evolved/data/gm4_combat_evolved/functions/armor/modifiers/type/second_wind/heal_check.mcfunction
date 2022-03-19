# run from armor/modifiers/type/second_wind/check
# @s = player wearing second_wind piece

function gm4_combat_evolved:player/calculate_hp

execute if score @s gm4_ce_health < $half_health gm4_ce_data run function gm4_combat_evolved:armor/modifiers/type/second_wind/heal_store
