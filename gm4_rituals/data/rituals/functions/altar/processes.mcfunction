#altar processes
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar]
#called by rituals:main

#sacrificing
execute if block ~ ~ ~ minecraft:fire run function rituals:altar/sacrifice/check_entity

#audiovisuals
execute unless entity @s[tag=gm4_rituals_altar_water] run particle minecraft:portal ~ ~ ~ 1 1 1 1 10 normal @a
execute if entity @s[tag=gm4_rituals_altar_water] run particle minecraft:nautilus ~ ~ ~ 1 1 1 1 10 normal @a
particle minecraft:block minecraft:redstone_block ~ ~ ~ .1 .1 .1 1 1 normal @a
