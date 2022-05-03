# check if armor should activate
# @s = player being checked
# run from armor/check_modifier

# activate armor if player has killed a mob in the last 4 seconds
execute if score @s gm4_ce_t_kill matches 1.. if score $active gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifiers/activate_1

# otherwise deactivate armor
execute unless score @s gm4_ce_t_kill matches 1.. if score $active gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifiers/deactivate
