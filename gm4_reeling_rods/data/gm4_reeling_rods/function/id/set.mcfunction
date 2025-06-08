# function logic for setting an id on an entity
# @s = entity to be assigned id
# at @s
# run from id/select_entities

# get new id
execute store result storage gm4_reeling_rods:id bit int 1 run scoreboard players set $bit gm4_reeling_rods.math 0
function gm4_reeling_rods:id/get_next with storage gm4_reeling_rods:id

# assign new id
function gm4_reeling_rods:id/assign with storage gm4_reeling_rods:id next
