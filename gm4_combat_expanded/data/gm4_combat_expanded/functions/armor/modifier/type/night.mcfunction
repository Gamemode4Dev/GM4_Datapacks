# check if armor should activate
# @s = player being checked
# at world spawn
# run from armor/check_modifier/night

# activate armor if it is night-time
execute if predicate gm4_combat_expanded:technical/night_time if score $active gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/activate_1

# otherwise deactivate armor
execute unless predicate gm4_combat_expanded:technical/night_time if score $active gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/deactivate
