#@s = a player near a glow squid in water
#run from main

effect give @s glowing 5
effect give @s night_vision 5
playsound minecraft:entity.glow_squid.hurt hostile @a[distance=..5] ~ ~ ~ 1 2
particle minecraft:glow_squid_ink ^ ^ ^.5 .1 0 .1 0.05 10 normal @s
advancement grant @s only gm4:glow_ink_spitting_squid
