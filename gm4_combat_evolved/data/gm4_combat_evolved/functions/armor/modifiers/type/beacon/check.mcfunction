# mark players wearing a beacon armor piece, and flash a beacon if crouching
# @s = player wearing beacon armor
# at @s
# run from armor/check_modifier

tag @s add gm4_ce_beacon_active

# flash if player is crouching
execute if predicate gm4_combat_evolved:technical/crouching anchored eyes run particle flash ^ ^ ^-0.3 0 0 0 0 0 force @a
execute if predicate gm4_combat_evolved:technical/crouching run effect give @s glowing 1 0 true
