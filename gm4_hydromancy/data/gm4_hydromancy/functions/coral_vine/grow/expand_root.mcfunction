# expand the coral vine root at this coral flower
# @s = coral flower
# at @s
# run from coral_vine/grow/initiate

# prefer blocks adjacent to the coral flower
execute at @s positioned ~ ~-1 ~ run function gm4_hydromancy:coral_vine/grow/root_locations
# possible growth locations can overlap if there are multiple root blocks bordering it, giving increased chances of growth there
execute unless entity @e[type=marker,tag=gm4_hy_possible_root_growth] as @e[type=marker,tag=gm4_hy_coral_vine.rooted,dx=14,dy=1,dz=14] at @s run function gm4_hydromancy:coral_vine/grow/root_locations
execute as @e[type=marker,tag=gm4_hy_possible_root_growth,limit=1,sort=random] at @s run function gm4_hydromancy:coral_vine/grow/growth
kill @e[type=marker,tag=gm4_hy_possible_root_growth]
