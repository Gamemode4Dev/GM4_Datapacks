#run from seasons:blocks/global


#PUMPKINS
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ grass_block if block ~ 2 ~ diorite if block ~ 4 ~ bedrock run summon area_effect_cloud ~ ~ ~ {Tags:[gm4_szn_block,gm4_szn_pumpkin],CustomName:"{\"text\":\"gm4_szn_pumpkin\"}",Duration:36000}
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ grass_block if block ~ 2 ~ diorite if block ~ 4 ~ bedrock run setblock ~ ~ ~ pumpkin keep


#APPLES
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ oak_leaves[distance=4,persistent=false] run summon item ~ ~-3 ~ {Item:{id:"minecraft:apple",Count:1b},PickupDelay:20s}


#LEAVES
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ oak_leaves[distance=2,persistent=false] run summon item ~ ~-3 ~ {Tags:[gm4_szn_leaf],Item:{id:"minecraft:oak_leaves",Count:1b},PickupDelay:20s}
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ birch_leaves[distance=2,persistent=false] run summon item ~ ~-3 ~ {Tags:[gm4_szn_leaf],Item:{id:"minecraft:birch_leaves",Count:1b},PickupDelay:20s}
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ dark_oak_leaves[distance=2,persistent=false] run summon item ~ ~-3 ~ {Tags:[gm4_szn_leaf],Item:{id:"minecraft:dark_oak_leaves",Count:1b},PickupDelay:20s}


#TURKEYS
execute at @e[tag=gm4_szn_global] if block ~ ~-1 ~ grass_block if block ~-5 ~-8 ~2 andesite if block ~2 ~-23 ~4 diorite if block ~ 5 ~ bedrock run summon chicken ~ ~ ~ {DeathLootTable:"seasons:turkey",Health:30f,EggLayTime:100000,Tags:[gm4_szn_turkey],CustomName:"{\"text\":\"Turkey\"}",ArmorDropChances:[0.85F,0.85F,0.85F,0.2F],Attributes:[{Name:generic.maxHealth,Base:30},{Name:generic.movementSpeed,Base:0.034}]}