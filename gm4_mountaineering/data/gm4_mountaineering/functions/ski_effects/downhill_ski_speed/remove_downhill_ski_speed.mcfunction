# Remove increased speed when player is no longer on snowy block, wearing skis, and travelling downhill (>=2 blocks descended)
# @s = player with skiing tag and downhill skiing tag but not having recently fallen >= 2 blocks
# at @s
# run from check_downhill_ski_speed

scoreboard players set @s gm4_mountaineering_ski_downhill 0
attribute @s minecraft:generic.movement_speed modifier remove 42a046eb-1425-4efe-831b-f891d8ede18f
tag @s remove gm4_mountaineering_skiing_downhill
