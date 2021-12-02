#execute on red mushrooms to check for cows around them
execute at @e[type=item,nbt={Item:{id:"minecraft:red_mushroom"}},limit=1,sort=random] if entity @e[type=item,distance=..1.5,limit=1,nbt={Item:{id:"minecraft:brown_mushroom"}}] as @e[type=cow,distance=..1.5,limit=1,nbt={ActiveEffects:[{Id:2b}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/mooshroom
execute at @e[type=item,nbt={Item:{id:"minecraft:golden_carrot"}},limit=1,sort=random] as @e[type=zombified_piglin,distance=..1.5,limit=1] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/zombified_check
execute at @e[type=item,nbt={Item:{id:"minecraft:golden_carrot"}},limit=1,sort=random] as @e[type=zoglin,distance=..1.5,limit=1,nbt={ActiveEffects:[{Id:1b}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/zoglin
execute at @e[type=item,nbt={Item:{id:"minecraft:golden_apple"}},limit=1,sort=random] as @e[type=witch,distance=..1.5,limit=1,nbt={ActiveEffects:[{Id:18b}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/witch

execute if score gm4_lightning_in_a_bottle load.status matches 1 run function gm4_mob_curing:cure/liab/check

schedule function gm4_mob_curing:main 16t
