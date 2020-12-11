# @s = player that teleported to an anchor
# run from player/find_aec

playsound minecraft:item.chorus_fruit.teleport block @a[distance=..8] ~ ~ ~ 1 0.3
effect give @s blindness 2 0 true
effect give @s levitation 1 255 true
particle minecraft:portal ~ ~0.5 ~ 0.2 0.6 0.2 0.01 100
particle minecraft:explosion ~ ~ ~ 0 0 0 0 0
