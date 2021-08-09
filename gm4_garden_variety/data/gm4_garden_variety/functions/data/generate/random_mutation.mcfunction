# run from TODO

# generate random mutation
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_gv_random_mutation"],Items:[{},{},{}]}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_gv_random_mutation] horse.0 loot gm4_garden_variety:mutations/generate_random

# store mutation in storage
data modify storage gm4_garden_variety:data/mutation random_mutation set from entity @e[type=trader_llama,limit=1,tag=gm4_gv_random_mutation] Items[0].tag.gm4_garden_variety.random_mutation

