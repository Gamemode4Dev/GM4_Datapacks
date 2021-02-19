# @s = angry soul fragment
# at @s
# from main

playsound minecraft:entity.ghast.ambient master @a[distance=..10] ~ ~ ~ .05 .1
particle minecraft:soul ~ ~.65 ~ .05 0 .05 .03 3 normal

scoreboard players add @s gm4_sf_timer 1
execute if entity @s[scores={gm4_sf_timer=20..}] run data merge entity @s {Health:0.0f,DeathTime:19s}
