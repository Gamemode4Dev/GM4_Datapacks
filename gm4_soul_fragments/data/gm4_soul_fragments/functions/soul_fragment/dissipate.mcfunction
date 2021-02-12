# @s = soul fragment that is dissipating
# at @s
# from soul_fragment/sustain

particle minecraft:soul ~ ~.5 ~ .7 0 .7 .01 5 normal
playsound minecraft:block.beacon.ambient player @a[distance=..10] ~ ~ ~ .5 2

kill @s
