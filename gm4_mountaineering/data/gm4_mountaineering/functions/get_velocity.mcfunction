# Update the player's velocity scores
# @s = player wearing skis
# at @s
# run from ski_effects/skis_equipped and pole_effects/poles_equipped

# Get current y-position, store as y1
execute store result score @s gm4_mountaineering_y1 run data get entity @s Pos[1]

# Velocity is current position y1 minus previous position y2
scoreboard players operation @s gm4_mountaineering_vy = @s gm4_mountaineering_y1
scoreboard players operation @s gm4_mountaineering_vy -= @s gm4_mountaineering_y2

# Update y2 for use on next run of this function
scoreboard players operation @s gm4_mountaineering_y2 = @s gm4_mountaineering_y1

# Use the same method to get x velocity
execute store result score @s gm4_mountaineering_x1 run data get entity @s Pos[0]
scoreboard players operation @s gm4_mountaineering_vx = @s gm4_mountaineering_x1
scoreboard players operation @s gm4_mountaineering_vx -= @s gm4_mountaineering_x2
scoreboard players operation @s gm4_mountaineering_x2 = @s gm4_mountaineering_x1

# Use the same method to get z velocity
execute store result score @s gm4_mountaineering_z1 run data get entity @s Pos[2]
scoreboard players operation @s gm4_mountaineering_vz = @s gm4_mountaineering_z1
scoreboard players operation @s gm4_mountaineering_vz -= @s gm4_mountaineering_z2
scoreboard players operation @s gm4_mountaineering_z2 = @s gm4_mountaineering_z1
