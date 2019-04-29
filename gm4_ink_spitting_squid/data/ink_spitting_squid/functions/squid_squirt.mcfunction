#@s = a player near a squid in water
effect give @s nausea 5 0
effect give @s blindness 5 0
playsound minecraft:entity.squid.hurt master @a[distance=..2.2] ~ ~ ~ 1 2
advancement grant @s only gm4:ink_spitting_squid
