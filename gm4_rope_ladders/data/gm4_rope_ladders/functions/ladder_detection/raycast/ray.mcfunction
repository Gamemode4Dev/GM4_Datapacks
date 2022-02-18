
execute if block ~ ~ ~ ladder align xyz positioned ~.5 ~ ~.5 if block ~ ~-1 ~ air run function gm4_rope_ladders:ladder_detection/found_ladder
execute if block ~ ~ ~ ladder align xyz positioned ~.5 ~ ~.5 unless block ~ ~1 ~ ladder run function gm4_rope_ladders:ladder_detection/found_ladder

scoreboard players add $ray gm4_rol_data 1
execute if score $ray gm4_rol_data matches 0..700 positioned ^ ^ ^.01 run function gm4_rope_ladders:ladder_detection/raycast/ray
