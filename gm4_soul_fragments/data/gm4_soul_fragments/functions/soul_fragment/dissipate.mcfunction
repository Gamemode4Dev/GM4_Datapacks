#@s = soul fragment that is dissipating (@e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment] at @s)
#from soul_fragment/sustain

particle minecraft:soul ~ ~.5 ~ .7 0 .7 .01 5 force
playsound minecraft:block.beacon.ambient master @a[distance=..32] ~ ~ ~ .5 2
kill @s
