# Add some speed when player is on snowy block and wearing skis
# @s = player with skiing tag, without speed skiing tag
# at @s
# run from skis_equipped

attribute @s minecraft:generic.movement_speed modifier add f2781530-676b-401d-b2e3-12de37f9b82a "gm4_mountaineering_flat_speed" 0.3 multiply_base
tag @s add gm4_mountaineering_ski_speed
