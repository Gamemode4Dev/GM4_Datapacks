execute store result entity @s Pos[0] double 1 run scoreboard players get x gm4_orbis_config
execute store result entity @s Pos[2] double 1 run scoreboard players get z gm4_orbis_config
execute at @s run tp @a[gamemode=spectator] ~8.0 99 ~8.0

execute at @s run function orbis:chunk/init
execute at @s positioned ~ 99 ~ as @e[type=area_effect_cloud,tag=gm4_chunk,tag=!gm4_generated,distance=..100] at @s if block ~ ~ ~ bedrock run function orbis:chunk/generate
