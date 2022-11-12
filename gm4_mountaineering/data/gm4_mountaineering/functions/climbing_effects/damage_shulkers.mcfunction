# increase the score of each climbing shulker
# @s = shulker with tag gm4_mountaineering_climb_assist
# at @s
# run from climbing_main

# Increase score of existing shulkers, and kill after reaching 40
scoreboard players add @s gm4_mountaineering_climbing_shulker_countdown 1
tag @s[scores={gm4_mountaineering_climbing_shulker_countdown=40..}] add gm4_mountaineering_kill_shulker
execute run function gm4_mountaineering:climbing_effects/kill_shulkers
