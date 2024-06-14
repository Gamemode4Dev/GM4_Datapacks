# checks items and nearby items or entities for valid cure attempts
# @s = any item
# at @s
# run from main

execute if items entity @s contents minecraft:red_mushroom if items entity @e[type=item,distance=..1.5] contents minecraft:brown_mushroom as @e[type=cow,tag=!smithed.entity,distance=..1.5,limit=1,nbt={active_effects:[{id:'minecraft:slowness'}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/mooshroom
execute if items entity @s contents minecraft:golden_carrot as @e[type=zombified_piglin,tag=!smithed.entity,distance=..1.5,limit=1] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/zombified_check
execute if items entity @s contents minecraft:golden_carrot as @e[type=zoglin,tag=!smithed.entity,distance=..1.5,limit=1,nbt={active_effects:[{id:'minecraft:speed'}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/zoglin
execute if items entity @s contents minecraft:golden_apple as @e[type=witch,tag=!smithed.entity,distance=..1.5,limit=1,nbt={active_effects:[{id:'minecraft:weakness'}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/witch
execute if score gm4_lightning_in_a_bottle load.status matches 1.. run function gm4_mob_curing:cure/liab/check
