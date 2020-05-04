#@s = a player near a squid in water
#run from main

effect give @s nausea 5
effect give @s blindness 5
playsound entity.squid.hurt hostile @a[distance=..5] ~ ~ ~ 1 2
particle squid_ink ^ ^ ^.5 .1 0 .1 0.05 10 normal @s
advancement grant @s only gm4:ink_spitting_squid
