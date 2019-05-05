#altar processes
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_altar]
#called by rituals:main

#check removal
execute unless block ~ ~-1 ~ minecraft:redstone_block run function rituals:altar/destroy
execute unless block ~1 ~-1 ~ minecraft:red_sandstone_stairs[half=bottom] run function rituals:altar/destroy
execute unless block ~-1 ~-1 ~ minecraft:red_sandstone_stairs[half=bottom] run function rituals:altar/destroy
execute unless block ~ ~-1 ~1 minecraft:red_sandstone_stairs[half=bottom] run function rituals:altar/destroy
execute unless block ~ ~-1 ~-1 minecraft:red_sandstone_stairs[half=bottom] run function rituals:altar/destroy
execute unless block ~1 ~-1 ~1 minecraft:red_sandstone_stairs[half=top] run function rituals:altar/destroy
execute unless block ~1 ~-1 ~-1 minecraft:red_sandstone_stairs[half=top] run function rituals:altar/destroy
execute unless block ~-1 ~-1 ~1 minecraft:red_sandstone_stairs[half=top] run function rituals:altar/destroy
execute unless block ~-1 ~-1 ~-1 minecraft:red_sandstone_stairs[half=top] run function rituals:altar/destroy
execute unless block ~1 ~ ~1 minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~1 ~ ~-1 minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~-1 ~ ~1 minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~-1 ~ ~-1 minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~1 ~1 ~1 minecraft:red_sandstone_wall run function rituals:altar/destroy
execute unless block ~1 ~1 ~-1 minecraft:red_sandstone_wall run function rituals:altar/destroy
execute unless block ~-1 ~1 ~1 minecraft:red_sandstone_wall run function rituals:altar/destroy
execute unless block ~-1 ~1 ~-1 minecraft:red_sandstone_wall run function rituals:altar/destroy
execute unless block ~1 ~2 ~1 minecraft:red_sandstone_slab run function rituals:altar/destroy
execute unless block ~1 ~2 ~-1 minecraft:red_sandstone_slab run function rituals:altar/destroy
execute unless block ~-1 ~2 ~1 minecraft:red_sandstone_slab run function rituals:altar/destroy
execute unless block ~-1 ~2 ~-1 minecraft:red_sandstone_slab run function rituals:altar/destroy
execute unless block ~1 ~2 ~ minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~-1 ~2 ~ minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~ ~2 ~1 minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~ ~2 ~-1 minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~1 ~3 ~ minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~-1 ~3 ~ minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~ ~3 ~1 minecraft:red_sandstone run function rituals:altar/destroy
execute unless block ~ ~3 ~-1 minecraft:red_sandstone run function rituals:altar/destroy

#water checks
execute if block ~1 ~-1 ~ minecraft:red_sandstone_stairs[waterlogged=true] if block ~-1 ~-1 ~ minecraft:red_sandstone_stairs[waterlogged=true] if block ~ ~-1 ~1 minecraft:red_sandstone_stairs[waterlogged=true] if block ~ ~-1 ~-1 minecraft:red_sandstone_stairs[waterlogged=true] run tag @s add gm4_altar.water

execute unless block ~1 ~-1 ~ minecraft:red_sandstone_stairs[waterlogged=true] run tag @s remove gm4_altar.water
execute unless block ~-1 ~-1 ~ minecraft:red_sandstone_stairs[waterlogged=true] run tag @s remove gm4_altar.water
execute unless block ~ ~-1 ~1 minecraft:red_sandstone_stairs[waterlogged=true] run tag @s remove gm4_altar.water
execute unless block ~ ~-1 ~-1 minecraft:red_sandstone_stairs[waterlogged=true] run tag @s remove gm4_altar.water

#sacrificing
execute if block ~ ~ ~ minecraft:fire run function rituals:altar/sacrifice/check_entity

#call rituals function tag - NOTE: IT IS A TAG TO ALLOW FOR EXPANSIONS
function #rituals:ritual_checks

#audiovisuals
execute unless entity @s[tag=gm4_altar.water] run particle minecraft:portal ~ ~ ~ 1 1 1 1 10 normal @a
execute if entity @s[tag=gm4_altar.water] run particle minecraft:nautilus ~ ~ ~ 1 1 1 1 10 normal @a
particle minecraft:block minecraft:redstone_block ~ ~ ~ .1 .1 .1 1 1 normal @a
