# Checks that the player still travels steep downhill (>=5 blocks, or >=3 blocks with poles)
# @s = player with skiing tag and having initially fallen >=7 blocks, or >=5 blocks with poles
# at @s
# run from skis_equipped

# vertical speed threshold for speed effect removal is 2 lower than for adding speed effect, to enable longer periods of speed
# also, remove an additional second of speed if travelling uphill
scoreboard players remove @s[scores={gm4_mountaineering_ski_steep_downhill=1..,gm4_mountaineering_vy=-4..},predicate=!gm4_mountaineering:holding_poles] gm4_mountaineering_ski_steep_downhill 1
scoreboard players remove @s[scores={gm4_mountaineering_ski_steep_downhill=1..,gm4_mountaineering_vy=-2..},predicate=gm4_mountaineering:holding_poles] gm4_mountaineering_ski_steep_downhill 1
scoreboard players remove @s[scores={gm4_mountaineering_ski_steep_downhill=1..,gm4_mountaineering_vy=1..}] gm4_mountaineering_ski_steep_downhill 1
scoreboard players set @s[tag=gm4_mountaineering_skiing,scores={gm4_mountaineering_vy=..-4}] gm4_mountaineering_ski_steep_downhill 10
scoreboard players set @s[tag=gm4_mountaineering_skiing,predicate=gm4_mountaineering:holding_poles,scores={gm4_mountaineering_vy=..-2}] gm4_mountaineering_ski_steep_downhill 10

# Remove speed if no longer travelling downhill or removed skis
execute if entity @s[scores={gm4_mountaineering_ski_steep_downhill=..0}] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/remove_steep_downhill_ski_speed
execute if entity @s[tag=!gm4_mountaineering_skiing] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/remove_steep_downhill_ski_speed
