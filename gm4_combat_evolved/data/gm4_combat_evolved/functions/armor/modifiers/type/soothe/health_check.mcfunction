# check if heal pulse should activate
# @s = player wearing soothing armour
# at @s
# run from armor/modifiers/type/soothe/check

function gm4_combat_evolved:player/calculate_hp

execute if score @s gm4_ce_health < $half_health gm4_ce_data run function gm4_combat_evolved:armor/modifiers/type/soothe/activate
