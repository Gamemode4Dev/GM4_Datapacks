# summon a chunk marker and align it to the chunk grid
summon area_effect_cloud ~ 0 ~ {Tags:["orbis_chunk","orbis_init"],Duration:2000000000}
execute store result entity @e[tag=orbis_chunk,tag=orbis_init,limit=1] Pos[0] double 16 run data get entity @s Pos[0] 0.0625
execute store result entity @e[tag=orbis_chunk,tag=orbis_init,limit=1] Pos[2] double 16 run data get entity @s Pos[2] 0.0625
# if there already was a marker for that chunk, kill the new one
execute at @e[tag=orbis_chunk,tag=orbis_init] if entity @e[tag=orbis_chunk,tag=!orbis_init,distance=..1] run kill @e[tag=orbis_chunk,tag=orbis_init]
tag @e[tag=orbis_chunk,tag=orbis_init] remove orbis_init
