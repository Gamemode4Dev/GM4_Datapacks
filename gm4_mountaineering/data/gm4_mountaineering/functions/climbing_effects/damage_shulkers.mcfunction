# increase the score of each climbing shulker, and kill after reaching 6
# @s = shulker with tag gm4_mountaineering_climb_assist
# at @s
# run from player_main

scoreboard players add @s gm4_mountaineering_climbing_shulker_countdown 1
execute as @s[scores={gm4_mountaineering_climbing_shulker_countdown=6..}] run function gm4_mountaineering:climbing_effects/kill_shulkers
