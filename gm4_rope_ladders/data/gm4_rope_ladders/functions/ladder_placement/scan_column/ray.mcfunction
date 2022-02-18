
execute if block ~ ~ ~ #gm4_rope_ladders:valid_replace run function gm4_rope_ladders:ladder_placement/place_ladder

scoreboard players add $ray gm4_rol_data 1
execute if score $ray gm4_rol_data matches 0..64 if block ~ ~-1 ~ #gm4_rope_ladders:ladder_scan positioned ~ ~-1 ~ run function gm4_rope_ladders:ladder_placement/scan_column/ray
