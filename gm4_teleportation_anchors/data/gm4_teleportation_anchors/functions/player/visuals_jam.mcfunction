# @s = player that was jammed
# run from player/move_player

execute positioned ~ ~1.3 ~ run particle minecraft:angry_villager ^ ^ ^0.7 0.4 0.4 0.4 1 5 force
particle minecraft:block chorus_plant ~ ~0.5 ~ 0 0 0 0 20 force
playsound minecraft:block.chorus_flower.death player @a[distance=..8] ~ ~ ~ 100 1.3
