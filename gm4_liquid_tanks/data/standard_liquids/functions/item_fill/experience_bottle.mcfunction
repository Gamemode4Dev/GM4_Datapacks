replaceitem block ~ ~ ~ container.0 experience_bottle 1
scoreboard players remove @s gm4_lt_buffer 9
tag @s add gm4_lt_fill

advancement grant @a[distance=..4,gamemode=!spectator] only gm4:standard_liquids
