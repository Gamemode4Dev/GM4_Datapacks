# @s = trash_can
# run from check_dropper

# Water cools down the magma block
execute if block ~ ~-1 ~ water run tag @s add gm4_trash_disable
execute if block ~ ~1 ~ water run tag @s add gm4_trash_disable
execute if block ~-1 ~ ~ water run tag @s add gm4_trash_disable
execute if block ~1 ~ ~ water run tag @s add gm4_trash_disable
execute if block ~ ~ ~-1 water run tag @s add gm4_trash_disable
execute if block ~ ~ ~1 water run tag @s add gm4_trash_disable

# Visuals
execute if entity @s[tag=gm4_trash_disable] run particle dolphin ~ ~1.2 ~ .05 0 .05 0.1 3
execute if entity @s[tag=gm4_trash_disable] run data merge entity @s {CustomName:'"gm4_trash_can"',ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:1}}]}

# Change Tag
tag @s[tag=gm4_trash_disable] add gm4_trash_disabled
tag @s[tag=gm4_trash_disable] remove gm4_trash_disable
