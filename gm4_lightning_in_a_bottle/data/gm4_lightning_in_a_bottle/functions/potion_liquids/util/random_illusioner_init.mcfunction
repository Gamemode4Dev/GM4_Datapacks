# @s = liquid tank to be initialized to random potion
# run from gm4_lightning_in_a_bottle:potion_liquids/util/illusioner

summon marker ~ ~ ~ {CustomName:"\"gm4_pl_random_illusioner_init\"",Tags:["gm4_pl_random_illusioner_init","gm4_lt_random_invisibility"]}
summon marker ~ ~ ~ {CustomName:"\"gm4_pl_random_illusioner_init\"",Tags:["gm4_pl_random_illusioner_init","gm4_lt_random_blindness"]}
summon marker ~ ~ ~ {CustomName:"\"gm4_pl_random_illusioner_init\"",Tags:["gm4_pl_random_illusioner_init","gm4_lt_random_night_vision"]}

kill @e[type=marker,limit=2,distance=..1,tag=gm4_pl_random_illusioner_init,sort=random]

execute if entity @e[type=marker,tag=gm4_pl_random_illusioner_init,tag=gm4_lt_random_invisibility] run function gm4_potion_liquids:liquid_init/invisibility
execute if entity @e[type=marker,tag=gm4_pl_random_illusioner_init,tag=gm4_lt_random_blindness] run function gm4_lightning_in_a_bottle:potion_liquids/liquid_init/blindness
execute if entity @e[type=marker,tag=gm4_pl_random_illusioner_init,tag=gm4_lt_random_night_vision] run function gm4_potion_liquids:liquid_init/night_vision

kill @e[type=marker,tag=gm4_pl_random_illusioner_init]
