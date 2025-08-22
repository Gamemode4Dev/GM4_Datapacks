# Separates an entity that needs it
# @s = entity with items to be yoinked
# at bobber in @s (most of the time)
# run from hooked_entity/* & reeling/* & reeling/*/action & reeling/stealable/steal_slot/*

function gm4_reeling_rods:get_motion_to_player
function gm4_reeling_rods:summon_item with storage gm4_reeling_rods:temp

execute unless data entity @s Items[] run return 0

# Entities with Items tag
data modify storage gm4_reeling_rods:temp motion_vector set from storage gm4_reeling_rods:temp entity_data.Motion
function gm4_reeling_rods:reeling/empty_container_entity
