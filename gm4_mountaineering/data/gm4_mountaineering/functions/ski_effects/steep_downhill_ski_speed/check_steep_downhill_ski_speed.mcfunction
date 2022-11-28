# Checks that the player still travels steep downhill (>=7 blocks, or >=5 blocks with poles)
# @s = player with skiing tag and having fallen >=7 blocks, or >=5 blocks with poles
# at @s
# run from skis_equipped

scoreboard players remove @s[scores={gm4_mountaineering_ski_steep_downhill=1.., gm4_mountaineering_vy=-6..},predicate=!gm4_mountaineering:holding_poles] gm4_mountaineering_ski_steep_downhill 1
scoreboard players remove @s[scores={gm4_mountaineering_ski_steep_downhill=1.., gm4_mountaineering_vy=-4..},predicate=gm4_mountaineering:holding_poles] gm4_mountaineering_ski_steep_downhill 1
scoreboard players set @s[tag=gm4_mountaineering_skiing,scores={gm4_mountaineering_vy=..-7}] gm4_mountaineering_ski_steep_downhill 4
scoreboard players set @s[tag=gm4_mountaineering_skiing,predicate=gm4_mountaineering:holding_poles,scores={gm4_mountaineering_vy=..-7}] gm4_mountaineering_ski_steep_downhill 4

# Remove speed if no longer travelling downhill or removed skis
execute if entity @s[scores={gm4_mountaineering_ski_steep_downhill=..0}] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/remove_steep_downhill_ski_speed
execute if entity @s[tag=!gm4_mountaineering_skiing] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/remove_steep_downhill_ski_speed
