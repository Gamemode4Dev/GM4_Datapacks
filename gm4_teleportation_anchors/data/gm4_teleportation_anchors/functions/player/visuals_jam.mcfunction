# @s = player that was jammed
# run from player/find_aec

particle minecraft:angry_villager ~ ~1.3 ~ 0.3 0.2 0.3 1 5
effect give @s blindness 2 0 true
effect give @s levitation 1 255 true
particle minecraft:block chorus_plant ~ ~0.5 ~ 0 0 0 0 20 force
playsound minecraft:block.chorus_flower.death player @a[distance=..8] ~ ~ ~ 100 1.3
