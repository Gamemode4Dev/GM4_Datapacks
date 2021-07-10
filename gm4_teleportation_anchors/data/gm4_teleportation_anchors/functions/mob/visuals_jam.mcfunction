# @s = mob that was prevented from teleporting
# run from mob/move_mob

execute if entity @s[type=enderman] run particle minecraft:angry_villager ~ ~2.3 ~ 0.3 0.2 0.3 1 5
execute if entity @s[type=shulker] run particle minecraft:angry_villager ~ ~0.8 ~ 0.3 0.2 0.3 1 5
particle minecraft:block chorus_plant ~ ~0.5 ~ 0 0 0 0 20 force
playsound minecraft:block.chorus_flower.death hostile @a[distance=..8] ~ ~ ~ 10 1.3
