# decrease the score of each climbing shulker, and kill them if it falls to 0
# @s = player wearing crampons
# at @s
# run from climbing_effects/add_climb_effects

tag @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist] remove gm4_mountaineering_new_shulker
scoreboard players remove @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist] gm4_mountaineering_climbing_shulker_countdown 1
kill @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist, scores={gm4_mountaineering_climbing_shulker_countdown=..0}]
kill @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist, distance=2.5..]
