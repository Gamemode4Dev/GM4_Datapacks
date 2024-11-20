# @s = player that teleported to an anchor
# run from player/move_player

playsound minecraft:item.chorus_fruit.teleport block @a[distance=..8] ~ ~ ~ 1 0.3
particle minecraft:portal ~ ~0.5 ~ 0.2 0.6 0.2 0.01 100
particle minecraft:explosion ~ ~ ~ 0 0 0 0 0
