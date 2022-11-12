# decrease the score of each climbing shulker
# @s = player wearing crampons
# at @s
# run from climbing_main

# reduce score of existing shulkers
scoreboard players remove @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist] gm4_mountaineering_climbing_shulker_countdown 1
tag @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist, scores={gm4_mountaineering_climbing_shulker_countdown=..0}] add gm4_mountaineering_kill_shulker

# initialise new shulkers
tag @e[type=minecraft:shulker, tag=gm4_mountaineering_new_shulker] add gm4_mountaineering_climb_assist
scoreboard players set @e[type=minecraft:shulker, tag=gm4_mountaineering_new_shulker] gm4_mountaineering_climbing_shulker_countdown 40
tag @e[type=minecraft:shulker, tag=gm4_mountaineering_new_shulker] remove gm4_mountaineering_new_shulker

execute run function gm4_mountaineering:climbing_effects/kill_shulkers
