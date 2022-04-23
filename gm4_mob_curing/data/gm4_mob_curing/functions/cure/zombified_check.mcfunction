# check potion effect of zombified piglin
# @s = zombified piglin with golden carrot nearby
# at @s
# run from main

execute if entity @s[nbt={ActiveEffects:[{Id:18b}]}] run function gm4_mob_curing:cure/zombified_piglin
execute if entity @s[nbt={ActiveEffects:[{Id:1b}]}] run function gm4_mob_curing:cure/zombified_pig
