# Checks that the player still travels downhill (>=1 blocks)
# @s = player with skiing tag and having initially fallen >=2 blocks
# at @s
# run from skis_equipped

# remove a second of speed if the player has not fallen >=1 block, and an additional second if travelling uphill 
scoreboard players remove @s[scores={gm4_mountaineering_ski_downhill=1..,gm4_mountaineering_vy=0..}] gm4_mountaineering_ski_downhill 1
scoreboard players remove @s[scores={gm4_mountaineering_ski_downhill=1..,gm4_mountaineering_vy=1..}] gm4_mountaineering_ski_downhill 1
scoreboard players set @s[tag=gm4_mountaineering_skiing,scores={gm4_mountaineering_vy=..-1}] gm4_mountaineering_ski_downhill 10

# Remove speed if no longer travelling downhill or removed skis
execute if entity @s[scores={gm4_mountaineering_ski_downhill=..0}] run function gm4_mountaineering:ski_effects/downhill_ski_speed/remove_downhill_ski_speed
execute if entity @s[tag=!gm4_mountaineering_skiing] run function gm4_mountaineering:ski_effects/downhill_ski_speed/remove_downhill_ski_speed
