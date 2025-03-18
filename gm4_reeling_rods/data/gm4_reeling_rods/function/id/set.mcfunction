# function logic for setting an id on an entity
# @s = entity to be assigned id
# at @s
# run from tick

execute store result storage gm4_reeling_rods:id bit int 1 run scoreboard players set $bit gm4_reeling_rods.math 0
function gm4_reeling_rods:id/get_next with storage gm4_reeling_rods:id

# clear tags 
tag @s remove gm4_reeling_rods.id.0.0
tag @s remove gm4_reeling_rods.id.1.0
tag @s remove gm4_reeling_rods.id.2.0
tag @s remove gm4_reeling_rods.id.3.0
tag @s remove gm4_reeling_rods.id.4.0
tag @s remove gm4_reeling_rods.id.5.0
tag @s remove gm4_reeling_rods.id.6.0
tag @s remove gm4_reeling_rods.id.7.0
tag @s remove gm4_reeling_rods.id.8.0
tag @s remove gm4_reeling_rods.id.9.0
tag @s remove gm4_reeling_rods.id.10.0
tag @s remove gm4_reeling_rods.id.11.0
tag @s remove gm4_reeling_rods.id.12.0
tag @s remove gm4_reeling_rods.id.13.0
tag @s remove gm4_reeling_rods.id.14.0
tag @s remove gm4_reeling_rods.id.15.0
tag @s remove gm4_reeling_rods.id.0.1
tag @s remove gm4_reeling_rods.id.1.1
tag @s remove gm4_reeling_rods.id.2.1
tag @s remove gm4_reeling_rods.id.3.1
tag @s remove gm4_reeling_rods.id.4.1
tag @s remove gm4_reeling_rods.id.5.1
tag @s remove gm4_reeling_rods.id.6.1
tag @s remove gm4_reeling_rods.id.7.1
tag @s remove gm4_reeling_rods.id.8.1
tag @s remove gm4_reeling_rods.id.9.1
tag @s remove gm4_reeling_rods.id.10.1
tag @s remove gm4_reeling_rods.id.11.1
tag @s remove gm4_reeling_rods.id.12.1
tag @s remove gm4_reeling_rods.id.13.1
tag @s remove gm4_reeling_rods.id.14.1
tag @s remove gm4_reeling_rods.id.15.1

# assign new id
function gm4_reeling_rods:id/assign with storage gm4_reeling_rods:id next
