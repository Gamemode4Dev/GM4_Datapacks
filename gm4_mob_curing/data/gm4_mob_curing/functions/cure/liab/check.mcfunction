# Checks Lightning in a Bottle-specific entity reverting
# @s = item
# at @s
# run from check_item

execute if entity @s[nbt={Item:{id:"minecraft:totem_of_undying"}}] as @e[type=illusioner,tag=!smithed.entity,distance=..1.5,limit=1,nbt={ActiveEffects:[{Id:1}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/liab/illusioner
execute if entity @s[nbt={Item:{id:"minecraft:crossbow"}}] as @e[type=evoker,tag=!smithed.entity,distance=..1.5,limit=1,nbt={ActiveEffects:[{Id:2,Amplifier:3b}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/liab/evoker
