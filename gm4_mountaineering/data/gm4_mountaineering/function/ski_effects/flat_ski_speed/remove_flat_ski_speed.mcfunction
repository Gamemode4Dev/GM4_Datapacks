# Remove speed when player is no longer on snowy block or wearing skis
# @s = player without skiing tag, with speed skiing tag
# at @s
# run from skis_equipped

attribute @s minecraft:movement_speed modifier remove minecraft:f2781530-676b-401d-b2e3-12de37f9b82a
tag @s remove gm4_mountaineering_ski_speed
