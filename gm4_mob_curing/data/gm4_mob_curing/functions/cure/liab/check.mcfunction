# Checks Lightning in a Bottle-specific entity reverting
# run from main

execute at @e[type=item,nbt={Item:{id:"minecraft:totem_of_undying"}},limit=1,sort=random] as @e[type=illusioner,distance=..1.5,limit=1,nbt={ActiveEffects:[{Id:1b}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/liab/illusioner
execute at @e[type=item,nbt={Item:{id:"minecraft:crossbow"}},limit=1,sort=random] as @e[type=evoker,distance=..1.5,limit=1,nbt={ActiveEffects:[{Id:2b,Amplifier:3b}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/liab/evoker
