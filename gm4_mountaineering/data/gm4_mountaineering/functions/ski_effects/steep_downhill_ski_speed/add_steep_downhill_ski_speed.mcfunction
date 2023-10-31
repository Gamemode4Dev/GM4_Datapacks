# Add further increased speed when player is on snowy block, wearing skis, and travelling steep downhill (>=7 blocks descended, or >=5 blocks with poles)
# @s = player without skiing tag and having fallen >=7 blocks, or >=5 blocks with poles
# at @s
# run from skis_equipped

tag @s add gm4_mountaineering_skiing_steep_downhill
scoreboard players set @s gm4_mountaineering_ski_steep_downhill 10
attribute @s minecraft:generic.movement_speed modifier add 8aed075d-afeb-4943-af9d-6b7e1d31e0de "gm4_mountaineering_steep_downhill_speed_boost" 0.175 multiply_base

# Give an advancement if not yet achieved
advancement grant @s only gm4:ski_fast
