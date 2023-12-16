# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/check_modifier/night

# activate armor if night-time
execute if score $active gm4_ce_data matches 0 if predicate gm4_combat_expanded:technical/night_time run function gm4_combat_expanded:armor/modifier/type/nocturnal/activate

# otherwise deactivate armor
execute if score $active gm4_ce_data matches 1 unless predicate gm4_combat_expanded:technical/night_time run function gm4_combat_expanded:armor/modifier/type/nocturnal/deactivate
