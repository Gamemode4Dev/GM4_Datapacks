# check potion effect of zombified piglin
# @s = zombified piglin with golden carrot nearby
# at @s
# run from main

execute if entity @s[nbt={active_effects:[{id:'minecraft:weakness'}]}] run function gm4_mob_curing:cure/zombified_piglin
execute if entity @s[nbt={active_effects:[{id:'minecraft:speed'}]}] run function gm4_mob_curing:cure/zombified_pig
