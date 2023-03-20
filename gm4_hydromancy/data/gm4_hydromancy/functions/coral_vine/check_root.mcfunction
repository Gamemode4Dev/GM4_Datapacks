# connect this coral vine root, and spread connection
# @s = coral vine
# at @s
# run from coral_vine/check_connection
# run from here

tag @s add gm4_hy_coral_vine.connected
execute positioned ~-1.5 ~-.5 ~-1.5 as @e[type=marker,tag=gm4_hy_coral_vine.rooted,tag=!gm4_hy_coral_vine.connected,dx=2,dy=0,dz=2] at @s run function gm4_hydromancy:coral_vine/check_root
execute positioned ~-.5 ~.5 ~-.5 as @e[type=marker,tag=gm4_hy_coral_vine.rooted,tag=!gm4_hy_coral_vine.connected,dx=0,dy=0,dz=0] at @s run function gm4_hydromancy:coral_vine/check_root
