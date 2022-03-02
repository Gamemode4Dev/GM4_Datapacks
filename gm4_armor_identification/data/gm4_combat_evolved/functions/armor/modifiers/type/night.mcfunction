# run from armor/check_modifier
# @s = player being checked

# activate armor if it is night-time
execute if predicate gm4_combat_evolved:technical/night_time if score $active gm4_ce_data matches 0 run function gm4_combat_evolved:armor/modifiers/activate_1

# otherwise deactivate armor
execute unless predicate gm4_combat_evolved:technical/night_time if score $active gm4_ce_data matches 1 run function gm4_combat_evolved:armor/modifiers/deactivate
