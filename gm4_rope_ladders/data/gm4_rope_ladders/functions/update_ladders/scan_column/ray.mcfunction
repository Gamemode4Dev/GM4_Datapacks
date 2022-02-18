# scans blocks below the ladder until it runs out of ladders
# @s = freshly dropped ladder item
# positon of ladder (moving downward)
# run from function gm4_rope_ladders:update_ladders/scan_column/init

scoreboard players set $ray_stop gm4_rol_data 1

execute if block ~ ~ ~ ladder[facing=east] if block ~-1 ~ ~ air run function gm4_rope_ladders:update_ladders/break_ladder
execute if block ~ ~ ~ ladder[facing=west] if block ~1 ~ ~ air run function gm4_rope_ladders:update_ladders/break_ladder
execute if block ~ ~ ~ ladder[facing=south] if block ~ ~ ~-1 air run function gm4_rope_ladders:update_ladders/break_ladder
execute if block ~ ~ ~ ladder[facing=north] if block ~ ~ ~1 air run function gm4_rope_ladders:update_ladders/break_ladder

scoreboard players add $ray gm4_rol_data 1
execute if score $ray gm4_rol_data matches 0..64 unless score $ray_stop gm4_rol_data matches 1 if block ~ ~-1 ~ ladder positioned ~ ~-1 ~ run function gm4_rope_ladders:update_ladders/scan_column/ray
