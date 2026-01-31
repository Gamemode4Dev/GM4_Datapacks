# set an id on an entity
# @s = entity to be assigned id
# at @s
# run from id/select_entities

# get new id
function gm4_reeling_rods:id/get_next

# assign new id
scoreboard players operation @s gm4_reeling_rods.id_bit.0 = $next gm4_reeling_rods.id_bit.0
scoreboard players operation @s gm4_reeling_rods.id_bit.1 = $next gm4_reeling_rods.id_bit.1
scoreboard players operation @s gm4_reeling_rods.id_bit.2 = $next gm4_reeling_rods.id_bit.2
scoreboard players operation @s gm4_reeling_rods.id_bit.3 = $next gm4_reeling_rods.id_bit.3
scoreboard players operation @s gm4_reeling_rods.id_bit.4 = $next gm4_reeling_rods.id_bit.4
scoreboard players operation @s gm4_reeling_rods.id_bit.5 = $next gm4_reeling_rods.id_bit.5
scoreboard players operation @s gm4_reeling_rods.id_bit.6 = $next gm4_reeling_rods.id_bit.6
scoreboard players operation @s gm4_reeling_rods.id_bit.7 = $next gm4_reeling_rods.id_bit.7
scoreboard players operation @s gm4_reeling_rods.id_bit.8 = $next gm4_reeling_rods.id_bit.8
scoreboard players operation @s gm4_reeling_rods.id_bit.9 = $next gm4_reeling_rods.id_bit.9
scoreboard players operation @s gm4_reeling_rods.id_bit.10 = $next gm4_reeling_rods.id_bit.10
scoreboard players operation @s gm4_reeling_rods.id_bit.11 = $next gm4_reeling_rods.id_bit.11
scoreboard players operation @s gm4_reeling_rods.id_bit.12 = $next gm4_reeling_rods.id_bit.12
scoreboard players operation @s gm4_reeling_rods.id_bit.13 = $next gm4_reeling_rods.id_bit.13
scoreboard players operation @s gm4_reeling_rods.id_bit.14 = $next gm4_reeling_rods.id_bit.14
scoreboard players operation @s gm4_reeling_rods.id_bit.15 = $next gm4_reeling_rods.id_bit.15
tag @s add gm4_reeling_rods.id.tagged
