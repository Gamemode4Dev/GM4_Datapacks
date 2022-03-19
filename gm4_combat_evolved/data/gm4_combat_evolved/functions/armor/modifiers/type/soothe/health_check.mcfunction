# run from armor/modifiers/type/soothe/check
# @s = player wearing soothing armour
# at @s

function gm4_combat_evolved:player/calculate_hp

execute if score @s gm4_ce_health < $half_health gm4_ce_data run function gm4_combat_evolved:armor/modifiers/type/soothe/activate
