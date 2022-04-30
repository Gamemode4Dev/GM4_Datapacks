# check if armor should activate
# @s = player being checked
# run from armor/check_modifier

function gm4_combat_evolved:player/calculate_hp

execute if score @s gm4_ce_health < $half_health gm4_ce_data if score $active gm4_ce_data matches 0 run function gm4_combat_evolved:armor/modifiers/activate_1

# otherwise deactivate armor
execute unless score @s gm4_ce_health < $half_health gm4_ce_data if score $active gm4_ce_data matches 1 run function gm4_combat_evolved:armor/modifiers/deactivate
