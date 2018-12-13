execute store result entity @s Pos[0] double 1 run scoreboard players get x gm4_orbis_config
execute store result entity @s Pos[2] double 1 run scoreboard players get z gm4_orbis_config
execute at @s run tp @a[tag=!gm4_orbis_disabled] ~8.0 99 ~8.0

execute at @s run function orbis:chunk/init
execute at @s as @e[type=area_effect_cloud,tag=gm4_chunk,tag=!gm4_generated,sort=nearest,limit=1,distance=..100] at @s if block ~ ~ ~ bedrock run function orbis:chunk/generate
