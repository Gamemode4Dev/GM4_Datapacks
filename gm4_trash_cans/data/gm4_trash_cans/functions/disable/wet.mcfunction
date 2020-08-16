# @s = trash_can
# run from check_disable

# Water cools down the magma block
tag @s add gm4_trash_disable
execute unless block ~ ~-1 ~ water unless block ~ ~1 ~ water unless block ~-1 ~ ~ water unless block ~1 ~ ~ water unless block ~ ~ ~-1 water unless block ~ ~ ~1 water run tag @s remove gm4_trash_disable

# Visuals
execute if entity @s[tag=gm4_trash_disable] run particle dolphin ~ ~1.2 ~ .05 0 .05 0.1 3

# Change Tag
tag @s[tag=gm4_trash_disable] add gm4_trash_disabled
tag @s[tag=gm4_trash_disable] remove gm4_trash_disable
