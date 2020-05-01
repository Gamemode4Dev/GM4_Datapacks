#@s = a player near a squid in water
#run from main

effect give @s nausea 5
effect give @s blindness 5
playsound minecraft:entity.squid.hurt hostile @a[distance=..5] ~ ~ ~ 1 2
advancement grant @s only gm4:ink_spitting_squid
