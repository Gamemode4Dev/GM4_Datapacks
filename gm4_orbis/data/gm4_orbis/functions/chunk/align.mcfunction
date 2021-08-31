execute store result entity @s Pos[0] double 16 run data get entity @s Pos[0] 0.0625
execute store result entity @s Pos[2] double 16 run data get entity @s Pos[2] 0.0625
# if there already was a marker for that chunk, kill the new one
execute at @s if entity @e[type=marker,tag=gm4_chunk,distance=..1] run kill @s
data merge entity @s {Tags:["gm4_chunk"]}
