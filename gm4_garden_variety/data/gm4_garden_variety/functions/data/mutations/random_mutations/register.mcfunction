# run from TODO

# random mutation (#1)
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_gv_random_mutation","gm4_gv_new_mutation_option"],Items:[{},{},{}]}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_gv_new_mutation_option] horse.0 loot gm4_garden_variety:mutations/generate_random
tag @e[type=trader_llama] remove gm4_gv_new_mutation_option

# random mutation (#2)
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_gv_random_mutation","gm4_gv_new_mutation_option"],Items:[{},{},{}]}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_gv_new_mutation_option] horse.0 loot gm4_garden_variety:mutations/generate_random
tag @e[type=trader_llama] remove gm4_gv_new_mutation_option

# random mutation (#3)
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_gv_random_mutation","gm4_gv_new_mutation_option"],Items:[{},{},{}]}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_gv_new_mutation_option] horse.0 loot gm4_garden_variety:mutations/generate_random
tag @e[type=trader_llama] remove gm4_gv_new_mutation_option
