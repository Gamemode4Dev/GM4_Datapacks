schedule function gm4_hydromancy:tick 1t

execute as @e[type=marker,tag=gm4_hy_coral_vine] at @s unless block ~ ~ ~ #gm4_hydromancy:coral_vine run function gm4_hydromancy:coral_vine/removed
