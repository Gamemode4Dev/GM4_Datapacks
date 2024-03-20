# start a new coral vine from this coral flower
# @s = coral flower
# at @s
# run from coral_vine/grow/initiate

# pick a random location
execute positioned ~ ~-1 ~ run function gm4_hydromancy:coral_vine/grow/root_locations
execute as @e[type=marker,tag=gm4_hy_possible_root_growth,limit=1,sort=random] at @s run function gm4_hydromancy:coral_vine/grow/growth
kill @e[type=marker,tag=gm4_hy_possible_root_growth]
