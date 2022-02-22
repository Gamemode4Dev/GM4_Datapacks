# run from armor/check_modifier
# @s = player being checked

# activate armor if player has not taken damage for 5 seconds
execute unless score @s gm4_ai_t_hurt matches 1.. if score $active gm4_ai_data matches 0 run function gm4_armor_identification:armor/modifiers/activate_1

# otherwise deactivate armor
execute if score @s gm4_ai_t_hurt matches 1.. if score $active gm4_ai_data matches 1 run function gm4_armor_identification:armor/modifiers/deactivate
