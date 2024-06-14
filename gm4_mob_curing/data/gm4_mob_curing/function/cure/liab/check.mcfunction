# Checks Lightning in a Bottle-specific entity reverting
# @s = item
# at @s
# run from check_item

execute if items entity @s contents minecraft:totem_of_undying as @e[type=illusioner,tag=!smithed.entity,distance=..1.5,limit=1,nbt={active_effects:[{id:'minecraft:speed'}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/liab/illusioner
execute if items entity @s contents minecraft:crossbow as @e[type=evoker,tag=!smithed.entity,distance=..1.5,limit=1,nbt={active_effects:[{id:'minecraft:slowness',amplifier:3b}]}] unless data entity @s NoAI at @s run function gm4_mob_curing:cure/liab/evoker
