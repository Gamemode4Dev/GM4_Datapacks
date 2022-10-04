# Add further increased speed when player is on snowy block, wearing skis, and travelling steep downhill (>=6 blocks descended)
# @s = player without skiing tag and having fallen >=6 blocks
# at @s
# run from main

tag @s add gm4_mountaineering_skiing_steep_downhill
scoreboard players set @s gm4_mountaineering_ski_steep_downhill 4
attribute @s minecraft:generic.movement_speed modifier add 8aed075d-afeb-4943-af9d-6b7e1d31e0de gm4_mountaineering_steep_downhill_speed_boost 0.150 multiply_base
