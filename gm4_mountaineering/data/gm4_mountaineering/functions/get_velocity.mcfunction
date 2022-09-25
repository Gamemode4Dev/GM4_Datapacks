# Update the player's velocity score
# @s = player
# at @s
# run from main

# Get current y-position, store as y1
execute store result score @s gm4_mountaineering_y1 run data get entity @s Pos[1]

# Velocity is current position y1 minus previous position y2
scoreboard players operation @s gm4_mountaineering_vy = @s gm4_mountaineering_y1
scoreboard players operation @s gm4_mountaineering_vy -= @s gm4_mountaineering_y2

# Update y2 for use on next run of this function
scoreboard players operation @s gm4_mountaineering_y2 = @s gm4_mountaineering_y1