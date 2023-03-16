schedule function gm4_hydromancy:clock_coral_vine 300s

# check if vine leaves are still connected
tag @e[type=marker,tag=gm4_hy_coral_vine.connected] remove gm4_hy_coral_vine.connected
tag @e[type=marker,tag=gm4_hy_coral_vine.rooted] remove gm4_hy_coral_vine.rooted
execute as @e[type=item_display,tag=gm4_hy_coral_flower] at @s run function gm4_hydromancy:coral_vine/check

# kill unconnected vine leaves
execute as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected] run function gm4_hydromancy:coral_vine/die

# mark vine leaves at the top to be available for growth and pick a random one at each coral flower
execute as @e[type=marker,tag=gm4_hy_coral_vine.connected] at @s positioned ~-1.5 ~.5 ~-1.5 unless entity @e[type=marker,tag=gm4_hy_coral_vine,dx=2,dy=0,dz=0] run tag @s add gm4_hy_coral_vine.can_grow
execute as @e[type=item_display,tag=gm4_hy_coral_flower] at @s positioned ~-7.5 ~-1.5 ~-7.5 run function gm4_hydromancy:coral_vine/grow/initiate
tag @e[type=marker,tag=gm4_hy_coral_vine.can_grow] remove gm4_hy_coral_vine.can_grow

# kill unconnected vine leaves
tag @e[type=marker,tag=gm4_hy_coral_vine.rooted] add gm4_hy_coral_vine.connected
execute as @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.connected] run function gm4_hydromancy:coral_vine/die
