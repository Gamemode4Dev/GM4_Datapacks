# Separates an entity that needs it
# @s = entity to be separated
# at @s 
# run from fished/* & fished/*/action & fished/stealable/steal_slot/*

function gm4_reeling_rods:get_motion_to_player
function gm4_reeling_rods:summon_item with storage gm4_reeling_rods:temp

# return if no items
execute unless data entity @s Items[] run return 0

data modify storage gm4_reeling_rods:temp motion_vector set from storage gm4_reeling_rods:temp entity_data.Motion
function gm4_reeling_rods:empty_container_entity
