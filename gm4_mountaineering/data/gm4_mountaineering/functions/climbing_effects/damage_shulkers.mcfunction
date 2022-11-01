# decrease the score of each climbing shulker
# @s = player wearing crampons
# at @s
# run from climbing_effects/add_climb_effects

tag @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist] remove gm4_mountaineering_new_shulker
scoreboard players remove @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist] gm4_mountaineering_climbing_shulker_countdown 1
tag @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist, scores={gm4_mountaineering_climbing_shulker_countdown=..0}] add gm4_mountaineering_kill_shulker
tag @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist, distance=2.5..] add gm4_mountaineering_kill_shulker
execute run function gm4_mountaineering:climbing_effects/kill_shulkers
