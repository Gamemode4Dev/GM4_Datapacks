# Checks that the player still travels steep downhill (>=6 blocks)
# @s = player with skiing tag and having fallen >=6 blocks
# at @s
# run from main

execute if entity @s[scores={gm4_mountaineering_ski_steep_downhill=1..}] unless score @s gm4_mountaineering_vy matches ..-6 run scoreboard players remove @s gm4_mountaineering_ski_steep_downhill 1
execute if score @s[tag=gm4_mountaineering_skiing] gm4_mountaineering_vy matches ..-6 run scoreboard players set @s gm4_mountaineering_ski_steep_downhill 4

# Remove speed if no longer travelling downhill or removed skis
execute at @s[scores={gm4_mountaineering_ski_steep_downhill=..0}] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/remove_steep_downhill_ski_speed
execute at @s[tag=!gm4_mountaineering_skiing] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/remove_steep_downhill_ski_speed
