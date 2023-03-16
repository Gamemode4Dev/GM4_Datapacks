# check if coral vines are still connected (5m)
# @s = coral flower
# at @s
# run from clock_coral_vine

# process vine blocks layer by layer
# ground layers are considered attached if there is a solid block below
execute positioned ~-7.5 ~-1.5 ~-7.5 as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected,dx=14,dy=0,dz=14] at @s if block ~ ~-1 ~ #gm4:full_collision run tag @s add gm4_hy_coral_vine.rooted
execute positioned ~-7.5 ~-.5 ~-7.5 as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected,dx=14,dy=0,dz=14] at @s if block ~ ~-1 ~ #gm4:full_collision run tag @s add gm4_hy_coral_vine.rooted
# higher layers need a connected vine in a 3x3 area below them
execute positioned ~-7.5 ~-.5 ~-7.5 as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-1.5 if entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] run tag @s add gm4_hy_coral_vine.connected
execute positioned ~-7.5 ~.5 ~-7.5 as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-1.5 if entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] run tag @s add gm4_hy_coral_vine.connected
execute positioned ~-7.5 ~1.5 ~-7.5 as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-1.5 if entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] run tag @s add gm4_hy_coral_vine.connected
execute positioned ~-7.5 ~2.5 ~-7.5 as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-1.5 if entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] run tag @s add gm4_hy_coral_vine.connected
execute positioned ~-7.5 ~3.5 ~-7.5 as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-1.5 if entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] run tag @s add gm4_hy_coral_vine.connected
execute positioned ~-7.5 ~4.5 ~-7.5 as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-1.5 if entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] run tag @s add gm4_hy_coral_vine.connected
execute positioned ~-7.5 ~5.5 ~-7.5 as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-1.5 if entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] run tag @s add gm4_hy_coral_vine.connected

# count connected (rooted/non-rooted) vine leaves
execute positioned ~-7.5 ~-1.5 ~-7.5 store result score @s gm4_hy_vine_root_count if entity @e[type=marker,tag=gm4_hy_coral_vine.rooted,dx=14,dy=7,dz=14]
execute positioned ~-7.5 ~-1.5 ~-7.5 store result score @s gm4_hy_vine_count if entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=14,dy=7,dz=14]
