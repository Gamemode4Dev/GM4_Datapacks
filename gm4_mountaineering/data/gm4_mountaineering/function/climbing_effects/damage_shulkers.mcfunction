# increase the score of each climbing shulker, and kill after reaching 6
# @s = shulker with tag gm4_mountaineering_climb_assist
# at @s
# run from main

scoreboard players add @s gm4_mountaineering_climbing_shulker_countdown 1
teleport @s[scores={gm4_mountaineering_climbing_shulker_countdown=6..}] ~ -10000 ~
kill @s[scores={gm4_mountaineering_climbing_shulker_countdown=6..}]
