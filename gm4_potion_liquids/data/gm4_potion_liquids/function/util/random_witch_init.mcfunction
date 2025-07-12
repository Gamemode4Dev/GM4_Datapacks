#@s = liquid tank to be initialized to random potion
#run from potion_liquids:util/witch

summon area_effect_cloud ~ ~ ~ {Radius:0.0f,custom_particle:{type:"minecraft:block",block_state:"minecraft:air"},CustomName:"gm4_pl_random_witch_init",Tags:["gm4_pl_random_witch_init","gm4_lt_random_regeneration"]}
summon area_effect_cloud ~ ~ ~ {Radius:0.0f,custom_particle:{type:"minecraft:block",block_state:"minecraft:air"},CustomName:"gm4_pl_random_witch_init",Tags:["gm4_pl_random_witch_init","gm4_lt_random_swiftness"]}
summon area_effect_cloud ~ ~ ~ {Radius:0.0f,custom_particle:{type:"minecraft:block",block_state:"minecraft:air"},CustomName:"gm4_pl_random_witch_init",Tags:["gm4_pl_random_witch_init","gm4_lt_random_fire_resistance"]}
summon area_effect_cloud ~ ~ ~ {Radius:0.0f,custom_particle:{type:"minecraft:block",block_state:"minecraft:air"},CustomName:"gm4_pl_random_witch_init",Tags:["gm4_pl_random_witch_init","gm4_lt_random_harming"]}

kill @e[type=area_effect_cloud,limit=3,distance=..1,tag=gm4_pl_random_witch_init,sort=random]

execute if entity @e[type=area_effect_cloud,tag=gm4_pl_random_witch_init,tag=gm4_lt_random_regeneration] run function gm4_potion_liquids:liquid_init/regeneration
execute if entity @e[type=area_effect_cloud,tag=gm4_pl_random_witch_init,tag=gm4_lt_random_swiftness] run function gm4_potion_liquids:liquid_init/swiftness
execute if entity @e[type=area_effect_cloud,tag=gm4_pl_random_witch_init,tag=gm4_lt_random_fire_resistance] run function gm4_potion_liquids:liquid_init/fire_resistance
execute if entity @e[type=area_effect_cloud,tag=gm4_pl_random_witch_init,tag=gm4_lt_random_harming] run function gm4_potion_liquids:liquid_init/harming

kill @e[type=area_effect_cloud,tag=gm4_pl_random_witch_init]
