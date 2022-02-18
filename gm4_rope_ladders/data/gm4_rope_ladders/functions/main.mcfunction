
schedule function gm4_rope_ladders:main 16t

execute as @a at @s run function gm4_rope_ladders:as_player

execute as @e[type=wandering_trader,tag=gm4_rol_rcd_ladder] at @s run function gm4_rope_ladders:as_rcd
