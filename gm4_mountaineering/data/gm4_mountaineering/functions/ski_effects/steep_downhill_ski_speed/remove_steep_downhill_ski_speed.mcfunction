# Remove increased speed when player is no longer on snowy block, wearing skis, and travelling steep downhill (>=6 blocks descended)
# @s = player with skiing tag and steep downhill skiing tag but no longer meeting relevant requirements
# at @s
# run from ski_effects/steep_downhill_ski_speed/check_steep_downhill_ski_speed

scoreboard players set @s gm4_mountaineering_ski_steep_downhill 0
attribute @s minecraft:generic.movement_speed modifier remove 8aed075d-afeb-4943-af9d-6b7e1d31e0de
tag @s remove gm4_mountaineering_skiing_steep_downhill
