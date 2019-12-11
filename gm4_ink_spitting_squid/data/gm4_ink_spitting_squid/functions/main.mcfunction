execute as @a[gamemode=!spectator] at @s if block ~ ~1 ~ water if entity @e[type=squid,distance=..2.2] run function ink_spitting_squid:squid_squirt

schedule function ink_spitting_squid:main 16t
