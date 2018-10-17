# summon a chunk marker and align it to the chunk grid
summon area_effect_cloud ~ 0 ~ {Tags:["gm4_chunk","init"],Duration:2000000000}
execute store result entity @e[tag=gm4_chunk,tag=init,limit=1] Pos[0] double 16 run data get entity @s Pos[0] 0.0625
execute store result entity @e[tag=gm4_chunk,tag=init,limit=1] Pos[2] double 16 run data get entity @s Pos[2] 0.0625
# if there already was a marker for that chunk, kill the new one
execute at @e[tag=gm4_chunk,tag=init] if entity @e[tag=gm4_chunk,tag=!init,distance=..1] run kill @e[tag=gm4_chunk,tag=init]
tag @e[tag=gm4_chunk,tag=init] remove orbis_init
