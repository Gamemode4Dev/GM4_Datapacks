# check if coral vines are still connected
# @s = coral flower
# at @s positioned ~-7.5 ~-1.5 ~-7.5
# run from coral_core/kill
# run from coral_vine/removed
# run from coral_vine/grow/initiate

# ground layers are considered rooted if there is a solid block below, and connected if they are connected to the coral flower (orthoganally)
execute as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=1,dz=14] at @s if block ~ ~-1 ~ #gm4:full_collision run tag @s add gm4_hy_coral_vine.rooted
execute as @e[type=marker,tag=gm4_hy_coral_vine.rooted,dx=14,dy=1,dz=14] at @s unless block ~ ~-1 ~ #gm4:full_collision run tag @s remove gm4_hy_coral_vine.rooted
tag @e[type=marker,tag=gm4_hy_coral_vine.rooted,dx=14,dy=7,dz=14] remove gm4_hy_coral_vine.connected
execute at @s[tag=gm4_hy_coral_vine.connected,dx=14,dy=7,dz=14] positioned ~ ~-1 ~ run function gm4_hydromancy:coral_vine/check_root

# higher layers need a connected vine in a + shaped area below them to stay connected
execute positioned ~ ~1 ~ as @e[type=marker,tag=gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-.5 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] positioned ~1 ~ ~-1 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=0,dy=0,dz=2] run tag @s remove gm4_hy_coral_vine.connected
execute positioned ~ ~2 ~ as @e[type=marker,tag=gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-.5 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] positioned ~1 ~ ~-1 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=0,dy=0,dz=2] run tag @s remove gm4_hy_coral_vine.connected
execute positioned ~ ~3 ~ as @e[type=marker,tag=gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-.5 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] positioned ~1 ~ ~-1 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=0,dy=0,dz=2] run tag @s remove gm4_hy_coral_vine.connected
execute positioned ~ ~4 ~ as @e[type=marker,tag=gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-.5 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] positioned ~1 ~ ~-1 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=0,dy=0,dz=2] run tag @s remove gm4_hy_coral_vine.connected
execute positioned ~ ~5 ~ as @e[type=marker,tag=gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-.5 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] positioned ~1 ~ ~-1 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=0,dy=0,dz=2] run tag @s remove gm4_hy_coral_vine.connected
execute positioned ~ ~6 ~ as @e[type=marker,tag=gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-.5 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] positioned ~1 ~ ~-1 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=0,dy=0,dz=2] run tag @s remove gm4_hy_coral_vine.connected
execute positioned ~ ~7 ~ as @e[type=marker,tag=gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=0,dz=14] at @s positioned ~-1.5 ~-1.5 ~-.5 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=2,dy=0,dz=0] positioned ~1 ~ ~-1 unless entity @e[type=marker,tag=gm4_hy_coral_vine.connected,dx=0,dy=0,dz=2] run tag @s remove gm4_hy_coral_vine.connected

# kill unconnected vine leaves
execute as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected,dx=14,dy=7,dz=14] at @s run function gm4_hydromancy:coral_vine/die
