# run from armor/check_modifier
# @s = player being checked

# activate armor if player has taken damage in the last 2.4 seconds
execute if score @s gm4_ce_t_hurt matches 3.. if score $active gm4_ce_data matches 0 run function gm4_combat_evolved:armor/modifiers/activate_1

# otherwise deactivate armor
execute unless score @s gm4_ce_t_hurt matches 3.. if score $active gm4_ce_data matches 1 run function gm4_combat_evolved:armor/modifiers/deactivate
