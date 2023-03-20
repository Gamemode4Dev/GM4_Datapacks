# grow the coral vine connected to this coral flower
# @s = coral flower
# at @s positioned ~-7.5 ~-1.5 ~-7.5
# run from clock_coral_vine

# count vines
execute store result score @s gm4_hy_vine_root_count if entity @e[type=marker,tag=gm4_hy_coral_vine.rooted,dx=14,dy=2,dz=14]
execute store result score @s gm4_hy_vine_count if entity @e[type=marker,tag=gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.rooted,dx=14,dy=7,dz=14]

# pick a random location to grow the vine
# roots are always an option
tag @e[type=marker,tag=gm4_hy_coral_vine.rooted,dx=14,dy=7,dz=14] add gm4_hy_coral_vine.can_grow
# dy = 6 as the top layer can't ever grow
execute as @e[type=marker,tag=gm4_hy_coral_vine.connected,tag=!gm4_hy_coral_vine.can_grow,dx=14,dy=6,dz=14] at @s positioned ~-1.5 ~.5 ~-1.5 unless entity @e[type=marker,tag=gm4_hy_coral_vine,dx=2,dy=0,dz=2] run tag @s add gm4_hy_coral_vine.can_grow
execute as @e[type=marker,tag=gm4_hy_coral_vine.can_grow,limit=1,sort=random] at @s run function gm4_hydromancy:coral_vine/grow/try_growth
execute as @e[type=marker,tag=gm4_hy_possible_vine_growth,limit=1,sort=random] at @s run function gm4_hydromancy:coral_vine/grow/growth
tag @e[type=marker,tag=gm4_hy_coral_vine.can_grow] remove gm4_hy_coral_vine.can_grow
tag @e[type=marker,tag=gm4_hy_coral_vine.tried_growth] remove gm4_hy_coral_vine.tried_growth
kill @e[type=marker,tag=gm4_hy_possible_vine_growth]

# if coral flower has 0 vines find a new start
execute if score @s[scores={gm4_hy_vine_root_count=0}] gm4_hy_vine_count matches 0 at @s run function gm4_hydromancy:coral_vine/grow/fresh_vine

# if there are more vine blocks than root blocks expand root
execute if score @s gm4_hy_vine_count > @s gm4_hy_vine_root_count run function gm4_hydromancy:coral_vine/grow/expand_root

# check connection of the vine
function gm4_hydromancy:coral_vine/check_connection
