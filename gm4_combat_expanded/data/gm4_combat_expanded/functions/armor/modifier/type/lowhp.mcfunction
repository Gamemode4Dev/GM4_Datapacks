# check if armor should activate
# @s = player being checked
# at world spawn
# run from armor/check_modifier/lowhp

function gm4_combat_expanded:player/calculate_hp

execute if score @s gm4_ce_health < $half_health gm4_ce_data if score $active gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/activate_1

# otherwise deactivate armor
execute unless score @s gm4_ce_health < $half_health gm4_ce_data if score $active gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/deactivate
