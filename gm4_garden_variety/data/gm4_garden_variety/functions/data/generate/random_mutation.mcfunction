# run from TODO

# generate random mutation
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_gv_random_mutation"],Items:[{},{},{}]}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_gv_random_mutation] horse.0 loot gm4_garden_variety:mutations/generate_random

# store mutation in storage
data remove storage gm4_garden_variety:generate/mutation output 
data modify storage gm4_garden_variety:generate/mutation output set from entity @e[type=trader_llama,limit=1,tag=gm4_gv_random_mutation] Items[0].tag.gm4_garden_variety.random_mutation

# [Debug]
data modify storage gm4_garden_variety:debug/generate/mutation backlog prepend from storage gm4_garden_variety:generate/mutation output
data remove storage gm4_garden_variety:debug/generate/mutation backlog[10]
#tellraw @p {"nbt":"backlog","storage":"gm4_garden_variety:debug/generate/mutation backlog","interpret":true}

# kill llama
execute as @e[type=trader_llama,tag=gm4_gv_random_mutation] run data merge entity @s {Health:0,DeathTime:19}
