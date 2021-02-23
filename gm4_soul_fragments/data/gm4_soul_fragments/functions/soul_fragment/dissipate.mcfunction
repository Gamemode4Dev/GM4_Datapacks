# @s = soul fragment that is dissipating
# at @s
# from soul_fragment/process

particle minecraft:soul ~ ~.5 ~ .7 0 .7 .01 5 normal
playsound minecraft:block.chorus_flower.grow player @a[distance=..10] ~ ~ ~ .9 1.5

kill @s
