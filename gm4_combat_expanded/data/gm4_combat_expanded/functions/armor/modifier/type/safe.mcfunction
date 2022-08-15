# check if armor should activate
# @s = player being checked
# at world spawn
# run from armor/check_modifier/safe

# activate armor if player has not taken damage for 5 seconds
execute unless score @s gm4_ce_t_hurt matches 1.. if score $active gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/activate_1

# otherwise deactivate armor
execute if score @s gm4_ce_t_hurt matches 1.. if score $active gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/deactivate
