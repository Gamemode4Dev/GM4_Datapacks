# mark players wearing a beacon armor piece, and flash a beacon if crouching
# @s = player wearing beacon armor
# at @s
# run from armor/check_modifier/equip

tag @s add gm4_ce_beacon_active

# flash if player is crouching
execute if predicate gm4_combat_expanded:technical/crouching anchored eyes run function gm4_combat_expanded:armor/modifier/type/beacon/flash
