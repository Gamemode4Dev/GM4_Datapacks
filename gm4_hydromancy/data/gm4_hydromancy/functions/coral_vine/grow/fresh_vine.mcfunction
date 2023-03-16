
# mark possible growth locations, prefering lower down
execute positioned ~ ~-1 ~ run function gm4_hydromancy:coral_vine/grow/root
execute unless entity @e[type=marker,tag=gm4_hy_possible_root_growth] run function gm4_hydromancy:coral_vine/grow/root
# pick a random location
execute as @e[type=marker,tag=gm4_hy_possible_root_growth,limit=1,sort=nearest] at @s run function gm4_hydromancy:coral_vine/grow/growth
kill @e[type=marker,tag=gm4_hy_possible_root_growth]
